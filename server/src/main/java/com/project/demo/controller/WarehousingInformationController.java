package com.project.demo.controller;

import com.project.demo.entity.WarehousingInformation;
import com.project.demo.service.WarehousingInformationService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 入库信息：(WarehousingInformation)表控制层
 *
 */
@RestController
@RequestMapping("/warehousing_information")
public class WarehousingInformationController extends BaseController<WarehousingInformation, WarehousingInformationService> {

    /**
     * 入库信息对象
     */
    @Autowired
    public WarehousingInformationController(WarehousingInformationService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(warehousing_information_id) AS max FROM "+"`warehousing_information`";
        Query select = service.runCountSql(sql);
        Integer max = (Integer) select.getSingleResult();
        sql = "UPDATE `warehouse_information` INNER JOIN `warehousing_information` ON warehouse_information.serial_number=warehousing_information.serial_number SET warehouse_information.item_quantity= warehouse_information.item_quantity + warehousing_information.receipt_quantity WHERE warehousing_information.warehousing_information_id="+max;
        select = service.runCountSql(sql);
        select.executeUpdate();
        return success(1);
    }

}
