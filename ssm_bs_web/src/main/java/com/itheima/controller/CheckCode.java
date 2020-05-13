package com.itheima.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

@Controller
public class CheckCode {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    @RequestMapping("/checkCode")
    public void MyCheckCode() throws IOException {

        int width = 80;
        int height = 32;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        g.setColor(new Color(0xD1EEEE));
        g.fillRect(0, 0, width, height);
        g.setColor(Color.black);
        g.drawRect(0, 0, width - 1, height - 1);
        Random random = new Random();
        String hash = Integer.toHexString(random.nextInt());
        for (int i = 0; i < 50; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            g.drawOval(x, y, 0, 0);
        }

        String checkCode = hash.substring(0, 4);
        request.getSession().setAttribute("checkCode", checkCode);
        g.setColor(new Color(1, 88, 8));
        g.setFont(new Font("黑体", Font.BOLD, 24));
        g.drawString(checkCode, 8, 24);
        g.dispose();
        response.setContentType("image/jpeg");
        // out.clear();

        OutputStream strm = response.getOutputStream();
        ImageIO.write(image, "jpeg", strm);
        strm.close();
    }
}