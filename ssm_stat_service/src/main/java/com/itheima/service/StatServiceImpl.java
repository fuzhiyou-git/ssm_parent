package com.itheima.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.mapper.StatMapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@Service
public class StatServiceImpl implements StatService {

    @Autowired
    private StatMapper statMapper;

    /**
     * 统计用户浏览量
     *
     * @return
     */
    @Override
    public List<Map<String, Object>> findUsernameAndCount() {
        return statMapper.findUsernameAndCount();
    }

    /**
     * 统计产品销量
     *
     * @return
     */
    @Override
    public List<Map<String, Object>> findProductAndCount() {
        return statMapper.findProductAndCount();
    }


    /**
     * 测试系统压力
     *
     * @return
     */
    @Override
    public List<Map<String, Object>> getOnlineData() {
        return statMapper.getOnlineData();
    }
}
