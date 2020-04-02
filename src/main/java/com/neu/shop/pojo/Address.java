package com.neu.shop.pojo;

import lombok.Data;

@Data
public class Address {
    private Integer addressid;

    private Integer userid;

    private String province;

    private String city;

    private String county;

    private String detailaddr;

    private String conname;

    private String contel;


}