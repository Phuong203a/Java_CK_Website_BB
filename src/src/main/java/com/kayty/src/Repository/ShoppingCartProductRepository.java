package com.kayty.src.Repository;

import com.kayty.src.Model.Product;
import com.kayty.src.Model.ShoppingCart;
import com.kayty.src.Model.ShoppingCartProduct;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ShoppingCartProductRepository  extends JpaRepository<ShoppingCartProduct, Long> {
    @Query("SELECT new ShoppingCartProduct(p.shoppingCart, p.product, p.quantity) FROM ShoppingCartProduct p WHERE p.shoppingCart.id = :cartId AND p.product.id = :productId")
    ShoppingCartProduct findProductInCart(@Param("cartId") Long cartId, @Param("productId") Long productId);

    @Modifying
    @Transactional
    @Query("UPDATE ShoppingCartProduct sp SET sp.quantity = :quantity, sp.totalPrice = :totalPrice WHERE sp.shoppingCart = :cart AND sp.product = :product")
    void updateQuantityAndTotalPrice(@Param("product") Product product ,@Param("cart") ShoppingCart cart, @Param("quantity") int quantity, @Param("totalPrice") double totalPrice);





}
