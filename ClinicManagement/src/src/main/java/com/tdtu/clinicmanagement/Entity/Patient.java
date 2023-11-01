package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;


@Entity
@Table
@Getter
@Setter

public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long PatientId;

    @Column
    private String FullName;

    @Column
    private String citizenCart;

    @Column
    private String Address;

    @Column
    private String homeTown;

    // dân tộc
    @Column
    private String nation;

    @Column
    private Date birthDate;

    @Column
    private String status;

    //relationship
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_account")
    private Account account;
}
