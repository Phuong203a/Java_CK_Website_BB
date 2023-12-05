package com.kayty.src.API;

import com.kayty.src.DAO.OrderDAO;
import com.kayty.src.DAO.ProductDAO;
import com.kayty.src.DAO.UserDAO;
import com.kayty.src.Helps.Response;
import com.kayty.src.Model.Order;
import com.kayty.src.Model.Product;
import com.kayty.src.Model.User;
import com.kayty.src.Repository.OrderRepository;
import com.kayty.src.Repository.ProductRepository;
import com.kayty.src.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/admin")
public class AdminAPIController {
    @Autowired
    private OrderDAO orderDAO;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OrderRepository orderRepository;
    @Value("${spring.servlet.multipart.location}")
    private String uploadPath;

    @GetMapping("/get-statistics")
    public Object getStatistics() {
        List<User> users = userRepository.findAll();
        List<Order> orders  = orderDAO.getAllOrders();
        List<Product> products = productRepository.findAll();
        Map<String,Integer> res = new HashMap<>();
        res.put("usersNumber", users.size());
        res.put("ordersNumber", orders.size());
        res.put("productsNumber", products.size());

        return Response.createSuccessResponseModel(1, res);
    }

    @GetMapping("/get-full-order")
    public Object getShowAllOrder() {
        List<Order> listOrder = orderRepository.findAll();

        // Sử dụng Response để trả về dữ liệu và thông tin liên quan
        if (listOrder.isEmpty()) {
            return Response.createErrorResponseModel("No orders found",null);
        }

        return Response.createSuccessResponseModel(listOrder.size(), listOrder);
    }

    //add product
    @PostMapping("/add-product")
    public Object addProduct(@ModelAttribute Product product,
                                       @RequestParam("product_image") MultipartFile image) {
        if (!image.isEmpty()) {
            String imageName = product.getProductName() + ".jpg";
            String imagePath = uploadPath+ imageName;
            File f = new File(uploadPath);
            if(!f.exists()) {
                f.mkdir();
            }
            try {

                Files.copy(image.getInputStream(), Paths.get(imagePath));

                product.setImageUrl("/images/"+imageName);

                // Save product to the database
                productRepository.save(product);

                return Response.createSuccessResponseModel(200,  product);
            } catch (IOException e) {
                e.printStackTrace(); // Handle the exception appropriately
                return Response.createErrorResponseModel("Error saving image", null);
            }
        } else {
            // Handle the case when no image is provided
            return Response.createErrorResponseModel("Image is required", null);
        }
    }

    //update product
    @PostMapping("/update")
    public Object updateProduct(@RequestBody Product p) {
        Product product = productRepository.getReferenceById(p.getId());
        try {

            product.setProductName(p.getProductName());
            product.setPrice(p.getPrice());
            product.setSize(p.getSize());
            if(p.getCategory() != null)
            {
                product.setCategory(p.getCategory());
                product.setSubCategory(p.getSubCategory());
            }
            if(p.getDescription() != null)
                product.setDescription(p.getDescription());
            productRepository.save(product);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return Response.createErrorResponseModel("Error in line 119 AdminAPI", null);
        }

        return Response.createSuccessResponseModel( 0, product);
    }

    //xoa san pham
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
}