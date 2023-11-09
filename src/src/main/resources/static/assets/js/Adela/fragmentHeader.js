
function searchProduct() {
    const keywords = $(".keyword").val();
    window.location = `http://localhost:8080/searchs?keywords=${keywords}`;
}


function redirectShoppingCart() {
    const userName = $(".user-name").text();
    if(userName === "") {
        alert("Vui lòng đăng nhập để vào giỏ hàng.")
        return;
    }
    window.location = "/shopping-cart";
}