package com.project.demo.controller;

import com.project.demo.entity.WarehouseInformation;
import com.project.demo.service.WarehouseInformationService;
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
 * 仓库信息：(WarehouseInformation)表控制层
 *
 */
@RestController
@RequestMapping("/warehouse_information")
public class WarehouseInformationController extends BaseController<WarehouseInformation, WarehouseInformationService> {

    /**
     * 仓库信息对象
     */
    @Autowired
    public WarehouseInformationController(WarehouseInformationService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
