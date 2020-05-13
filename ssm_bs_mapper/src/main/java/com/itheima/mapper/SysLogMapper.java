package com.itheima.mapper;

import com.itheima.pojo.Product;
import org.apache.ibatis.annotations.*;
import com.itheima.pojo.SysLog;

import java.util.List;
import java.util.Map;

public interface SysLogMapper {

    @Insert("insert into syslog (id,visitTime,username,ip,url,executionTime,method) values (#{id},#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void addSysLog(SysLog sysLog);

    List<SysLog> findAll(@Param("username") String username);

    @Delete("delete from syslog where id=#{id}")
    void deleteById(int id);


    void delSelected(@Param("ids") List<String> ids);
}
