package com.itheima.provice;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;

public class Provice {
    public static void main(String[] args) throws IOException {
        ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("classpath*:spring/spring-*.xml");
        context.start();
        System.out.println("统计dubbo服务工程已开启");
        System.in.read();
    }
}
