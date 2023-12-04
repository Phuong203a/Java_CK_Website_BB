package com.kayty.src.API;

import com.kayty.src.DAO.OrderDAO;
import com.kayty.src.DAO.ProductDAO;
import com.kayty.src.DAO.UserDAO;
import com.kayty.src.Helps.Response;
import com.kayty.src.Model.Order;
import com.kayty.src.Model.Product;
import com.kayty.src.Model.User;
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
    private UserDAO userDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private UserRepository userRepository;


    @GetMapping("/order/get-full-order")
    public Response<List<Order>> getShowAllOrder() {
        List<Order> listOrder = orderDAO.getAllOrders();

        // Sử dụng Response để trả về dữ liệu và thông tin liên quan
        if (listOrder.isEmpty()) {
            return new Response<>(404, "No orders found", 0, null);
        }

        Map<String, List<Order>> data = new HashMap<>();
        data.put("list", listOrder);

        return new Response<>(200, "Successful", listOrder.size(), data);
    }


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
    @PutMapping(value = "/edit-product/{id}")
    public ResponseEntity<Product> updateProduct(@RequestBody Product updatedProduct, @PathVariable(value = "id") Long id) {
        //check xem id co ton tai hay khong
        Optional<Product> existingProductOptional = productRepository.findById(id);

        if (existingProductOptional.isPresent()) {
            updatedProduct.setId(id);
            // Lưu sản phẩm đã cập nhật vào cơ sở dữ liệu
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

}