const userCount = $(".user-count");
const productCount = $(".product-count");
const orderCount = $(".order-count");
const tbody = $(".tbody");
//get-statistics
fetch("/api/admin/get-statistics")
.then(res =>res.json())
.then(res => {
    userCount.text(res.data.usersNumber);
    productCount.text(res.data.productsNumber);
    orderCount.text(res.data.ordersNumber);
})
.catch(err => console.log(err));

//get all users
fetch("/api/user/get-all-users")
.then(res => res.json())
.then(res => {
    console.log(res.data);
    disPlayUsers(res.data);
})
.catch(err => console.log(err))

function disPlayUsers(arr) {
    arr.map(u => {
       let html =`<tr>
                                        <td class="text-nowrap">
                                            <div class="font-weight-600">${u.id}</div>
                                        </td>
                                        <td class="text-nowrap">${u.username}</td>
                                        <td class="text-center">${u.email}</td>
                                        <td class="text-center">
                                            ${new Date(u.createdDate).toLocaleTimeString('en-US', { hour12: false })}
                                        </td>
                                        <td class="text-end">
                                            <div class="font-weight-600 ${checkActive(u.status) ? 'text-success' : 'text-danger'}">${checkActive(u.status)}</div>
                                        </td>
                                    </tr>`
        tbody.append(html);
    });
}

function checkActive(isActive) {
    if(isActive)
        return "Active";
    return  "Inactive";
}