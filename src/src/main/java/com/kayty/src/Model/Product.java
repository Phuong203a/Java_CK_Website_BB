package com.kayty.src.Model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String productName;

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Column
    private String imageUrl;

    private String category;

    public void setSubCategory(String subCategory) {
        this.subCategory = subCategory;
    }

    private String subCategory;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    @Column(length = 6535)
    private String description;

    private double price;

    private String size;



//    @ManyToMany(mappedBy = "products")
//    private Set<ShoppingCart> shoppingCarts = new HashSet<>();
    @ManyToMany
    @JoinTable(
        name = "shopping_cart_product",
        joinColumns = @JoinColumn(name = "product_id"),
        inverseJoinColumns = @JoinColumn(name = "shopping_cart_id")
    )
    private Set<ShoppingCartProduct> shoppingCartProducts = new HashSet<>();

    public Product(Long id, String productName, String imageUrl, String category,String description, String subCategory, double price, String size) {
        this.id = id;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.category = category;
        this.description = description;
        this.subCategory = subCategory;
        this.price = price;
        this.size = size;
    }

    public Product(Long id, String productName, String imageUrl, String category,String subCategory, double price, String size) {
        this.id = id;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.category = category;
        this.subCategory = subCategory;
        this.price = price;
        this.size = size;
    }

    public Product(String productName, String imageUrl, String category,String subCategory, double price, String size) {

        this.productName = productName;
        this.imageUrl = imageUrl;
        this.category = category;
        this.subCategory = subCategory;
        this.price = price;
        this.size = size;
    }

    public String toString() {

        return "Product[ "+ this.id+ ", "+this.productName+", "+this.category+", "+ this.subCategory+", "+this.price+"]";
    }

}
