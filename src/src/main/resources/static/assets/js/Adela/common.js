function displayProduct(arr, divWapper) {
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

export {displayProduct, numberPage}
