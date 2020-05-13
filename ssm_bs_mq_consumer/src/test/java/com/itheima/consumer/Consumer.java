package com.itheima.consumer;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;

public class Consumer {
    public static void main(String[] args) throws IOException {
        ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("spring-rabbitmq-consumer.xml");
        context.start();
        System.in.read();
    }
}
