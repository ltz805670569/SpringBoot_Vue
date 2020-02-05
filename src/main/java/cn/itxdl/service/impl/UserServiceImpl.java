package cn.itxdl.service.impl;

import cn.itxdl.bean.User;
import cn.itxdl.mapper.UserMapper;
import cn.itxdl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findById(int id) {
        return userMapper.findById(id);
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public boolean addUser(String username, String password, String sex, String phone, String email) {
        boolean flag = false;
        int i = userMapper.addUser(username, password, sex, phone, email);
        if(i>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean updateUser(int id, String username, String password, String sex, String phone, String email) {
        boolean flag = false;
        int i = userMapper.updateUser(id, username, password, sex, phone, email);
        if(i>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean deleteUser(int id) {
        boolean flag = false;
        int i = userMapper.deleteUser(id);
        if(i>0){
            flag = true;
        }
        return flag;
    }
}
