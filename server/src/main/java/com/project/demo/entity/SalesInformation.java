package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 销售信息：(SalesInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "SalesInformation")
public class SalesInformation implements Serializable {

    // SalesInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sales_information_id")
    private Integer sales_information_id;

    // 销售日期
    @Basic
    private Timestamp sales_date;
    // 车辆名称
    @Basic
    private String vehicle_name;
    // 车辆单价
    @Basic
    private Integer vehicle_unit_price;
    // 销售数量
    @Basic
    private Integer sales_volumes;
    // 销售金额
    @Basic
    private String sales_amount;
    // 销售员工
    @Basic
    private Integer sales_staff;
    // 员工姓名
    @Basic
    private String employee_name;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
