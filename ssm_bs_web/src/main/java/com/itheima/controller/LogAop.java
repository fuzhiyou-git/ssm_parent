package com.itheima.controller;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itheima.pojo.SysLog;
import com.itheima.service.SysLogService;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

//是一个切面，一个配置类;
@Component
@Aspect
public class LogAop {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private SysLogService sysLogService;

    private Date visitDate;//访问的时间;
    private String fullClassName; //获取访问的额类全名
    private String methodName;   //获取访问的方法名;


    //前置通知;
    @Before("bean(*Controller)&&!bean(checkCode)&&!execution(* *.*.*.SysLogController.*(..))")
    public void doBefore(JoinPoint joinPoint) {
        //1.获取访问的时间;
        visitDate = new Date();
        //2.获取访问的类全名;
        fullClassName = joinPoint.getTarget().getClass().getName().replace(".", "/");

        //3.获取访问的方法;
        methodName = joinPoint.getSignature().getName();

    }

    //后置通知;
    @After("bean(*Controller)&&!bean(checkCode)&&!execution(* *.*.*.SysLogController.*(..))")
    public void doAfter() {

        //获取访问的ip;
        String ip = request.getRemoteAddr();
        //获取操作者;
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User) context.getAuthentication().getPrincipal();


        //获取访问时间的时长;
        long executionTime = new Date().getTime() - visitDate.getTime();
        //封装SysLog对象;
        SysLog sysLog = new SysLog();
        sysLog.setId(UUID.randomUUID().toString());
        sysLog.setVisitTime(visitDate);
        sysLog.setUsername(user.getUsername());
        sysLog.setIp(ip);
        sysLog.setUrl(fullClassName + "/" + methodName);
        sysLog.setExecutionTime(executionTime);
        sysLog.setMethod("[方法名是:]" + methodName);

        //调用service完成添加日志操作;
        sysLogService.addSysLog(sysLog);

    }
}
