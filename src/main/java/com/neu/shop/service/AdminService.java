package com.neu.shop.service;

import com.neu.shop.pojo.Admin;


public interface AdminService {
    public Admin selectByName(Admin admin);

    Admin findByEmail(String email);
}
