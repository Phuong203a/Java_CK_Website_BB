package com.kayty.src.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table
@JsonIgnoreProperties({"orders", "shoppingCarts"})
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String username;

    @Column
    private String password;

    @Column
    private String email;

    @ColumnDefault("true")
    private Boolean status;

    @Column(nullable = true, unique = true)
    @CreationTimestamp
    private LocalDateTime createdDate;

    @OneToMany(mappedBy = "user")
    @JsonManagedReference
    private List<Order> orders;

    @OneToOne(mappedBy = "user")
    private ShoppingCart shoppingCarts;


    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id")
    )
    private Set<Role> roles;


    public User(String username, String password, String email,  Role userRole, boolean status) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.roles = new HashSet<>(Collections.singletonList(userRole));
        this.status = status;
    }

    public User(String username, String password, ShoppingCart shoppingCart) {
        this.username = username;
        this.password = password;
        this.shoppingCarts = shoppingCart;
    }

    public String toString() {

        return "User["+ this.id+ ", " + this.username +", "+this.password+ ", "+this.shoppingCarts+ "]";
    }
}
