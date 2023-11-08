package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table
public class MedicalRecord  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long healthyRecordId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @OneToMany(mappedBy = "medicalRecord",cascade = CascadeType.ALL)
    private List<examinationHistory> examinationHistories;

    private String medicalRecordContent;

}
