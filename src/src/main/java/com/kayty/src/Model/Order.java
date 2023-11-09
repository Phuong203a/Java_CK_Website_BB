package com.kayty.src.Model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;


@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Sys_Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column
    private int totalQuantity;

    @Column
    private int totalPrice;


    public Order(User userLogin, int quantityPay, int moneyPay) {
        this.user = userLogin;
        this.totalQuantity = quantityPay;
        this.totalPrice = moneyPay;
    }
}
