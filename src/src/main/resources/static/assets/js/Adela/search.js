// hiển thị lại page index hiện tại
// $(window).on("load", function() {
//     let activePageIndex = localStorage.getItem("activePageIndex");
//     console.log(activePageIndex)
//     if (activePageIndex) {
//         $(".page-index").removeClass("active");
//
//         $('.page-number li a').filter((index, element) => $(element).text().trim() === activePageIndex).closest('li').addClass('active');
//
//         localStorage.clear();
//     }
// });

const divWapper = $(".row_13");

let pageCurrentProducts;
let totalProducts;
// path của đường dẫn hiện tại
let path = window.location.pathname
// lấy url hiện tại
let currentURL = new URL(window.location.href);
//lấy giá trị keyword
const keywords = currentURL.searchParams.get("keywords");
console.log(keywords)
let pageIndex= localStorage.getItem("activePageIndex");
//nếu pageIndex null, gán bằng 1
pageIndex = pageIndex ?? 1;

let urlAPI = `http://localhost:8080/api/product/get-list-search?keywords=${keywords}&pageIndex=${pageIndex}`;
fetch(urlAPI)
    .then(res => res.json())
    .then(res => {
        console.log(res)
        pageCurrentProducts = res.data.pageListProduct;
        totalProducts = res.data.listSearch;
        numberPage(Math.ceil(res.totalRecords/9));
        displayProduct(pageCurrentProducts);
    })
    .catch(err => console.log(err))



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
                                        <a href="" class="add_prod_cart fadeInUp wow">Thêm vào giỏ hàng +</a>
                                    </div>
                                </div>
                            </div>
                        </div>`

        divWapper.append(div);
    })
}




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

function applyFilter(filterType) {
    event.preventDefault();
    let productsToDisplay = pageCurrentProducts;

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


function filterBySize(size, event) {
    event.preventDefault();
    let productsToDisplay = pageCurrentProducts;
    if(size !== "all")
        productsToDisplay = productsToDisplay.filter(p => p.size === size);
    console.log(productsToDisplay)
    displayProduct(productsToDisplay);
}

$('.low-to-high-filter').click(() => applyFilter('lowToHigh'));
$('.high-to-low-filter').click(() => applyFilter('highToLow'));
$('.all-size-filter').click(event => filterBySize('all', event));
$('.size-s-filter').click(event => filterBySize('S', event));
$('.size-m-filter').click(event => filterBySize('M', event));
$('.size-l-filter').click(event => filterBySize('L', event));

// click chuyển trang
function goToPage(element) {
    event.preventDefault();

    //lưu phần tử chứa class active vào local
    let pageIndex = element.textContent;
    //vị trí bắt đầu
    const from = (pageIndex- 1)* 9;
    //vị trí kết thúc
    const to = Math.min(from+9, totalProducts.length)
    const productsShow = totalProducts.slice(from, to);
    //chuyển class active vào page hiện tại
    $(".page-index").removeClass("active");

    $('.page-number li a').filter((index, element) => $(element).text().trim() === pageIndex).
                                    closest('li').addClass('active');
    displayProduct(productsShow);
    // localStorage.setItem("activePageIndex", pageIndex);
    // window.location = path+`?keyword=${keywords}`+ `&pageIndex=${pageIndex}`;
}