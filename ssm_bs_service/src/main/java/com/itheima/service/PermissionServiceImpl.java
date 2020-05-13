package com.itheima.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.mapper.PermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.pojo.Permission;

import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public boolean updatePermission(Permission permission) {
        permissionMapper.updatePermission(permission);
        return true;
    }

    @Override
    public PageInfo<Permission> findAllByPage(Integer page, Integer pageSize, HashMap map) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(permissionMapper.findAll(map));
    }

    @Override
    public List<Permission> findAndAllPermissionByRoleName(String roleName) {
        return permissionMapper.findAndAllPermissionByRoleName(roleName);
    }


    @Override
    public Permission findById(Integer id) {
        return permissionMapper.findById(id);

    }

}
