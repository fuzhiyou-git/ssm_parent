package com.itheima.service;

import com.github.pagehelper.PageInfo;
import com.itheima.pojo.Permission;

import java.util.HashMap;
import java.util.List;

public interface PermissionService {

    Permission findById(Integer id);

    boolean updatePermission(Permission permission);

    PageInfo<Permission> findAllByPage(Integer page, Integer pageSize, HashMap map);

    List<Permission> findAndAllPermissionByRoleName(String roleName);
}
