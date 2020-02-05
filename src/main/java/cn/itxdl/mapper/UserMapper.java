package cn.itxdl.mapper;

import cn.itxdl.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    User findById(@Param("id") int id);
    List<User> findAll();
    int addUser(@Param("username") String username,@Param("password") String password,@Param("sex") String sex,@Param("phone") String phone,@Param("email") String email);
    int updateUser(@Param("id") int id,@Param("username") String username,@Param("password") String password,@Param("sex") String sex,@Param("phone") String phone,@Param("email") String email);
    int deleteUser(@Param("id") int id);
}
