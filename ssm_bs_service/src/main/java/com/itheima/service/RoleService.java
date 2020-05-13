package com.itheima.service;

import com.github.pagehelper.PageInfo;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;

import java.util.HashMap;
import java.util.List;

public interface RoleService {
    boolean addRole(Role role);

    Role findById(Integer roleId);

    PageInfo<Permission> findPermissionByRoleId(Integer page, Integer pageSize, Integer roleId);

    PageInfo<Role> findAllByPage(Integer page, Integer pageSize, HashMap<String, String> map);

    boolean update(Role role);

    boolean deleteById(Integer id);

    void deleteById(String[] ids);

    boolean addPermissionToRole(Integer id, List<Integer> permissionId);

    boolean findByRoleName(String roleName);


    boolean deletePermission(Integer permissionId, Integer roleId);


    PageInfo<Permission> findNoPermissionByRoleId(Integer pages, Integer pageSize, Integer id);

    List<Permission> findPermission(Integer id);
}
