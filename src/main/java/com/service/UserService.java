package com.service;

import com.entity.User;
import com.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User login(String username,String userpassword){
        User user = userMapper.selectByName(username);
        try {
            if (user.getPassword().equals(userpassword)){
                return user;
            }else {
                return null;
            }
        }catch (Exception e){
            return null;
        }
    }
}
