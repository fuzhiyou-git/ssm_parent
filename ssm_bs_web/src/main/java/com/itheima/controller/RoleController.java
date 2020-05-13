package com.itheima.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;
import com.itheima.service.RoleService;

import javax.print.DocFlavor;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;


    /**
     * 添加角色
     *
     * @param role
     * @return
     */
    @RequestMapping("/addRole")
    @ResponseBody
    public boolean addRole(Role role) {
        return roleService.addRole(role);

    }


    /**
     * 更新角色信息功能的实现
     *
     * @param role
     * @return
     */
    @RequestMapping("/updateRole")
    @ResponseBody
    public boolean updateRole(Role role) {
        return roleService.update(role);
    }

    /**
     * 删除角色
     *
     * @param id
     * @return
     * @throws Exception
     */
    //@PreAuthorize("authentication.principal.username =='TOM'")
    @RequestMapping("/deleteById")
    @ResponseBody
    public boolean deleteById(Integer id) {
        return roleService.deleteById(id);

    }


    /**
     * 添加权限给角色
     *
     * @param roleId
     * @param permissionIds
     * @return
     */
    @RequestMapping("/addPermissionToRole/{roleId}")
    @ResponseBody
    public boolean addPermissionToRole(@PathVariable Integer roleId, @RequestBody List<Integer> permissionIds) {
        return roleService.addPermissionToRole(roleId, permissionIds);


    }


    /**
     * 查询所有角色
     *
     * @param pages
     * @param pageSize
     * @return
     */
    @RequestMapping("/findAllRole")
    @ResponseBody
    public PageInfo<Role> findAllRole(Integer pages, Integer pageSize, String roleName, String roleDesc) {

        HashMap<String, String> map = new HashMap();
        map.put("roleName", roleName);
        map.put("roleDesc", roleDesc);
        PageInfo<Role> pageInfo = roleService.findAllByPage(pages, pageSize, map);
        return pageInfo;
    }


    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    @RequestMapping("/findById/{id}")
    public String findById(@PathVariable Integer id, Model model) {
        model.addAttribute("role", roleService.findById(id));
        return "role/role-update";

    }


    /**
     * 角色ID删除权限功能的实现
     *
     * @param permissionId
     * @return
     */
    @RequestMapping("/deletePermission")
    @ResponseBody
    public boolean deletePermission(Integer permissionId, Integer roleId) {
        return roleService.deletePermission(permissionId, roleId);
    }


    /**
     * 验证角色名是否存在
     *
     * @param roleName
     * @return
     */
    @RequestMapping("/checkRoleName")
    @ResponseBody
    public boolean checkRoleName(String roleName) {
        if (roleName.contains(" ")) {
            roleName = roleName.replaceAll(" +", "");
        }
        return roleService.findByRoleName(roleName);

    }


    /**
     * 跳到角色权限添加界面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/toRolePermission/{id}")
    public String toRolePermission(@PathVariable Integer id, Model model) {
        Role role = roleService.findById(id);
        model.addAttribute("role", role);
        return "role/role-permission-add";
    }

    /**
     * 查询已经拥有的权限
     *
     * @param id
     * @return
     */
    @RequestMapping("/findPermissionByRoleId")
    @ResponseBody
    public PageInfo<Permission> findRoleByIdAndAllPermission(Integer pages, Integer pageSize, Integer id) {
        return roleService.findPermissionByRoleId(pages, pageSize, id);
    }

    /**
     * 查询未添加的权限
     *
     * @param pages
     * @param pageSize
     * @param id
     * @return
     */
    @RequestMapping("/findNoPermissionByRoleId")
    @ResponseBody
    public PageInfo<Permission> findNoPermissionByRoleId(Integer pages, Integer pageSize, Integer id) {
        return roleService.findNoPermissionByRoleId(pages, pageSize, id);

    }


    //跳转角色页面
    @RequestMapping("/toRoleList")
    public String toRoleList() {
        return "role/role-list";
    }
}
