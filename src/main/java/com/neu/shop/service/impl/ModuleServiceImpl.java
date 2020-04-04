package com.neu.shop.service.impl;

import com.neu.shop.dao.ModuleMapper;
import com.neu.shop.pojo.Module;
import com.neu.shop.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModuleServiceImpl implements ModuleService {
    @Autowired
    ModuleMapper moduleMapper;
    @Override
    public Module findMenuByDgree(Integer adminid) {
        Module module=moduleMapper.findModuleByAdminId(adminid);
        return module;
    }
}
