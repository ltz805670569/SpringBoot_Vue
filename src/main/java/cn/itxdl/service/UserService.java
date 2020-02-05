package cn.itxdl.service;

import cn.itxdl.bean.User;

import java.util.List;

public interface UserService {

    User findById(int id);
    List<User> findAll();
    boolean addUser(String username,String password,String sex,String phone,String email);
    boolean updateUser(int id,String username,String password,String sex,String phone,String email);
    boolean deleteUser(int id);
}
