//set trạng thái trang hiện tại
// khi trang load xog
$(window).on("load", function() {
    let activePageIndex = localStorage.getItem("activePageIndex");
    if (activePageIndex) {
        $(".page-index").removeClass("active");

        $(`.page-number li a:contains(${activePageIndex})`).closest("li").addClass("active");
        localStorage.clear();
    }
});

//các biến cần thiết
let subCategory;   //danh mục con
let currentProducts; //số lượng sản phẩm theo category
let pageCurrentProducts;
let productSubCategory; // số lượng sản phẩm theo sub category
//url của trang hiện tại
let path = window.location.pathname;


const regex = /\/([^\/]+)\/?$/;
let lastSegment = path.match(regex)[1];
let pageIndex= localStorage.getItem("activePageIndex");
//nếu pageIndex null, gán bằng 1
pageIndex = pageIndex ?? 1;
// url trả về sản phẩm theo phân trang
const apiForPage = `http://localhost:8080/api/product/get-product-by-category/${lastSegment}?pageIndex=${pageIndex}`;


//lấy thẻ div chứa các sản phẩm
const divWapper = $(".row_13");



//fetch data theo category and pageIndex
fetch(apiForPage)
    .then(response => {
        if (!response.ok) {
            throw new Error(`Network response was not ok: ${response.statusText}`);
        }
        return response.json();
    })
    .then(data => {
        console.log(data)
        // Lưu dữ liệu vào biến globalData
        pageCurrentProducts = data.data.pageListProduct;
        currentProducts = data.data.listByCategory;
        numberPage(Math.ceil(data.totalRecords/9));
        //console.log(Math.ceil(currentProducts.length/9));
    })
    .catch(error => {
        // Xử lý lỗi ở đây
        console.log('Fetch error:'+  error);
    });





//lấy sub category
function getProductBySubCategory(element) {
    event.preventDefault();
    //subCategory
    subCategory = element.getAttribute("href").match(regex)[1];
    console.log(subCategory);
    // const dataAPI =  await fetchDataFromApi(apiUrl);
    // currentProducts = dataAPI.data;

    //xoá tất cả class is-active
    $(".sub-category").removeClass("is-active-sub-category");
    // thêm vào phần tử vừa click
    $(element).addClass("is-active-sub-category");
    //data theo subcategory
    productSubCategory = currentProducts.filter(p =>  p.subCategory === subCategory);
    //tính toán số page
    numberPage(Math.ceil(productSubCategory.length/9));
    displayProduct(productSubCategory);
}


//sort theo giá
function applyFilter(filterType) {
    event.preventDefault();
    let productsToDisplay = subCategory ? productSubCategory : pageCurrentProducts;

    switch (filterType) {
        case 'lowToHigh':
            productsToDisplay.sort((a, b) => a.price - b.price);
            break;
        case 'highToLow':
            productsToDisplay.sort((a, b) => b.price - a.price);
            break;
        // Thêm các loại filter khác
        default:
            break;
    }

    displayProduct(productsToDisplay);
}

//sort theo size
function filterBySize(size, event) {
    event.preventDefault();
    console.log(subCategory)
    let productsToDisplay = subCategory ? productSubCategory : pageCurrentProducts;
    if(size !== "all")
        productsToDisplay = productsToDisplay.filter(p => p.size === size);
    console.log(productsToDisplay)
    displayProduct(productsToDisplay);
}

//các sự kiện click
$('.low-to-high-filter').click(() => applyFilter('lowToHigh'));
$('.high-to-low-filter').click(() => applyFilter('highToLow'));
$('.all-size-filter').click(event => filterBySize('all', event));
$('.size-s-filter').click(event => filterBySize('S', event));
$('.size-m-filter').click(event => filterBySize('M', event));
$('.size-l-filter').click(event => filterBySize('L', event));

//hiển thị sản phẩm theo filter
function displayProduct(arr) {
    divWapper.empty();
    arr.map(product => {
        const div = `<div class="col-md-4 col-sm-4 col-xs-6 col-480-12">
                            <div class="row_2">
                                <div class="box_prod clearfix">
                                    <a href="/product/get-detail/${product.id}" class="/assets/img_prod fadeInDown wow prod_h_1"><img class="w_100" src="${product.imageUrl}" alt=""/></a>
                                    <div class="clearfix"></div>
                                    <div class="sub_prod clearfix">
                                        <div class="price_prod fadeInLeft wow">${product.price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</div>
                                        <h3 class="name_prod fadeInRight wow"><a href="">${product.productName}</a></h3>
                                        <div class="clearfix clearfix-5"></div>
                                        <a href="" data-target="${product.id}" class="add_prod_cart fadeInUp wow" onclick="addProductToCart(this)">Thêm vào giỏ hàng +</a>
                                    </div>
                                </div>
                            </div>
                        </div>`

        divWapper.append(div);
    })
}


//chuyển đến page tương ứng
function goToPage(element) {
    event.preventDefault();

    //lưu phần tử chứa class active vào local
    let pageIndex = element.textContent;
    localStorage.setItem("activePageIndex", pageIndex);
    window.location = path+ `?pageIndex=${pageIndex}`;
}

//tính toán số trang
//nếu number== 1 thì chỉ có một trang

//chia trang trang cho sản phẩm theo sub Category
function numberPage(number) {
    let li;
    const wrapperLi = $(".page-number");
    if(number===1) {

        li = `<li class="active"><a href="">1</a></li>`;
        wrapperLi.empty();
        wrapperLi.append(li)
        return;
    }
    wrapperLi.empty(); //làm rỗng
    for (let i = 1; i <= number; i++) {
        if(i===1)  li = `<li class="page-index active"><a  href="" onclick="goToPage(this)">${i}</a></li>`
        else
            li = `<li class="page-index"><a href="" onclick="goToPage(this)">${i}</a></li>`

        wrapperLi.append(li)
    }

}

//add produc to shopping cart
function addProductToCart(element) {
    event.preventDefault();
    const userName = $(".user-name").text();
    if(userName === "") {
        alert("Vui lòng đăng nhập để mua hàng.")
        return;
    }
    const quantityProduct = $(".cart-count");
    const currentQuantity = parseInt(quantityProduct.text(), 10) || 0; // Parse as integer, default to 0 if not a valid number
    quantityProduct.text(currentQuantity + 1);

    const idProduct = element.dataset.target;
    const data = {
        idProduct: idProduct,
        userName: userName,
        quantity: "1"
    }

    fetch("/api/product/add-product-to-cart", {
        method: "POST",
        headers: {
            'X-CSRF-TOKEN': $(".csrf").val(),
            "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
    })
        .then(res => res.json())
        .then(data => {
            console.log(data);
        })
        .catch(err => console.log(err))

}


