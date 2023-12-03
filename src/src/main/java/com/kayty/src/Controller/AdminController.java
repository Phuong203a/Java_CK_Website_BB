package com.kayty.src.Controller;

import com.kayty.src.DAO.OrderDAO;
import com.kayty.src.DAO.ProductDAO;
import com.kayty.src.Helps.Response;
import com.kayty.src.Model.Order;
import com.kayty.src.Model.Product;
import com.kayty.src.Model.User;
import com.kayty.src.Repository.ProductRepository;
import com.kayty.src.Repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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

    public String renderAdmin(Model model) {
        Iterable<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "admin";
    }

//    @PostMapping("/add-product")
//    RedirectView addProduct(HttpServletRequest request, @RequestParam("product_images") MultipartFile productImage){
//        // Lấy giá trị chuỗi từ request
//        String priceString = request.getParameter("price");
//        // Chuyển đổi giá trị chuỗi thành kiểu double
//        double price = Double.parseDouble(priceString);
//
//        // Lấy đường dẫn lưu trữ ảnh
//        String imagePath = "/images/" + productImage.getOriginalFilename();
//
//        Product product = new Product(request.getParameter("name"),
//                imagePath,
//                request.getParameter("category"),
//                request.getParameter("sub_category"),
//                price,
//                request.getParameter("size"));
//        productRepository.save(product);
//        return new RedirectView("/admin");
//    }

    //them san pham
    @PostMapping("/add-product")
    public ResponseEntity<Product> addProduct(@RequestBody Product product){//@RequestParam("product_images") MultipartFile productImage
        //lay path cua anh
//        String imagePath = "/images/" + productImage.getOriginalFilename();
//        product.setImageUrl(imagePath);
        productRepository.save(product);
        return new ResponseEntity<>(product, HttpStatus.CREATED);
    }


    //sua san pham
//    @GetMapping(value = "/edit-product/{id}")
//    public String editProduct(Model model, @PathVariable(value = "id") Long id){
//        Optional<Product> product = productRepository.findById(id);
//        System.out.println(product.toString());
//        model.addAttribute("products", product);
//        return "edit";
//    }


    @PutMapping(value = "/edit-product/{id}")
    public ResponseEntity<Product> updateProduct(@RequestBody Product updatedProduct, @PathVariable(value = "id") Long id) {
        //check xem id co ton tai hay khong
        Optional<Product> existingProductOptional = productRepository.findById(id);
        System.out.println(updatedProduct.toString());
        System.out.println(existingProductOptional.toString());
        if (existingProductOptional.isPresent()) {
            updatedProduct.setId(id);
            // Lưu sản phẩm đã cập nhật vào cơ sở dữ liệu
            System.out.println(updatedProduct.toString());
            Product savedProduct = productRepository.save(updatedProduct);
            // Trả về đã cập nhật và trạng thái OK
            return new ResponseEntity<>(savedProduct, HttpStatus.OK);
        } else {
            // Trả về không tìm thấy sản phẩm
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete-product/{id}")
    public ResponseEntity<Product> deleteProduct(@PathVariable(value = "id") Long id){
        Optional<Product> product = productRepository.findById(id);
        //neu ton tai thi xoa
        if(product.isPresent()){
            productRepository.delete(product.get());
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.notFound().build();
    }
//active or inactive user
    @PostMapping("/edit-status-user/{id}")
    public ResponseEntity<User> getUser(@PathVariable Long id) throws Exception {
        Optional<User> optionalUser = userRepository.findById(id);
        if(optionalUser.isPresent()){
            User user = optionalUser.get();
            boolean currentStatus = user.getStatus();
            //đổi ngược trạng thái và cập nhật ok
            user.setStatus(!currentStatus);
            userRepository.save(user);
            return ResponseEntity.ok().build();
        }
        //trả về lỗi
        return ResponseEntity.notFound().build();
    }
//    //danh sach order va thong ke
//    @GetMapping("/order/get-full-order")
//    public Response<List<Order>> getShowAllOrder(){
//        List<Order> listOrder = orderDAO.getAllOrders();
//        Map<String, List<Order>> data = new HashMap<>();
//        data.put("list", listOrder);
////        int quantity = orderDAO.countOrders();
//        return new Response<>(200, "Successful", ((List<Order>) listOrder).size(), data);
//    }

}
