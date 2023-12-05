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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
            return new Response<>(404, "No orders found", 0, null);
        }

        return Response.createSuccessResponseModel(listOrder.size(), listOrder);
    }

    //add product
    @PostMapping("/add-product")
    public ResponseEntity<Product> addProduct(@RequestBody Product product){//@RequestParam("product_images") MultipartFile productImage
        //lay path cua anh
//        String imagePath = "/images/" + productImage.getOriginalFilename();
//        product.setImageUrl(imagePath);
        productRepository.save(product);
        return new ResponseEntity<>(product, HttpStatus.CREATED);
    }

    //sua san pham
    @PutMapping(value = "/edit-product/{id}")
    public ResponseEntity<Product> updateProduct(@RequestBody Product updatedProduct, @PathVariable(value = "id") Long id) {
        //check xem id co ton tai hay khong
        Optional<Product> existingProductOptional = productRepository.findById(id);

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