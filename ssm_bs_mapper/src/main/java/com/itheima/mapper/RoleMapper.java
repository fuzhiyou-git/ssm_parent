package com.itheima.mapper;

import com.itheima.pojo.UsersInfo;
import org.apache.ibatis.annotations.*;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface RoleMapper {


    @Select("select r.id,r.roleName, r.roleDesc from role r where id in(select roleId from users_role where userId=#{userId})")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "roleName", property = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(column = "id", property = "permissions", javaType = java.util.List.class, many = @Many(select = "com.itheima.mapper.PermissionMapper.findPermissionByUserId"))
    })
    List<Role> findRoleByUserId(int userId);


    List<Role> findAll(@Param("map") HashMap<String, String> map);

    @Insert("insert into role values (null,#{roleName},#{roleDesc})")
    int addRole(Role role);

    @Select("select r.id,r.roleName,r.roleDesc from role r where id=#{roleId}")
    Role findById(int roleId);

    /**
     * 根据角色id查询已经拥有的权限
     *
     * @param roleId
     * @return
     */
    @Select("select * from permission  where id in(select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findPermissionByRoleId(Integer roleId);


    @Update("update role set roleName=#{roleName},roleDesc=#{roleDesc} where id=#{id}")
    void update(Role role);


    @Delete("delete from role where id=#{id}")
    void deleteById(Integer id);

    //添加权限给角色
    void addPermissionToRole(@Param("roleId") Integer roleId, @Param("permissionIds") List<Integer> permissionId);


    @Select("select r.id,r.roleName from role r where roleName=#{roleName}")
    Role findByRoleName(@Param("roleName") String roleName);


    @Select("select * from permission p where id in(select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findPermissionsById(int roleId);


    /**
     * 删除角色的权限
     *
     * @param permissionId
     * @param roleId
     */
    @Delete("DELETE FROM role_permission WHERE permissionId=#{permissionId} AND roleId=#{roleId}")
    void deletePermission(@Param("permissionId") Integer permissionId, @Param("roleId") Integer roleId);

    @Select("select roleName from role where id=#{id}")
    String findRoleNameById(int id);


    @Delete("delete from role_permission where roleId=#{roleId}")
    void deletePermissionByROleId(Integer roleId);

    /**
     * 查询未添加的权限
     *
     * @param roleId
     * @return
     */
    @Select("select * from permission p where id not in(select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findNoPermissionByRoleId(Integer roleId);

    /**
     * 查询角色是否有用户
     *
     * @param roleId
     * @return
     */
    @Select("SELECT * FROM users_role WHERE roleId=#{roleId}")
    List<UsersInfo> findUserByRoleId(Integer roleId);
}


