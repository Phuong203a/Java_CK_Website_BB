package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table
public class examinationHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long historyId;

    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;


    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    //nội dung khám
    private String examinationContent;
    private String status;

    @ManyToOne
    @JoinColumn(name = "medicalRecord_id")
    private MedicalRecord medicalRecord;


}
