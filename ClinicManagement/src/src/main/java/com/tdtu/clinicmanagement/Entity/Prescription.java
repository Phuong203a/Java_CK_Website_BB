package com.tdtu.clinicmanagement.Entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

// đơn thuốc
@Getter
@Setter
@Entity
@Table
public class Prescription {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long prescriptionId;

    @Column
    private Long PatientId;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @Column
    private String medicineName;

    @Column
    private String note;
}
