package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


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

    //feedback
    @OneToMany(cascade = CascadeType.ALL, mappedBy ="patient")
    private List<FeedBack> feedbacks;

    //lịch khám
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL)
    private List<examinationSchedule> examinationSchedules;

    // lịch sử khám
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL)
    private List<examinationHistory> examinationHistories;



    @OneToOne(mappedBy = "patient")
    private MedicalRecord medicalRecord;
}
