package com.kayty.src.DAO;

import com.kayty.src.Model.Product;

import com.kayty.src.Repository.ProductRepository;
import com.kayty.src.Repository.Repository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;

import jakarta.persistence.Query;
import java.util.List;


@org.springframework.stereotype.Repository
public class ProductDAO implements Repository {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private  ProductRepository productRepository;


    // query
    private final String GET_BEST_SALE_PRODUCT = "SELECT NEW  com.kayty.src.Model.Product(p.id, p.productName, p.imageUrl, p.category, p.subCategory, p.price, p.size) FROM Product p ";

    private final String GET_PRODUCT_BY_ID = "SELECT NEW  com.kayty.src.Model.Product(p.id, p.productName, p.imageUrl, p.category, p.description, p.subCategory, p.price, p.size) FROM Product p WHERE p.id = :id";
    private String GET_PRODUCT_BY_CATEGORY = "SELECT NEW  com.kayty.src.Model.Product(p.id, p.productName, p.imageUrl, p.category, p.subCategory, p.price, p.size) FROM Product p WHERE p.category = :category";

    private String  GET_PRODUCT_BY_NAME = "SELECT NEW com.kayty.src.Model.Product(p.id, p.productName, p.imageUrl, p.category, p.description, p.subCategory, p.price, p.size) FROM Product p WHERE p.productName LIKE CONCAT('%', :keyword, '%')";
    private final String GET_PRODUCT_BY_SUB_CATEGORY = "SELECT NEW  com.kayty.src.Model.Product(p.id, p.productName, p.imageUrl, p.category, p.subCategory, p.price, p.size) FROM Product p WHERE p.subCategory = :subCategory";
    private final String GET_SUB_CATEGORY = "SELECT p.subCategory FROM Product p WHERE p.category = :category GROUP BY p.subCategory";

    @Override
    public Object add(Object item) {
        return null;
    }

    @Override
    public Object get(Object id) {
        Query query = entityManager.createQuery(GET_PRODUCT_BY_ID);
        query.setParameter("id", id);
        Product product = (Product) query.getSingleResult();
        if(product != null)
            return product;
        return null;

    }

    @Override
    public List getListSearch(String keyword) {
        Query query = entityManager.createQuery(GET_PRODUCT_BY_NAME);
        query.setParameter("keyword", keyword);
        List list = query.getResultList();
        return list;
    }

    public List getBestSaleProduct() {
        Query query = entityManager.createQuery(GET_BEST_SALE_PRODUCT);
        query.setMaxResults(6);
        List<Product> list = query.getResultList();
        return list;

    }

    public List getProductByCategory(String category) {
        Query query = entityManager.createQuery(GET_PRODUCT_BY_CATEGORY);
        query.setParameter("category", category);

        List listProduct = query.getResultList();
        return  listProduct;

    }

    public List getSubCategory(String category) {

        Query query = entityManager.createQuery(GET_SUB_CATEGORY);
        query.setParameter("category", category);
        List subCategorys = query.getResultList();
        return  subCategorys;
    }

    public List getProductBySubCategory(String subCategory) {
        Query query = entityManager.createQuery(GET_PRODUCT_BY_SUB_CATEGORY);
        query.setMaxResults(9);
        query.setParameter("subCategory", subCategory);
        List listProduct = query.getResultList();
        return  listProduct;

    }

    @Override
    public boolean deleteById(Object id) {
        return false;
    }

    @Override
    public Object getByName(String name) {
        return null;
    }

    @Override
    public boolean update(Object item) {
        return false;
    }
}
