package com.kayty.src.Controller;

import com.kayty.src.DAO.ShoppingCartDAO;
import com.kayty.src.DAO.ShoppingCartProductDAO;
import com.kayty.src.DAO.UserDAO;
import com.kayty.src.Model.Product;
import com.kayty.src.Model.ShoppingCart;
import com.kayty.src.Model.ShoppingCartProduct;
import com.kayty.src.Model.User;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
public class ShoppingCartController {

    @Autowired
    private HttpServletRequest req;
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private ShoppingCartDAO shoppingCartDAO;

    @Autowired
    private ShoppingCartProductDAO shoppingCartProductDAO;


    @GetMapping("/shopping-cart")
    public String renderShoppingCart(Model model) {
        HttpSession session = req.getSession();
        String userName = (String) session.getAttribute("userName");
        User user = (User) userDAO.getByName(userName);
        ShoppingCart sp = shoppingCartDAO.shoppingCartOfUser(user.getId());
        Iterable<ShoppingCartProduct> listProduct = shoppingCartProductDAO.getProductInCart(sp);
        model.addAttribute("listProduct", listProduct);

        return "shopping-cart";
    }
}
