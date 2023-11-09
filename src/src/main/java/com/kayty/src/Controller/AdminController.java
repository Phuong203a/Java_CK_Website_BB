package com.kayty.src.Controller;

import com.kayty.src.DAO.ProductDAO;
import com.kayty.src.Model.Product;
import com.kayty.src.Repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller


public class AdminController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    ProductRepository productRepository;
    @GetMapping("/admin")

    public String renderAdmin(Model model) {
        Iterable<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "admin";
    }
}
