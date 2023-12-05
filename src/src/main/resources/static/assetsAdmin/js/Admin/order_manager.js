const tbody = $('.tbody');


fetch("/api/admin/get-full-order")
.then(res => res.json())
.then(res => {
    displayOrder(res.data);
})
.catch(err => console.log(err));


function displayOrder(arr) {
    arr.map(o => {
       let html = `<tr>
                                        <td>
                                            ${o.id}
                                        </td>
                                        
                                        <td>${o.fullName}</td>
                                        <td>${o.address}</td>
                                        <td>${o.phone}</td>
                                        <td>${o.user.email}</td>
                                        <td>${o.totalQuantity}</td>
                                        <td>${o.totalPrice}</td>

                                        
                                    </tr>`
        tbody.append(html);
    });
}
