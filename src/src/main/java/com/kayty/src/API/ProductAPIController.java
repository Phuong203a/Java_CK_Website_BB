package com.kayty.src.API;

import com.kayty.src.DAO.ProductDAO;
import com.kayty.src.DAO.ShoppingCartProductDAO;
import com.kayty.src.DAO.UserDAO;
import com.kayty.src.Helps.Response;
import com.kayty.src.Model.Product;
import com.kayty.src.Model.ShoppingCart;
import com.kayty.src.Model.ShoppingCartProduct;
import com.kayty.src.Model.User;
import jakarta.servlet.http.HttpServletRequest;
import com.kayty.src.Repository.ShoppingCartProductRepository;
import com.kayty.src.Repository.ShoppingCartRepository;
import com.kayty.src.Repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import java.util.*;

import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/product")
public class ProductAPIController {
    @Autowired
    private  ProductDAO productDAO;

    @Autowired
    private  UserDAO userDAO;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ShoppingCartRepository shoppingCartRepository;

    @Autowired
    private ShoppingCartProductRepository shoppingCartProductRepository;

    @Autowired
    private HttpServletRequest request;


    @GetMapping("/get-bestsale-product")
    public Response<List<Product>> getBestSaleProduct() {
        List<Product> list = productDAO.getBestSaleProduct();
        Map<String, List<Product>> data = new HashMap<>();
        data.put("list", list);
        return new Response<>(200, "Successful",list.size(), data);
    }

    @GetMapping("/get-detail/{id}")
    public Response<Object> getProductById(@PathVariable Long id) {
        Product p = (Product) productDAO.get(id);
        if(p == null) {
            return new Response<>(400, "Data not found", null);
        }
        Map<String, Object> data = new HashMap<>();
        data.put("product", p);
        return new Response<>(200, "Successful", data);
    }

    @GetMapping("/get-product-by-category/{category}")
    public Response<List<Product>> getListProductByCategory(@PathVariable String category, @RequestParam(defaultValue = "1") Integer pageIndex)
    {
        List<Product> limitedList;
        List<Product> listByCategory = productDAO.getProductByCategory(category);
        //vị trí bắt đầu lấy sản phâm
        int from = 0;
        if(pageIndex !=1) {
            from = (pageIndex - 1) * 9;
            // Giới hạn danh sách chỉ có 9 phần tử

        }
        limitedList = listByCategory.stream().skip(from).limit(9)
                .collect(Collectors.toList());
        //lấy sub_category
        Map<String, List<Product>> data  = new HashMap<>();
        data.put("pageListProduct", limitedList);
        data.put("listByCategory", listByCategory);

        return new Response<>(200, "Successful", listByCategory.size(), data);
    }

    @GetMapping("/get-product-by-subCategory/{subCategory}")
    public Response<List<Product>> getListProductBySubCategory(@PathVariable String subCategory) {
        System.out.println(subCategory);
        List<Product> list = productDAO.getProductBySubCategory(subCategory);
        Map<String, List<Product>> data = new HashMap<>();
        data.put("list", list);
        return new Response<>(200, "Successful", data);
    }

    @GetMapping("/get-list-search")
    public Response<List<Product>> getListListSearch(@RequestParam String keywords, @RequestParam(defaultValue = "1") Integer pageIndex) {
        System.out.println((keywords));
        List<Product> limitedList;
        List<Product> listSearch = productDAO.getListSearch(keywords);
        //vị trí bắt đầu lấy sản phâm
        int from = 0;
        if(pageIndex !=1) {
            from = (pageIndex - 1) * 9;
            // Giới hạn danh sách chỉ có 9 phần tử

        }
        limitedList = listSearch.stream().skip(from).limit(9)
                .collect(Collectors.toList());
        //lấy sub_category
        Map<String, List<Product>> data  = new HashMap<>();
        data.put("pageListProduct", limitedList);
        data.put("listSearch", listSearch);

        return new Response<>(200, "Successful", listSearch.size(), data);
    }


    @PostMapping("/add-product-to-cart")
    public Response<Product> addProductToCart(@RequestBody Map<String, Object> req) {
        try {
            String productId = (String) req.get("idProduct");
            String userName = (String) req.get("userName");
            String sQuantity =  (String)req.get("quantity");
            //convert
            int quantity = Integer.parseInt(sQuantity);
            System.out.println(productId + " " + userName);

            User user = (User) userDAO.getByName(userName);
            if (user != null) {
                ShoppingCart cart = user.getShoppingCarts();
                if (cart == null) {
                    cart = new ShoppingCart();
                    cart.setUser(user);
                    user.setShoppingCarts(cart);

                    // Save to the database
                    shoppingCartRepository.save(cart);
                    userRepository.save(user);
                }

                // Add product to the cart
                Product product = (Product) productDAO.get(Long.parseLong(productId));

                // Check if the product is already in the cart
                ShoppingCartProduct existingProduct = findProductInCart(cart, product);

                if (existingProduct != null) {
                    // If the product is already in the cart, increment the quantity
                    System.out.println("Product already in the cart");
                    updateProductQuantityAndTotalPrice(product, cart, existingProduct.getQuantity() + quantity, calculateTotalPrice(product, existingProduct.getQuantity() + quantity));
                } else {
                    System.out.println("Product not in the cart");
                    // If the product is not in the cart, create a new ShoppingCartProduct entry
                    ShoppingCartProduct newProduct = new ShoppingCartProduct(cart, product, quantity, product.getPrice());
                    shoppingCartProductRepository.save(newProduct);
                }
                //update value in the session
                HttpSession session = request.getSession();
                Integer oldTotalQuantity = (Integer) session.getAttribute("totalQuantity");
                session.setAttribute("totalQuantity", oldTotalQuantity + quantity);

                return new Response<>(200, "Product added to cart successfully");
            } else {
                return new Response<>(404, "User not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Response<>(500, "Internal Server Error");
        }
    }

    @GetMapping("/get-sub-category")
    public Response<Object> getSubCategory(@RequestParam String category) {
        List subCategories = productDAO.getSubCategory(category);
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("subCategory", subCategories);
        return new Response<>(500, "Successfully", subCategories.size(), data);
    }


    // Helper method to find a product in the cart
    public ShoppingCartProduct findProductInCart(ShoppingCart cart, Product product) {
        Long cartId = cart.getId();
        Long productId = product.getId();
        return shoppingCartProductRepository.findProductInCart(cartId, productId);
    }

    public void updateProductQuantityAndTotalPrice(Product product,ShoppingCart cart, int newQuantity, double newTotalPrice) {
        shoppingCartProductRepository.updateQuantityAndTotalPrice(product,cart, newQuantity, newTotalPrice);
    }

    private double calculateTotalPrice(Product product, int quantity) {
        // Add your calculation logic here
        return product.getPrice() * quantity;
    }




}
