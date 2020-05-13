package com.itheima.listener;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itheima.util.EmailUtil;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.stereotype.Component;

@Component
public class EmailListener implements MessageListener {


    private static final ObjectMapper MAPPER = new ObjectMapper();

    @Override
    public void onMessage(Message message) {
        try {
            JsonNode jsonNode = MAPPER.readTree(message.getBody());

            // 获取队列中消息
            String to = jsonNode.get("to").asText();
            String subject = jsonNode.get("subject").asText();
            String content = jsonNode.get("content").asText();

            // 打印测试
            System.out.println("新员工的邮箱>>>>" + to);
            System.out.println("主题>>>>" + subject);
            System.out.println("发送的内容>>>>" + content);
            // 发送邮件
            EmailUtil.sendHtmlMail(to, subject, content);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
