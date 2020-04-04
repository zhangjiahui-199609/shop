package com.neu.shop.service;

import com.neu.shop.pojo.User;
import com.neu.shop.pojo.UserExample;

import java.util.List;


public interface UserService {
    public User selectByPrimaryKey(int userId);

    public List<User> selectByExample(UserExample userExample);

    public void insertSelective(User user);

    public void deleteUserById(Integer userid);

    public void updateByPrimaryKeySelective(User user);

}
