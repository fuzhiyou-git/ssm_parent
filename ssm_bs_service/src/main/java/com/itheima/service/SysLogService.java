package com.itheima.service;

import com.github.pagehelper.PageInfo;
import com.itheima.pojo.SysLog;

import java.util.List;

public interface SysLogService {

    void addSysLog(SysLog sysLog);


    PageInfo<SysLog> findAllByPage(Integer page, Integer pageSize, String username);

    boolean delSelected(List<String> ids);


}
