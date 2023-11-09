$("a[href='#top']").click(function() {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
});
$(window).scroll(function () {
    if ($(window).scrollTop() >=200) {
        $('#go_top').show();
    }
    else {
        $('#go_top').hide();
    }
});


const divWapper = $(".row_13");


//fetch api to get best sale product
fetch("http://localhost:8080/api/product/get-bestsale-product")
.then(res => res.json())
.then(res => {
    console.log(res)
    res.data.list.map(product => {
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
})
.catch(err => console.log(err))


// add product to cart
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
