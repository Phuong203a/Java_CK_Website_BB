package com.kayty.src.Controller;

import com.kayty.src.DAO.ShoppingCartProductDAO;
import com.kayty.src.Helps.Utils;
import com.kayty.src.Model.ShoppingCartProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private ShoppingCartProductDAO shoppingCartProductDAO;
    @GetMapping("/pay")
    public String renderPagePay(Model model) {
        Iterable<ShoppingCartProduct> listProduct = shoppingCartProductDAO.getProductInCart(Utils.shoppingCart);
        // calc total price
        double totalPrice = 0.0;
        for (ShoppingCartProduct product : listProduct) {
            totalPrice += product.getTotalPrice();
        }
        model.addAttribute("listProductOrder", listProduct);
        model.addAttribute("totalPrice", totalPrice);
        return "pay";
    }

    @GetMapping("/success")
    public String renderPageSuccess(Model model) {
        model.addAttribute("order", Utils.orderNow);
        return "order_success";
    }
}
