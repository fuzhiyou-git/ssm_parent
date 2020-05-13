package com.itheima.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.pojo.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.mapper.UserMapper;
import com.itheima.pojo.Role;
import com.itheima.pojo.UsersInfo;

import java.util.*;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RoleService roleService;

    @Override
    public UsersInfo findUserById(int userId) {
        return userMapper.findUserById(userId);
    }

  /*  @Override
    public List<Role> findUserByIdAndAllRole(Integer userId, Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        return userMapper.findUserByIdAndAllRole(userId);
    }*/

    /**
     * 添加角色给用户
     *
     * @param userId
     * @param roleIds
     * @return
     */
    @Override
    public boolean addRoleTOUser(Integer userId, List<Integer> roleIds) {
        for (Integer roleId : roleIds) {
            userMapper.addRoleTOUser(userId, roleId);
        }
        return true;
    }

    @Override
    public UsersInfo login(String username, String password) {
        return userMapper.login(username, password);
    }

    @Override
    public PageInfo<UsersInfo> findAllByPage(Integer page, Integer pageSize, Map<String, String> map) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(userMapper.findAll(map));

    }

    /**
     * 修改用户
     *
     * @param usersInfo
     * @return
     */
    @Override
    public boolean updateUser(UsersInfo usersInfo) {
        //3.根据id查询是否改变用户名
        String username_Db = userMapper.findUsernameById(usersInfo.getId());
        if (usersInfo.getUsername() != null && usersInfo.getUsername().equals(username_Db)) {
            //3.1用户名没有改变更新
            userMapper.updateUser(usersInfo);
            return true;
        } else {
            //3.2修改用户名更新
            UsersInfo userHave = userMapper.findUserByUsername(usersInfo.getUsername());
            if (userHave != null) {
                //存在用户名
                return false;
            } else {
                userMapper.updateUser(usersInfo);
                return true;
            }
        }

    }

    @Override
    public UsersInfo findById(String id) {
        return userMapper.findById(Integer.valueOf(id));
    }

    /**
     * 删除用户
     *
     * @param userId
     * @return
     */
    @Override
    public boolean deleteById(Integer userId) {

        //1查询用户是否有角色
        List<Role> roleList = userMapper.findRoleById(userId);
        if (roleList.size() > 0) {
            return false;
        }

        //2.删除用户
        userMapper.deleteById(userId);
        return true;

    }

    /**
     * 删除选中
     *
     * @param ids
     * @return
     */
    @Override
    public boolean delSelected(List<Integer> ids) {
        userMapper.delSelected(ids);
        return true;
    }


    /**
     * 查询用户名是否存在
     *
     * @param username
     * @return
     */
    @Override
    public boolean findByUsername(String username) {
        //去空格处理
        if (username.contains(" ")) {
            username = username.replaceAll(" +", "");
        }

        return userMapper.findByUsername(username) != null;
    }


    @Override
    public boolean changeStatusAs_0(String id) {
        int changeStatusAs_0 = userMapper.changeStatusAs_0(Integer.valueOf(id));
        return changeStatusAs_0 > 0;
    }

    @Override
    public boolean changeStatusAs_1(String id) {
        int changeStatusAs_1 = userMapper.changeStatusAs_1(Integer.valueOf(id));
        return changeStatusAs_1 > 0;
    }


  /*  @Override
    public List<Role> findRoleById(String id) {
        return userMapper.findRoleById(Integer.valueOf(id));
    }
*/
    @Override
    public boolean deleteRoleByUserId(Integer id, Integer userId) {
        //删除角色
        userMapper.deleteRole(id, userId);
        //删除权限
        //  roleService.deletePermissionByROleId(id);
        return true;
    }


    @Override
    public boolean updatePassword(String password, String username) {
        password = bCryptPasswordEncoder.encode(password);
        userMapper.updatePassword(password, username);
        return true;
    }

    /**
     * 查询用户所有的权限
     *
     * @param user
     * @return
     */
    @Override
    public List<Permission> findAllPermission(User user) {
        //获取该用户的所有角色
        Collection<GrantedAuthority> roles = user.getAuthorities();
        List<Permission> permissions = null;
        List<Permission> dbPermission = new ArrayList();
        for (GrantedAuthority role : roles) {
            String roleName = role.getAuthority().replace("ROLE_", "");

            //根据角色名称查询所有的权限
            permissions = permissionService.findAndAllPermissionByRoleName(roleName);
            if (permissions != null) {
                for (Permission permission : permissions) {
                    dbPermission.add(permission);
                }
            }

        }

        return dbPermission;
    }

    /**
     * 查询用户所有的角色
     *
     * @param page
     * @param pageSize
     * @param id
     * @return
     */
    @Override
    public PageInfo<Role> findRoleByUserId(Integer page, Integer pageSize, Integer id) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(userMapper.findRoleById(id));
    }

    @Override
    public PageInfo<Role> findNORoleByUserId(Integer id, Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(userMapper.findNORoleByUserId(id));
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UsersInfo usersInfo = userMapper.findByUserName(username);
        return new User(usersInfo.getUsername(), usersInfo.getPassword(),
                usersInfo.getStatus() == 0 ? false : true,
                true,
                true,
                true, getAuthority(usersInfo.getRoles()));
    }

    public List<SimpleGrantedAuthority> getAuthority(List<Role> roleList) {
        ArrayList<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roleList) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));

        }
        return list;
    }

    /**
     * 添加用户
     *
     * @param usersInfo
     * @return
     */
    @Override
    public boolean addUser(UsersInfo usersInfo) {
        usersInfo.setPassword(bCryptPasswordEncoder.encode(usersInfo.getPassword()));
        userMapper.addUser(usersInfo);
        return true;
    }

    @Override
    public List<UsersInfo> findAll(Map map) {
        return userMapper.findAll(map);
    }
}
