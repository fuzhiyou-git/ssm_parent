package com.itheima.mapper;

import org.apache.ibatis.annotations.*;
import com.itheima.pojo.Role;
import com.itheima.pojo.UsersInfo;

import java.util.List;
import java.util.Map;

public interface UserMapper {


    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "username", property = "username"),
            @Result(column = "password", property = "password"),
            @Result(column = "status", property = "status"),
            @Result(column = "id", property = "roles", javaType = java.util.List.class, many = @Many(select = "com.itheima.mapper.RoleMapper.findRoleByUserId"))


    })
    UsersInfo findByUserName(String username);


    /**
     * 查询所有用户
     *
     * @param map
     * @return
     */
    List<UsersInfo> findAll(@Param("map") Map<String, String> map);


    /**
     * 添加用户
     *
     * @param usersInfo
     */
    @Insert("insert into users  values (null,#{email},#{username},#{password},#{phoneNum},#{status})")
    int addUser(UsersInfo usersInfo);

    @Select("select * from users u where id=#{userId}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "username", property = "username"),
            @Result(column = "email", property = "email"),
            @Result(column = "password", property = "password"),
            @Result(column = "phoneNum", property = "phoneNum"),
            @Result(column = "status", property = "status"),
            @Result(column = "id", property = "roles", javaType = java.util.List.class, many = @Many(select = "com.itheima.mapper.RoleMapper.findRoleByUserId"))

    })
    UsersInfo findUserById(int userId);


    /**
     * 用户添加角色
     *
     * @param userId
     * @return
     */
    @Select("select * from role  where id not in(select roleId from users_role where userId=#{userId} )")
    List<Role> findUserByIdAndAllRole(Integer userId);


    /**
     * 查询用户有的角色
     *
     * @param userId
     * @return
     */
    @Select("select * from role  where id in(select roleId from users_role where userId=#{userId} )")
    List<Role> findRoleById(Integer userId);

    /**
     * 添加角色给用户
     *
     * @param userId
     * @param roleId
     */
    @Insert("insert into users_role (userId,roleId) values (#{userId},#{roleId})")
    void addRoleTOUser(@Param("userId") Integer userId, @Param("roleId") Integer roleId);


    /**
     * 登录功能
     *
     * @param username
     * @param password
     * @return
     */
    @Select("select u.username,u.password, u.STATUS from users u where username =#{username} and password =#{password}")
    UsersInfo login(@Param("username") String username, @Param("password") String password);


    /**
     * 更新用户
     *
     * @param usersInfo
     */
    @Update("update users set email=#{email},username=#{username},phoneNum=#{phoneNum} where id=#{id}")
    void updateUser(UsersInfo usersInfo);

    /**
     * 查询一个用户
     *
     * @param id
     * @return
     */
    @Select("select * from users where id=#{id}")
    UsersInfo findById(int id);

    /**
     * 删除一个用户
     *
     * @param id
     */

    @Delete("delete  from users where id=#{id}")
    void deleteById(Integer id);


    /**
     * 根据ID查询用户名
     *
     * @param id
     * @return
     */
    @Select("select username from users where id=#{id}")
    String findUsernameById(Integer id);


    /**
     * 根据用户名查询是否存在用户
     *
     * @param username
     * @return
     */
    @Select("select u.username,u.password, u.STATUS from users u where username=#{username}")
    UsersInfo findUserByUsername(String username);

    /**
     * 根据用户名和电话号码查询用户
     *
     * @param username
     * @param phoneNum
     * @return
     */
    List<UsersInfo> findByManyCondition(@Param("username") String username, @Param("phoneNum") String phoneNum);


    @Select("select username from users where username=#{username}")
    UsersInfo findByUsername(@Param("username") String username);


    /**
     * 改变用户的状态为0
     *
     * @param id
     */
    @Update("update users set status=0 where id=#{id}")
    int changeStatusAs_0(int id);

    /**
     * 改变用户的状态为1
     *
     * @param id
     */
    @Update("update users set status=1 where id=#{id}")
    int changeStatusAs_1(int id);

    /**
     * @param id
     * @return
     */
    @Select("select roleName from role where id=#{id}")
    String[] findAdminById(int id);

    /**
     * 删除用户中的角色
     *
     * @param roleId
     */
    @Delete("delete from users_role where roleId=#{roleId} and userId=#{userId}")
    void deleteRole(@Param("roleId") Integer roleId, @Param("userId") Integer userId);


    /**
     * 修改密码
     *
     * @param password
     * @param username
     */
    @Update("update users set password=#{password} where username=#{username}")
    void updatePassword(@Param("password") String password, @Param("username") String username);

    /**
     * 删除选中用户
     *
     * @param ids
     * @return
     */
    void delSelected(@Param("ids") List<Integer> ids);

    @Select("select * from role  where id not in(select roleId from users_role where userId=#{userId} )")
    List<Role> findNORoleByUserId(Integer id);
}

