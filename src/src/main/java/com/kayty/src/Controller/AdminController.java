package com.kayty.src.Controller;

import com.kayty.src.DAO.OrderDAO;
import com.kayty.src.DAO.ProductDAO;
import com.kayty.src.Repository.ProductRepository;
import com.kayty.src.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller

@RequestMapping("/admin")
public class AdminController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    OrderDAO orderDAO;
    @GetMapping(value = {"", "/"})
    public String renderAdmin() {
        return "admin";
    }

    @GetMapping("/product-manager")
    public String renderUserManager() {
        return "product_manager";
    }

}
