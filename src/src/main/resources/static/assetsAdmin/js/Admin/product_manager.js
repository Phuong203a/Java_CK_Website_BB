const tbody = $('.tbody');


fetch("/api/product/getProducts")
.then(res => res.json())
.then(res => {
    displayProduct(res.data);
})
.catch(err => console.log(err));


function displayProduct(arr) {
    arr.map(p => {
       let html = `<tr>
                                        <td>
                                            <h2 class="table-avatar">
                                                <a href="#" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="${p.imageUrl}" alt="User Image"></a>
                                                <a href="#">${p.productName}</a>
                                            </h2>
                                        </td>
                                        <td>${p.price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</td>
                                        <td class="description-cell">${truncateDescription(p.description.trim(),50)}</td>
                                        <td>${p.category}</td>
                                        <td>${p.subCategory}</td>
                                        <td>${p.size}</td>
                                        <td class="text-end">
                                            <div class="actions">
                                                <a href="#" class="btn btn-sm bg-success-light me-2">
                                                    <i class="fe fe-pencil"></i>
                                                </a>
                                                <a href="#" class="btn btn-sm bg-danger-light">
                                                    <i class="fe fe-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>`
        tbody.append(html);
    });
}

function truncateDescription(description, maxLength) {
    if (description.length > maxLength) {
        return description.substring(0, maxLength) + '...';
    }
    return description;
}