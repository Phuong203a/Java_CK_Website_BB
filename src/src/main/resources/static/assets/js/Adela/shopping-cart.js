const quantityProduct = $(".cart-count");

const totalPrice = $('.money-to-pay');
// calc the money to pay
const moneyElements = $(".plus_price_cart");

// Use map to extract the numeric values and convert them to numbers
const moneyArray = moneyElements.map(function() {
    return parseFloat($(this).text().replace('đ', '').replace(',', '')) || 0;
}).get();


// Calculate the total money in shopping cart
let totalMoney = moneyArray.reduce((sum, value) => sum + value, 0);

$(".money-to-pay").text(totalMoney.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }));


//function update quantity
function updateQuantity(element, change) {


    let inputElement = $(element).siblings('input');
    let currentQuantity = parseInt(inputElement.val());

    let closestTr = $(element).closest('tr');

    // Find the hidden product-id span within the tr
    let productId = closestTr.find('.product-id').text();

    // Ensure the quantity doesn't go below 1
    if (currentQuantity + change >= 1) {
        inputElement.val(currentQuantity + change);

        // Get the price per unit
        let pricePerUnit = parseFloat($(element).closest('tr').find('.price_prod_cart').text());


        // Calculate the new total price
        let newTotalPriceOfProduct = (currentQuantity + change) * pricePerUnit;
        let totalPriceShoppingCart  = totalMoney + pricePerUnit * change;
        //update total money of shopping cart
        totalMoney = totalPriceShoppingCart;

        // Update the total price element
        $(element).closest('tr').find('.plus_price_cart').text(newTotalPriceOfProduct.toFixed(1) + 'đ');
        totalPrice.text(totalPriceShoppingCart.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));


        const data = {

            productId: parseInt(productId, 10),
            newQuantity: change,
            newPrice: newTotalPriceOfProduct
        };
        const cartCount = parseInt(quantityProduct.text(), 10) || 0; // Parse as integer, default to 0 if not a valid number

        // send fetch to server handle update quantity
        fetch("api/order/update-quantity", {
            method: "POST",
            headers: {
                'X-CSRF-TOKEN': $(".csrf").val(),
                "Content-Type": "application/json",
            },
            body: JSON.stringify(data),
        })
            .then(res => res.json())
            .then(data => {
                quantityProduct.text(cartCount + change);
                console.log(data);
            })
            .catch(err => console.log(err));
    }
}


//function deleteProduct
function deleteProduct(element) {
    const cartCount = parseInt(quantityProduct.text(), 10) || 0; // Parse as integer, default to 0 if not a valid number
    let closestTr = $(element).closest('tr');
    let inputElement = parseInt(closestTr.find('input').val());

    let priceOfProduct = parseFloat(closestTr.find('.plus_price_cart').text());


    // Find the hidden product-id span within the tr
    let productId = closestTr.find('.product-id').text();

    const data = {
        productId: parseInt(productId, 10),
        quantityProductDeleted: inputElement
    }

    //send data to server
    fetch("api/order/delete-product", {
        method: "POST",
        headers: {
            'X-CSRF-TOKEN': $(".csrf").val(),
            "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
    })
        .then(res => res.json())
        .then(data => {
            if(data.statusCode === 200) {
                closestTr.remove();
                quantityProduct.text(cartCount - inputElement);
                totalMoney -= priceOfProduct;
                totalPrice.text(totalMoney.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));
            }
        })
        .catch(err => console.log(err))
}

//pay
function goToPay() {
    window.location = "/orders/pay";

}



//handle button countinue choose cake
function continueChooseCake() {
    window.location = "/product/category/Bánh kem"
}
