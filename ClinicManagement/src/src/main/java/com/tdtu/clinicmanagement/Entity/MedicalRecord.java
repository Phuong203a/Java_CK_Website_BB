package com.tdtu.clinicmanagement.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table
public class healthyRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long healthyRecordId;

    private 
}
