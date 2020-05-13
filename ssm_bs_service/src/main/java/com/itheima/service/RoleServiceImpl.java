package com.itheima.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.pojo.UsersInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.mapper.RoleMapper;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;


    /**
     * 添加权限给角色
     *
     * @param roleId
     * @param permissionId
     * @return
     */
    @Override
    public boolean addPermissionToRole(Integer roleId, List<Integer> permissionId) {
        roleMapper.addPermissionToRole(roleId, permissionId);
        return true;
    }

    @Override
    public boolean findByRoleName(String roleName) {
        Role role = roleMapper.findByRoleName(roleName);
        return role != null;
    }


    @Override
    public boolean deletePermission(Integer permissionId, Integer roleId) {
        roleMapper.deletePermission(permissionId, roleId);
        return true;
    }


    @Override
    public PageInfo<Permission> findNoPermissionByRoleId(Integer pages, Integer pageSize, Integer roleId) {
        PageHelper.startPage(pages, pageSize);
        List<Permission> permissions = roleMapper.findNoPermissionByRoleId(roleId);
        return new PageInfo(permissions);
    }

    @Override
    public List<Permission> findPermission(Integer roleId) {
        return roleMapper.findPermissionByRoleId(roleId);
    }

    @Override
    public boolean addRole(Role role) {
        return roleMapper.addRole(role) > 0;
    }

    @Override
    public Role findById(Integer roleId) {
        return roleMapper.findById(roleId);
    }

    /**
     * 根据角色ID查询出所有未添加的权限
     *
     * @param page
     * @param pageSize
     * @param roleId
     * @return
     */
    @Override
    public PageInfo<Permission> findPermissionByRoleId(Integer page, Integer pageSize, Integer roleId) {
        PageHelper.startPage(page, pageSize);
        List<Permission> permissions = roleMapper.findPermissionByRoleId(roleId);
        return new PageInfo(permissions);
    }


    @Override
    public PageInfo<Role> findAllByPage(Integer page, Integer pageSize, HashMap<String, String> map) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(roleMapper.findAll(map));
    }

    @Override
    public boolean update(Role role) {
        //去掉空格
        String updateRoleName = role.getRoleName().replaceAll(" +", "");
        String roleNameDb = roleMapper.findRoleNameById(role.getId());
        if (roleNameDb != null && roleNameDb.equals(updateRoleName)) {
            //没改角色名,可以修改
            roleMapper.update(role);
            return true;
        } else {
            //修改了角色名,查看数据路是否存在角色名;
            Role roleDb = roleMapper.findByRoleName(updateRoleName);
            if (roleDb != null) {
                //存在角色
                return false;
            }
            //不存在角色
            roleMapper.update(role);
            return true;
        }

    }

    /**
     * 删除角色
     *
     * @param roleId
     * @return
     */
    @Override
    public boolean deleteById(Integer roleId) {
        //1.1判断这个角色是否有用户
        List<UsersInfo> usersInfoList = roleMapper.findUserByRoleId(roleId);
        if (usersInfoList.size() <= 0) {
            //没有用户，先删除角色的权限，再删除角色
            //1.2查询这个角色全部的权限
            List<Permission> permissions = roleMapper.findPermissionsById(roleId);
            if (permissions.size() > 0) {
                for (Permission permission : permissions) {
                    //删除角色全部的权限(从中间表)
                    roleMapper.deletePermission(permission.getId(), roleId);
                }
            }
            //1.3.再删除角色
            roleMapper.deleteById(roleId);
            return true;

        } else {
            //有用户不能删除
            return false;
        }

    }

    @Override
    public void deleteById(String[] ids) {
        for (String id : ids) {
            roleMapper.deleteById(Integer.parseInt(id));
        }
    }

}
