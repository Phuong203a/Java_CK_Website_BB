package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table
public class examinationSchedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scheduledId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    // nội dung khám
    private String examinationContent;

    private String examinationStatus;

    @OneToOne(mappedBy = "schedule")
    private TransactionHistory transactionHistory;
}
