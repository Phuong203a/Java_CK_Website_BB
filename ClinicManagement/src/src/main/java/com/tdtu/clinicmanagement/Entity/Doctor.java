package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table
@Getter
@Setter
public class Doctor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long DoctorId;

    @Column
    private String FullName;

    @Column
    private String email;

    // mã số căn cước công dân
    @Column
    private String citizenCart;

    //relationship
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_account")
    private Account account;


    // đơn thuốc
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "doctor")
    private Set<Prescription> prescriptionList = new HashSet<>();



}
