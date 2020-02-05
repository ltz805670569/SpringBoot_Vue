package cn.itxdl;

import cn.itxdl.bean.User;
import cn.itxdl.mapper.UserMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.List;

@SpringBootApplication
@MapperScan(basePackages = "cn.itxdl.mapper")
public class RunBoot {
    public static void main(String[] args) {
        ApplicationContext ac = SpringApplication.run(RunBoot.class, args);
        UserMapper userMapper = ac.getBean("userMapper", UserMapper.class);
        List<User> users = userMapper.findAll();
        System.out.println(users);
    }
}
