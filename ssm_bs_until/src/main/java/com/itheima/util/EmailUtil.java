package com.itheima.util;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtil {
    private static final String HOST = "smtp.163.com";   // 发送邮件邮箱的配置
    private static final Integer PORT = 25;
    private static final String USERNAME = "18289387963@163.com";//163邮箱账号
    private static final String PASSWORD = "HQJIQIAACQDZZRPP";//163邮箱---授权码
    private static final String EMAILFORM = "18289387963@163.com";  //发送邮件的用户
    private static JavaMailSenderImpl mailSender = createMailSender();
     private static final String EMAILNAME = "系统信息";  //收到邮件显示对方邮件名称 总体名称

    /**
     * 邮件发送器
     *
     * @return 配置好的工具
     */
    private static JavaMailSenderImpl createMailSender() {
        JavaMailSenderImpl sender = new JavaMailSenderImpl();
        sender.setHost(HOST);
        sender.setPort(PORT);
        sender.setUsername(USERNAME);
        sender.setPassword(PASSWORD);
        sender.setDefaultEncoding("UTF-8");
        Properties p = new Properties();
        p.setProperty("mail.smtp.auth", "true");
        sender.setJavaMailProperties(p);
        return sender;
    }

    /**
     * 发送邮件
     *
     * @param to      邮件接收人
     * @param subject 主题
     * @param msg     发送内容
     */
    public static void sendHtmlMail(String to, String subject, String msg) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();

            // 设置utf-8或GBK编码，否则邮件会有乱码
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "utf-8");
            messageHelper.setFrom(EMAILFORM,EMAILNAME);
            messageHelper.setCc(EMAILFORM);
            messageHelper.setTo(to);
            messageHelper.setSubject(subject);
            messageHelper.setText(msg, true);
            mailSender.send(mimeMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
