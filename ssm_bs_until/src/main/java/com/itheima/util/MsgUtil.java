package com.itheima.util;

import java.util.HashMap;
import java.util.Map;

public class MsgUtil {

    public static Map map(String to, String username) {
        Map<String, String> map = new HashMap();
        String subject = "新员工入职通知";
        String content = username + ",欢迎来到我们公司,我们是一家创业型的公司,不是996哦";

        map.put("to", to);
        map.put("subject", subject);
        map.put("content", content);
        return map;
    }
}
