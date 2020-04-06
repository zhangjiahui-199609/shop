package com.neu.shop.pojo;

import lombok.Data;


public class Admin {
    private Integer adminid;

    private String adminname;

    private String password;

   private String dgreeName;

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDgreeName() {
        return dgreeName;
    }

    public void setDgreeName(String dgreeName) {
        this.dgreeName = dgreeName;
    }
}