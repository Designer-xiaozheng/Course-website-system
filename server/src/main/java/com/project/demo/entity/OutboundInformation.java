package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 出库信息：(OutboundInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "OutboundInformation")
public class OutboundInformation implements Serializable {

    // OutboundInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "outbound_information_id")
    private Integer outbound_information_id;

    // 物品名称
    @Basic
    private String item_name;
    // 物品编号
    @Basic
    private String serial_number;
    // 出库日期
    @Basic
    private Timestamp delivery_date;
    // 出库数量
    @Basic
    private String outbound_quantity;
    // 出库员工
    @Basic
    private Integer outbound_employee;
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
