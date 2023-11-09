

//div hiển thị lỗi
const divError = $(".message-error");
//messages ghi lỗi
let message;
//validate info register

//bắt sự kiện click đăng kí
$(".btn-logout").click(async () => {
    const username = $(".username").val();
    const password = $(".password").val();
    const rePassword = $(".re-password").val();
    console.log(username, password, rePassword);
    console.log(validateInfo(username, password, rePassword));

    // Validate registration
    if (validateInfo(username, password, rePassword)) {
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







function validateInfo(username,password, rePassword) {
    if(username === "" || password === "" || rePassword === "" || password !== rePassword) {
        message = "Vui lòng kiểm tra lại thông tin.";
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