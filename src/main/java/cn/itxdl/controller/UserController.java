package cn.itxdl.controller;

import cn.itxdl.bean.User;
import cn.itxdl.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/selOne")
    public User selOne(int id){
        return userService.findById(id);
    }

    @GetMapping(value = "/selAll")
    public Map<String,Object> selAll(){
        Map<String,Object> map = new HashMap<>();
        Page<Object> page = PageHelper.startPage(1, 3);
        List<User> userList = userService.findAll();
        int pages = page.getPages();
        int pageSize = page.getPageSize();
        int pageNum = page.getPageNum();
        map.put("userList",userList);
        map.put("pages",pages);
        map.put("pageSize",pageSize);
        map.put("pageNum",pageNum);
        return map;
    }

    @GetMapping(value = "/selPage")
    public List<User> selPage(int pageNum,@RequestParam(name = "pageSize",required = false,defaultValue = "3") int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        return userService.findAll();
    }

    @PostMapping(value = "/addUser")
    public Map<String,String> addUser(String username,String password,String sex,String phone,String email){
        Map<String,String> map = new HashMap<>();
        boolean b = userService.addUser(username, password, sex, phone, email);
        if(b){
            map.put("msg","success");
        }else {
            map.put("msg","fail");
        }
        return map;
    }

    @PostMapping(value = "/updateUser")
    public Map<String,String> updateUser(int id,String username,String password,String sex,String phone,String email){
        Map<String,String> map = new HashMap<>();
        boolean b = userService.updateUser(id, username, password, sex, phone, email);
        if(b){
            map.put("msg","success");
        }else {
            map.put("msg","fail");
        }
        return map;
    }

    @PostMapping(value = "/deleteUser")
    public Map<String,String> deleteUser(int id){
        Map<String,String> map = new HashMap<>();
        boolean b = userService.deleteUser(id);
        if(b){
            map.put("msg","success");
        }else {
            map.put("msg","fail");
        }
        return map;
    }


}
