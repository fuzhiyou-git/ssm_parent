package com.itheima.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.util.EmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.itheima.pojo.SysLog;
import com.itheima.service.SysLogService;

import java.util.List;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    @Autowired
    private SysLogService sysLogService;

    /**
     * 跳到日志界面
     *
     * @return
     */
    @RequestMapping("/toList")
    public String toSyslogTJ(String pwd) {
        return "sysLog/syslog-" + pwd;
    }

    @RequestMapping("/findAll")
    @ResponseBody
    public PageInfo<SysLog> findAll(Integer pages, Integer pageSize, String username) {
        return sysLogService.findAllByPage(pages, pageSize, username);
    }


    @RequestMapping("/deleteSys")
    @ResponseBody
    public boolean deleteSys(@RequestBody List<String> ids) {
        return sysLogService.delSelected(ids);
    }


    /**
     * 测试异常信息
     */
    @RequestMapping("/testEmailException")
    public String testEmailException() {
        EmailUtil.sendHtmlMail("chiyu96@sina.com",
                "测试异常邮箱信息",
                "这是一条测试异常信息，管理员不必惊慌");
        return "../../main";

    }
}
