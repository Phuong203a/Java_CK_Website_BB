package com.kayty.src.DAO;


import com.kayty.src.Model.ShoppingCart;

import com.kayty.src.Model.ShoppingCartProduct;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.stream.StreamSupport;


@org.springframework.stereotype.Repository
public class ShoppingCartProductDAO  {
    @PersistenceContext
    private  EntityManager entityManager;

    //request
    @Autowired
    private HttpServletRequest req;
    private static String SELECT_PRODUCT_IN_CART = "SELECT p FROM ShoppingCartProduct p WHERE p.shoppingCart.id = :cartId";
    private static String UPDATE_QUANTITY = "UPDATE ShoppingCartProduct p SET p.quantity = p.quantity + :newUpdate, p.totalPrice = :newPrice WHERE p.shoppingCart.id = :cartId AND p.product.id = : productId";
    private  static String DELETE_PRODUCT = "DELETE FROM ShoppingCartProduct p WHERE p.shoppingCart.id = :cartId AND p.product.id = : productId";
    @Transactional
    public int getQuantityInCart (ShoppingCart shoppingCart) {
        Query query = entityManager.createQuery(SELECT_PRODUCT_IN_CART)
                .setParameter("cartId", shoppingCart.getId());

        Iterable<ShoppingCartProduct> productsInCart = query.getResultList();

        int totalQuantity = StreamSupport.stream(productsInCart.spliterator(), false)
                .mapToInt(ShoppingCartProduct::getQuantity)
                .sum();

        return totalQuantity;
    }



    @Transactional
    public Iterable<ShoppingCartProduct> getProductInCart (ShoppingCart shoppingCart) {
        Query query = entityManager.createQuery(SELECT_PRODUCT_IN_CART)
                .setParameter("cartId", shoppingCart.getId());

        Iterable<ShoppingCartProduct> productsInCart = query.getResultList();

        /*int totalQuantity = StreamSupport.stream(productsInCart.spliterator(), false)
                .mapToInt(ShoppingCartProduct::getQuantity)
                .sum();*/

        return productsInCart;
    }

    @Transactional
    public boolean updateQuantity(ShoppingCart shoppingCart, int newQuantity, int newPrice, Long productId) {
        Query query = entityManager.createQuery(UPDATE_QUANTITY)
                .setParameter("cartId", shoppingCart.getId())
                .setParameter("newUpdate", newQuantity)
                .setParameter("newPrice", newPrice)
                .setParameter("productId", productId);

        return query.executeUpdate() > 0;
    }

    @Transactional
    public boolean deleteProduct(ShoppingCart shoppingCart, Long productId) {
        Query query = entityManager.createQuery(DELETE_PRODUCT)
                .setParameter("cartId", shoppingCart.getId())
                .setParameter("productId", productId);

        return query.executeUpdate() > 0;
    }


}
