package cn.itxdl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {

    @RequestMapping(value = "/toIndex",method = RequestMethod.GET)
    public String toIndex(){
        return "index";
    }

    @RequestMapping(value = "/toAdd",method = RequestMethod.GET)
    public String toAdd(){
        return "add";
    }

    @RequestMapping(value = "/toUpdate")
    public String toUpdate(){
        return "update";
    }

}
