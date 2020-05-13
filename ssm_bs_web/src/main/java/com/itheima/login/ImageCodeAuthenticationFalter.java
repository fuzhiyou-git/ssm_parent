package com.itheima.login;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ImageCodeAuthenticationFalter extends OncePerRequestFilter {

    private AuthenticationFailureHandler afh;

    public void setAfh(AuthenticationFailureHandler afh) {
        this.afh = afh;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
        //获取当前是否是登录路径
        if (request.getRequestURI().contains("/login")) {
            try {
                //获取用户输入的验证码
                String login_checkCode = request.getParameter("verifycode");

                //获取系统生成的验证码
                String checkCode = (String) request.getSession().getAttribute("checkCode");
                if (StringUtils.isEmpty(login_checkCode)) {
                    throw new ImageCodeException("请输入验证码");
                }
                if (!checkCode.trim().equalsIgnoreCase(login_checkCode)) {
                    throw new ImageCodeException("验证码不一致");
                }
            } catch (AuthenticationException e) {
                afh.onAuthenticationFailure(request, response, e);
                return;
            }
        }
        //不包含登录路径，放行
        chain.doFilter(request, response);
    }


}