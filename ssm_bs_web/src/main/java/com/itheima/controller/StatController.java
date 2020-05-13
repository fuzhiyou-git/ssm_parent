package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.itheima.service.StatService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sysLog")
public class StatController {
    @Reference
    private StatService statService;

    /**
     * 页面跳转
     *
     * @return
     */
    @RequestMapping("/toTJ")
    public String toSyslogTJ(String chartsType) {
        return "sysLog/" + chartsType;
    }


    /**
     * 统计产品销量
     *
     * @return
     */
    @RequestMapping("/viProductAndCount")
    @ResponseBody
    public List<Map<String, Object>> viProductAndCount() {
        return statService.findProductAndCount();
    }

    /**
     * 统计系统浏览量
     *
     * @return
     */
    @RequestMapping("/viUserAndCount")
    @ResponseBody
    public List<Map<String, Object>> findUsernameAndCount() {
        return statService.findUsernameAndCount();
    }


    /**
     * 测试系统访问压力
     *
     * @return
     */
    @RequestMapping("/getOnlineData")
    @ResponseBody
    public List<Map<String, Object>> getOnlineData() {
        return statService.getOnlineData();
    }
}
