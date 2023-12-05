const tbody = $('.tbody');
let id;
let tr;


fetch("/api/product/getProducts")
.then(res => res.json())
.then(res => {
    displayProduct(res.data);
})
.catch(err => console.log(err));


function displayProduct(arr) {
    tbody.empty();
    arr.map(p => {
       let html = `<tr>
                                        <td>
                                            <h2 class="table-avatar">
                                                <a href="#" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="${p.imageUrl}" alt="User Image"></a>
                                                <a class="name" href="#">${p.productName}</a>
                                            </h2>
                                        </td>
                                        <td class="price">${p.price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</td>
                                        <td class="description-cell">${truncateDescription(p.description,50)}</td>
                                        <td class="category">${p.category}</td>
                                        <td class="sub-category">${p.subCategory}</td>
                                        <td style="display: none" class="id">${p.id}</td>
                                        <td class="size">${p.size}</td>
                                        <td class="text-end">
                                            <div class="actions">
                                                <a href="#" class="btn btn-sm bg-success-light me-2" onclick="updateProduct(this)">
                                                    <i class="fe fe-pencil"></i>
                                                </a>
                                                <a href="#" class="btn btn-sm bg-danger-light" onclick="confirmDelete(this)" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                    <i class="fe fe-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>`
        tbody.append(html);
    });
}

//search
let setTimer;
$("#search").on("input", ()=> {
    let inputValue = $("#search").val();
    clearTimeout(setTimer);
    setTimer = setTimeout(() => {
        $.ajax({
            type: "GET",
            url: `/api/product/get-list-search?keywords=${inputValue}`,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                console.log(data)
                // Xử lý dữ liệu trả về ở đây
                displayProduct(data.data.listSearch);
            },
            error: function (error) {
                // Xử lý lỗi nếu có
                console.error("Error:", error);
            }
        });
    }, 600);
})

//add product
$(".btn-add-product").on('click', () => {
    console.log(34)
    if(validateForm()) {
        let form = document.getElementById("from-add-product");
        let formData = new FormData(form);

        // Make an AJAX call to the API endpoint
        fetch(form.action, {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                console.log(data.data);
                // Assuming data contains the added product details
                if(data.statusCode === 200)
                    $("#addProductModal").modal('hide');
                let html = `<tr>
                                        <td>
                                            <h2 class="table-avatar">
                                                <a href="#" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="${data.data.imageUrl}" alt="User Image"></a>
                                                <a href="#">${data.data.productName}</a>
                                            </h2>
                                        </td>
                                        <td>${data.data.price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</td>
                                        <td class="description-cell">${truncateDescription(data.data.description.trim(),50)}</td>
                                        <td>${data.data.category}</td>
                                        <td>${data.data.subCategory}</td>
                                        <td style="display: none" class="id">${data.data.id}</td>
                                        <td>${data.data.size}</td>
                                        <td class="text-end">
                                            <div class="actions">
                                                <a href="#" class="btn btn-sm bg-success-light me-2">
                                                    <i class="fe fe-pencil"></i>
                                                </a>
                                                <a href="#" class="btn btn-sm bg-danger-light" onclick="confirmDelete(this)" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                    <i class="fe fe-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>`
                $(html).appendTo(tbody);
            })
            .catch(error => console.error('Error:', error));
    }
})

$('#category').on('change', function () {
    // Get the selected category value
    let selectedCategory = $(this).val();

    // Make an AJAX call to the /get-sub-category API
    $.ajax({
        type: 'GET',
        url: '/api/product/get-sub-category',
        data: { category: selectedCategory },
        success: function (response) {
            // Update the sub-category select options
            let subCategories = response.data.subCategory;
            let subCategorySelect = $('#sub-category');

            // Clear existing options
            subCategorySelect.empty();

            // Add new options based on the API response
            $.each(subCategories, function (index, subCategory) {
                subCategorySelect.append('<option value="' + subCategory + '">' + subCategory + '</option>');
            });
        },
        error: function (error) {
            console.error('Error fetching sub-categories:', error);
        }
    });
});

