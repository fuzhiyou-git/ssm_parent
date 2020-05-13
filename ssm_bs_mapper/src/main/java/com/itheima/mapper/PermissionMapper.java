package com.itheima.mapper;

import org.apache.ibatis.annotations.*;
import com.itheima.pojo.Permission;

import java.util.HashMap;
import java.util.List;

public interface PermissionMapper {
    @Select("select * from permission where id in(select permissionId from role_permission where roleId=#{id})")
    List<Permission> findPermissionByUserId(int id);

    //@Select("select * from permission")
    List<Permission> findAll(@Param("map") HashMap map);


    @Select("select * from permission where id=#{id}")
    Permission findById(Integer id);


    @Update("update permission set permissionName=#{permissionName},url=#{url} where id=#{id}")
    void updatePermission(Permission permission);

    List<Permission> findAndAllPermissionByRoleName(String roleName);
}
