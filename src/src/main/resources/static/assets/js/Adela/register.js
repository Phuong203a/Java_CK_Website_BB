//div hiển thị lỗi
const divError = $(".message-error");
//regex
const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
//messages ghi lỗi
let message;
//validate info register

//bắt sự kiện click đăng kí
$(".btn-logout").click(async () => {
    const username = $(".username").val();
    const password = $(".password").val();
    const rePassword = $(".re-password").val();
    const email = $(".email").val();
    console.log(username, password, rePassword);
    console.log(validateInfo(username, password, rePassword, email));

    // Validate registration
    if (validateInfo(username, password, rePassword, email)) {
        const formData = new FormData($("form")[0]);
        fetch("/auth/register", {
            method: "POST",
            headers: {
                'X-CSRF-TOKEN': $(".csrf").val(),
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams(formData).toString(),
        })
            .then()
            .then(data => {
                //thành công chuyển hướng người dùng
                window.location = "/auth/login";
            })
            .catch(err => console.log(err));


    } else {
        divError.text(message);
        displayError(divError);
    }
});







function validateInfo(username,password, rePassword, email) {
    if(username === "" || email === "" || password === "" || rePassword === "") {
        message = "Vui lòng kiểm tra lại thông tin.";
        return false;
    }
    else if(!regex.test(email)) {
        message = "Email không đúng định dạng.";
        return false;
    }
    else if (password !== rePassword) {
        message = "Xác nhận mật khẩu không khớp.";
        return false;
    }

    return true;
}


function displayError(div) {
    div.removeClass("d-none");
    setTimeout(()=> {
        div.addClass("d-none");
    }, 3000)
}