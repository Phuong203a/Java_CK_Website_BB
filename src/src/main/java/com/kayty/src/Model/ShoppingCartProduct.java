package com.kayty.src.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "shopping_cart_product")
public class ShoppingCartProduct {

    @GeneratedValue(strategy=GenerationType.AUTO)
    @Id
    private Long id;

    @ManyToOne
    @JoinColumn(name = "shopping_cart_id")
    private ShoppingCart shoppingCart;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(nullable = false, columnDefinition = "int default 1")
    private int quantity;

    @Column
    private double totalPrice;

    // Constructors, getters, setters, etc.
    public ShoppingCartProduct(ShoppingCart shoppingCart, Product product, int quantity) {
        this.shoppingCart = shoppingCart;
        this.product = product;
        this.quantity = quantity;

    }
    public ShoppingCartProduct(ShoppingCart shoppingCart, Product product, int quantity, double totalPrice) {
        this.shoppingCart = shoppingCart;
        this.product = product;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "ShoppingCartProduct{" +
                "id=" + id +
                ", shoppingCart=" + shoppingCart +
                ", product=" + product +
                ", quantity=" + quantity +
                ", totalPrice=" + totalPrice +
                '}';
    }

}


