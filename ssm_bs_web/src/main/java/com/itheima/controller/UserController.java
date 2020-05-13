package com.itheima.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.pojo.Permission;
import com.itheima.util.MsgUtil;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.itheima.pojo.Role;
import com.itheima.pojo.UsersInfo;
import com.itheima.service.UserService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    /**
     * 更改用户功能的实现
     *
     * @return
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public boolean updateUser(UsersInfo usersInfo) {
        return userService.updateUser(usersInfo);
    }


    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById")
    @ResponseBody
    public boolean deleteById(Integer id) {
        return userService.deleteById(id);
    }


    /**
     * 给用户添加角色
     */
    @RequestMapping("/addRoleToUser/{userId}")
    @ResponseBody
    public boolean addRoleTOUser(@PathVariable Integer userId, @RequestBody List<Integer> roleIds) {
        return userService.addRoleTOUser(userId, roleIds);

    }


    /**
     * 添加用户功能的实现
     *
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public boolean addUser(UsersInfo user) {
        //获取用户的邮箱和用户名，发送邮箱给员工
        Map<String, String> map = MsgUtil.map(user.getEmail(), user.getUsername());
        rabbitTemplate.convertAndSend("myExchange", "msg.email", map);
        return userService.addUser(user);

    }

    /**
     * 检查添加的用户名是否存在
     *
     * @param username
     * @return
     */
    @RequestMapping("/checkUsername")
    @ResponseBody
    public boolean checkUsername(String username) {
        return userService.findByUsername(username);

    }


    /**
     * 查询所有的用户
     *
     * @param page
     * @param pageSize
     * @return
     */
    //只有具有USER这样的角色的用户才能访问(findAll)
    // @PreAuthorize("hasRole('ROLE_ADMIN')") //这个是spring中的el表达式
    // @Secured({"ROLE_ADMIN"})                 //这个是security内部的注解
    @RequestMapping("/findAllUser")
    @ResponseBody
    public PageInfo<UsersInfo> findAllUser(Integer page, Integer pageSize, String username, String phoneNum) {
        Map<String, String> map = new HashMap<>();
        map.put("username", username);
        map.put("phoneNum", phoneNum);
        return userService.findAllByPage(page, pageSize, map);
    }


    /**
     * 查询用户全部的角色
     *
     * @param page
     * @param pageSize
     * @param id
     * @return
     */
    @RequestMapping("/findRoleByUserId")
    @ResponseBody
    public PageInfo<Role> findRoleByUserId(Integer page, Integer pageSize, Integer id) {
        return userService.findRoleByUserId(page, pageSize, id);
    }


    /**
     * 删除角色
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteRoleById")
    @ResponseBody
    public boolean deleteRoleByUserId(Integer id, Integer userId) {
        return userService.deleteRoleByUserId(id, userId);

    }

    /**
     * 改变用户的状态为0
     *
     * @param id
     * @return
     */
    @RequestMapping("/changeStatusAs_0")
    @ResponseBody
    public boolean changeStatusAs_0(String id) {
        return userService.changeStatusAs_0(id);

    }


    /**
     * 改变用户的状态为1
     *
     * @param id
     * @return
     */
    @RequestMapping("/changeStatusAs_1")
    @ResponseBody
    public boolean changeStatusAs_1(String id) {
        return userService.changeStatusAs_1(id);

    }

    //去修改密码界面
    @RequestMapping("/passwordChange")
    public String to(Authentication au, Model model) {
        //获取登录用户名
        User user = (User) au.getPrincipal();
        model.addAttribute("username", user.getUsername());
        return "user/passwordCge";
    }

    /**
     * 修改密码
     *
     * @param usersInfo
     * @return
     */
    @RequestMapping("/updatePassword")
    @ResponseBody
    public boolean updatePassword(UsersInfo usersInfo) {
        String password = usersInfo.getPassword();
        //调用service层完成修改
        return userService.updatePassword(password, usersInfo.getUsername());
    }

    /**
     * 去用户首页
     *
     * @return
     */
    @RequestMapping("/toUserList")
    public String toUserList() {
        return "user/user-list";
    }


    //根据登录的用户判断他具有的权限
    @RequestMapping("/findAllPermission")
    @ResponseBody
    public List<Permission> findAllPermission(Authentication au) {
        User user = (User) au.getPrincipal();
        return userService.findAllPermission(user);

    }

    /**
     * 去修改用户界面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/findUserById/{id}")
    public String toUpdate(@PathVariable Integer id, Model model) {
        model.addAttribute("usersInfo", userService.findUserById(id));
        return "user/user-update";
    }

    /**
     * 去用户添加角色界面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/toNoRoleByUserId/{id}")
    public String toNoRoleByUserId(@PathVariable Integer id, Model model) {
        model.addAttribute("user", userService.findUserById(id));
        return "user/user-role-add";
    }

    /**
     * 查询用户未添加的角色
     *
     * @param page
     * @param pageSize
     * @param id
     * @return
     */
    @RequestMapping("/findNORoleByUserId")
    @ResponseBody
    public PageInfo<Role> findNORoleByUserId(Integer page,
                                             Integer pageSize, Integer id) {
        return userService.findNORoleByUserId(id, page, pageSize);
    }

}
