package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 仓库信息：(WarehouseInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "WarehouseInformation")
public class WarehouseInformation implements Serializable {

    // WarehouseInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "warehouse_information_id")
    private Integer warehouse_information_id;

    // 物品名称
    @Basic
    private String item_name;
    // 物品编号
    @Basic
    private String serial_number;
    // 存放位置
    @Basic
    private String storage_location;
    // 物品数量
    @Basic
    private Integer item_quantity;
    // 物品信息
    @Basic
    private String item_information;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
