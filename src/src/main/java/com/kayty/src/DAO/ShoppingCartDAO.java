package com.kayty.src.DAO;


import com.kayty.src.Model.ShoppingCart;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

@org.springframework.stereotype.Repository
public class ShoppingCartDAO {

    @PersistenceContext
    private EntityManager entityManager;

    private final String FIND_SHOPPING_CART = "SELECT sp FROM ShoppingCart sp WHERE sp.user.id = :userId";


    public ShoppingCart shoppingCartOfUser(Long userId) {
        Query query = entityManager.createQuery(FIND_SHOPPING_CART);
        query.setParameter("userId", userId);

        return  (ShoppingCart) query.getSingleResult();
    }


}
