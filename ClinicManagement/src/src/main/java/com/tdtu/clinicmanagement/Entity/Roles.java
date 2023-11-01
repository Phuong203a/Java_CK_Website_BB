package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;

@Entity
@Table
public class Roles {

    @Id
    private Long RolesId;

    @Column
    private String RoleName;

    @OneToOne(mappedBy = "role")
    private Account account;

}