$('#category-update').on('change', function () {
    // Get the selected category value
    let selectedCategory = $(this).val();

    // Make an AJAX call to the /get-sub-category API
    $.ajax({
        type: 'GET',
        url: '/api/product/get-sub-category',
        data: { category: selectedCategory },
        success: function (response) {
            // Update the sub-category select options
            let subCategories = response.data.subCategory;
            let subCategorySelect = $('#sub-category-update');

            // Clear existing options
            subCategorySelect.empty();

            // Add new options based on the API response
            $.each(subCategories, function (index, subCategory) {
                subCategorySelect.append('<option value="' + subCategory + '">' + subCategory + '</option>');
            });
        },
        error: function (error) {
            console.error('Error fetching sub-categories:', error);
        }
    });
});

function updateProduct(element) {
    event.preventDefault();
    tr = $(element).closest("tr");
    id = tr.find(".id").text();
    $("#product-name-update").val(tr.find(".name").text());
    $("#price-update").val(parseInt(tr.find(".price").text().replace("đ", "") )* 1000);
    $("#size-update").val(tr.find(".size").text());
    $("#updateProductModal").modal('show');

}

function confirmUpdate() {
    const data = {
        id: id,
        productName: $("#product-name-update").val(),
        price: $("#price-update").val(),
        size: $("#size-update").val(),

    };
    const category = $("#category-update").val();
    const subCategory = $("#sub-category-update").val();
    const description = $("#description-update").val();
    if(category !== "Bánh kem" && subCategory !== "Bánh cho trẻ em") {
        data.category = category;
        data.subCategory = subCategory;
    }
    if(description !== "") data.description = description;

    fetch("/api/admin/update", {
        method: "POST",
        headers: {
            'Content-Type': 'application/json',
            /*'X-CSRF-TOKEN': $(".csrf").val(),*/
        },
        body: JSON.stringify(data),
    })
        .then(res => res.json())
        .then(data => {
            if(data.statusCode === 200)
            {
                console.log(data.data)
                tr.find(".name").text(data.data.productName);
                tr.find(".price").text(data.data.price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }));
                tr.find(".size").text(data.data.size);
                tr.find(".category").text(data.data.category);
                tr.find(".sub-category").text(data.data.subCategory);
                $("#updateProductModal").modal('hide');
            }

        })
        .catch(err => console.log(err))

}

function confirmDelete(element) {
    tr = $(element).closest("tr");
    id = tr.find(".id").text();
    console.log(id);

}

function removeProduct() {
    $.ajax({
        url: "/api/admin/delete-product/" + id,
        type: "DELETE",
        success: function(data) {
            // Handle success, e.g., reload the page
            $("#exampleModal").modal('hide');
            tr.remove();
        },
        error: function(error) {
            // Handle error, display a message, etc.
            alert("Error deleting product. Please try again.");
        }
    });
}

function truncateDescription(description, maxLength) {
    if (description!== null &&description.trim().length > maxLength) {
        return description.substring(0, maxLength) + '...';
    }
    return description;
}

function validateForm() {
    let productName = document.getElementById("product-name").value;
    let price = document.getElementById("price").value;
    let category = document.getElementById("category").value;
    let subCategory = document.getElementById("sub-category").value;
    let size = document.getElementById("size").value;
    let imageInput = document.getElementById("product-images");
    let description = document.getElementById("description").value;
    // Validate product name
    if (productName.trim() === "") {
        showMessage("Vui lòng nhập tên sản phẩm");
        return false;
    }

    // Validate price (assuming it should be a positive number)
    if (isNaN(price) || parseFloat(price) <= 0) {
        showMessage("Vui lòng nhập giá sản phẩm hợp lệ");
        return false;
    }

    // Validate category
    if (category.trim() === "") {
        showMessage("Vui lòng chọn danh mục");
        return false;
    }

    // Validate sub-category
    if (subCategory.trim() === "") {
        showMessage("Vui lòng chọn danh mục con");
        return false;
    }

    if (description.trim() === "") {
        showMessage("Vui lòng nhập mô tả cho sản phẩm");
        return false;
    }

    // Validate size
    if (size.trim() === "") {
        showMessage("Vui lòng chọn kích thước");
        return false;
    }

    // Validate image input (assuming at least one image is required)
    if (imageInput.files.length === 0) {
        showMessage("Vui lòng chọn ít nhất một ảnh sản phẩm");
        return false;
    }

    return true;
}

function showMessage(message) {
    alert(message);
}