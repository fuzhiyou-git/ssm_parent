package com.itheima.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import com.itheima.pojo.Permission;
import com.itheima.service.PermissionService;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;


    //更改权限信息功能的实现;
    @RequestMapping("/updatePermission")
    @ResponseBody
    public boolean updatePermission(Permission permission) {
        return permissionService.updatePermission(permission);
    }


    @RequestMapping("/findAll")
    @ResponseBody
    public PageInfo<Permission> findAllPermission(@RequestParam(name = "page", defaultValue = "1") Integer page,
                                                  @RequestParam(name = "pageSize", defaultValue = "5") Integer pageSize,
                                                  @RequestParam(name = "url") String url,
                                                  @RequestParam(name = "permissionName") String permissionName) {

        HashMap map = new HashMap();
        map.put("url", url);
        map.put("permissionName", permissionName);
        return permissionService.findAllByPage(page, pageSize, map);

    }

    @RequestMapping("/findById")
    @ResponseBody
    public Permission findById(Integer id) {
        return permissionService.findById(id);
    }

    @RequestMapping("/toPermissionList")
    public String toPermissionList() {
        return "permisssion/permission-list";
    }

}
