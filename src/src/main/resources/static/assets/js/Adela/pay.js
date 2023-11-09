function validateForm() {
    let fullName = $(".name").val();
    let address = $(".address").val();
    let email = $(".email").val();
    let phone = $(".phone-number").val();

    // Check if required fields are not empty
    if (fullName.trim() === '' || address.trim() === '' || email.trim() === '' || phone.trim() === '') {
        alert('Xin vui lòng điền đầy đủ thông tin vào các ô bắt buộc!');
        return false; // Prevent form submission
    }

    // Check if email is valid
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        alert('Vui lòng nhập địa chỉ email hợp lệ.');
        return false; // Prevent form submission
    }

    // Check if phone number is valid
    var phoneRegex = /^\d{10}$/; // Assuming a 10-digit phone number format
    if (!phoneRegex.test(phone)) {
        alert('Vui lòng nhập số điện thoại hợp lệ gồm 10 chữ số.');
        return false; // Prevent form submission
    }

    // Additional validation logic if needed

    return true; // Allow form submission
}


function pay() {
    if(validateForm()) {
        const quantityPay = $(".cart-count").text();
        const data = {
            quantityPay: quantityPay,
            moneyPay: parseInt($(".money-pay").text().replace("đ", ""))
        }

        fetch("http://localhost:8080/api/order/add-order", {
            method: "POST",
            headers: {
                'X-CSRF-TOKEN': $(".csrf").val(),
                "Content-Type": "application/json",
            },
            body: JSON.stringify(data)
        })
            .then(res => res.json())
            .then(data => {
                if(data.statusCode ===200)
                    window.location = "/orders/success";
            })
            .catch(err => console.log(err))
    }
}
