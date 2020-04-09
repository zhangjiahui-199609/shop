package com.neu.shop.service.impl;

import com.neu.shop.dao.AdminMapper;
import com.neu.shop.pojo.Admin;
import com.neu.shop.pojo.AdminExample;
import com.neu.shop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin selectByName(Admin admin) {
        return adminMapper.selectByName(admin);
    }

    @Override
    public Admin findByEmail(String email) {
        Admin admin=adminMapper.selectByEmail(email);
        return admin;
    }

    @Override
    public Admin selectByPrimaryKey(Integer sendto) {
        return adminMapper.selectByPrimaryKey(sendto);
    }
}
