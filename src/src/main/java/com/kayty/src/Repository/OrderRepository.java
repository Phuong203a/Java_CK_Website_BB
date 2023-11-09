package com.kayty.src.Repository;
import com.kayty.src.Model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface OrderRepository extends JpaRepository<Order, Long> {
    @Modifying
    @Transactional
    @Query("DELETE FROM ShoppingCartProduct scp WHERE scp.shoppingCart.id = :shoppingCartId")
    void deleteByShoppingCartId(@Param("shoppingCartId") Long shoppingCartId);
}
