package com.itheima.service;

import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface StatService {

    /**
     * 统计用户浏览量
     *
     * @return
     */
    List<Map<String, Object>> findUsernameAndCount();

    /**
     * 统计产品销量
     *
     * @return
     */
    List<Map<String, Object>> findProductAndCount();

    /**
     * 测试系统压力
     *
     * @return
     */
    List<Map<String, Object>> getOnlineData();
}
