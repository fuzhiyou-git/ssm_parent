package com.itheima.pojo;

import com.itheima.util.DateUtils;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class SysLog {
    private String id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date visitTime;
    private String visitTimeStr;
    private String username;
    private String ip;
    private String url;
    private Long executionTime;
    private String method;


    public String getVisitTimeStr() {
        if (visitTime != null) {
            visitTimeStr = DateUtils.dateToStr(visitTime, "yyyy-MM-dd HH:mm");
        }
        return visitTimeStr;
    }

}
