package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Entity
@Table
@Getter
@Setter

public class Account {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long AccountId;

    @Column
    private String phoneNumber;


    @Column
    private String password;


    @Column
    private Date created_date;

    @Column
    private Date updated_date;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "role_id")
    private Roles role;

    @OneToOne(mappedBy = "account")
    private Doctor doctor;

    @OneToOne(mappedBy = "account")
    private Patient patient;

    @OneToOne(mappedBy = "account")
    private Admin admin;

}
