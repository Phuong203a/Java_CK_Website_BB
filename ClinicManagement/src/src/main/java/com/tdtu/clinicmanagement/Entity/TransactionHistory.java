package com.tdtu.clinicmanagement.Entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

@Entity
@Table
public class TransactionHistory {

    //mã giao dịch, được tạo ra mỗi khi người dùng đặt lịch khám
    @Id
    private String transactionHistoryId;

    private String status;

    private double payment;

    // lịch khám
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "schedule_id")
    private  examinationSchedule schedule;

}
