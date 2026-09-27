package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 维修信息：(ServiceInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "ServiceInformation")
public class ServiceInformation implements Serializable {

    // ServiceInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "service_information_id")
    private Integer service_information_id;

    // 车辆名称
    @Basic
    private String vehicle_name;
    // 车牌号码
    @Basic
    private String license_plate;
    // 维修日期
    @Basic
    private Timestamp repair_date;
    // 维修员工
    @Basic
    private Integer maintenance_staff;
    // 员工姓名
    @Basic
    private String employee_name;
    // 维修费用
    @Basic
    private Integer maintenance_costs;
    // 故障原因
    @Basic
    private String fault_cause;
    // 维修笔记
    @Basic
    private String maintenance_notes;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
