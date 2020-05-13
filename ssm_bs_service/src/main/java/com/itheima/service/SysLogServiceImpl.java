package com.itheima.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.mapper.SysLogMapper;
import com.itheima.pojo.SysLog;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements SysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;


    @Override
    public PageInfo<SysLog> findAllByPage(Integer page, Integer pageSize, String username) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(sysLogMapper.findAll(username));
    }

    @Override
    public boolean delSelected(List<String> ids) {
        sysLogMapper.delSelected(ids);
        return true;
    }


    @Override
    public void addSysLog(SysLog sysLog) {
        sysLogMapper.addSysLog(sysLog);
    }


}
