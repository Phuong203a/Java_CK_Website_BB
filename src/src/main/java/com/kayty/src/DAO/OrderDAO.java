package com.kayty.src.DAO;
import com.kayty.src.Model.Order;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.util.List;
@org.springframework.stereotype.Repository
public class OrderDAO {
    @PersistenceContext
    private EntityManager entityManager;

    // Hàm để đếm số lượng đơn hàng
//    public int countOrders() {
//        Query query = entityManager.createQuery("SELECT COUNT(o) FROM Order o");
//        return (int) query.getSingleResult();
//    }

    // Hàm để lấy tất cả đơn hàng
    public List<Order> getAllOrders() {
        TypedQuery<Order> query = entityManager.createQuery("SELECT o FROM Order o", Order.class);
        return query.getResultList();
    }
}
