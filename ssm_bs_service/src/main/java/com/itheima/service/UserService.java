package com.itheima.service;

import com.github.pagehelper.PageInfo;
import com.itheima.pojo.Permission;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import com.itheima.pojo.Role;
import com.itheima.pojo.UsersInfo;

import java.util.List;
import java.util.Map;

public interface UserService extends UserDetailsService {
    List<UsersInfo> findAll(Map map);

    boolean addUser(UsersInfo usersInfo);

    UsersInfo findUserById(int userId);

   /* List<Role> findUserByIdAndAllRole(Integer userId, Integer page, Integer pageSize);*/

    boolean addRoleTOUser(Integer userId, List<Integer> roleIds);

    UsersInfo login(String username, String password);


    PageInfo<UsersInfo> findAllByPage(Integer page, Integer pageSize, Map<String, String> map);

    boolean updateUser(UsersInfo usersInfo);

    UsersInfo findById(String id);


    boolean deleteById(Integer id);

    boolean delSelected(List<Integer> ids);


    boolean findByUsername(String username);

    boolean changeStatusAs_0(String id);

    boolean changeStatusAs_1(String id);

   /* List<Role> findRoleById(String id);*/

    //删除用户的角色和权限
    boolean deleteRoleByUserId(Integer id, Integer userId);

    boolean updatePassword(String password, String id);

    List<Permission> findAllPermission(User user);

    PageInfo<Role> findRoleByUserId(Integer page, Integer pageSize, Integer id);

    PageInfo<Role> findNORoleByUserId(Integer id, Integer page, Integer pageSize);
}
