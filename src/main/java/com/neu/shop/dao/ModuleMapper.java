package com.neu.shop.dao;

import com.neu.shop.pojo.Module;

import java.util.List;

public interface ModuleMapper {
    Module findModuleByAdminId(Integer adminid);
}
