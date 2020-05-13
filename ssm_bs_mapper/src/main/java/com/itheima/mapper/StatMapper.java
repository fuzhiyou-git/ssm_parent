package com.itheima.mapper;

import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface StatMapper {
    /**
     * 查询系统访问量
     *
     * @return
     */
    @Select("SELECT username username, COUNT(*) count FROM syslog GROUP BY username ORDER BY COUNT(*) DESC")
    List<Map<String, Object>> findUsernameAndCount();


    /**
     * 查询出购买次数排名前8的产品和购买次数
     *
     * @return
     */
    @Select("SELECT productNum productNum, COUNT(*) count FROM product p RIGHT JOIN member_product mp ON p.id=mp.productId GROUP BY productId ORDER BY COUNT(productId) DESC LIMIT 0,8")
    List<Map<String, Object>> findProductAndCount();

    List<Map<String, Object>> getOnlineData();
}
