package com.kayty.src.Controller;

import com.kayty.src.DAO.ProductDAO;
import com.kayty.src.Model.Product;
import com.kayty.src.Repository.ProductRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;
import java.util.Optional;

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

    @PostMapping("/admin/add-product")
    RedirectView addProduct(HttpServletRequest request, @RequestParam("product_images") MultipartFile productImage){
        // Lấy giá trị chuỗi từ request
        String priceString = request.getParameter("price");
        // Chuyển đổi giá trị chuỗi thành kiểu double
        double price = Double.parseDouble(priceString);

        // Lấy đường dẫn lưu trữ ảnh
        String imagePath = "images/" + productImage.getOriginalFilename();

        Product product = new Product(request.getParameter("name"),
                imagePath,
                request.getParameter("category"),
                request.getParameter("sub_category"),
                price,
                request.getParameter("size"));
        productRepository.save(product);
        return new RedirectView("/admin");
    }

    @GetMapping(value = "/edit-product/{id}")
    public String editProduct(Model model, @PathVariable(value = "id") Long id){
        Optional<Product> product = productRepository.findById(id);
        System.out.println(product.toString());
        model.addAttribute("products", product);
        return "edit";
    }

}
