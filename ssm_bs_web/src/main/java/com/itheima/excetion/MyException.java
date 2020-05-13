package com.itheima.excetion;

import com.itheima.util.EmailUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;

@Component
public class MyException implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ModelAndView mv = new ModelAndView();

        mv.addObject("errorWhy", getExceptionType(ex));
        mv.addObject("errorFinally", getExceptionStringStackTrace(ex));
        //发送异常信息给管理员
        EmailUtil.sendHtmlMail("chiyu96@sina.com", "异常原因:" + getExceptionType(ex).toString(), "异常跟踪栈:" + getExceptionStringStackTrace(ex));
        mv.setViewName("../../failer-403");
        return mv;
    }

    /**
     * 异常具体位置
     *
     * @param e
     * @return
     */
    private String getExceptionStringStackTrace(Exception e) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        return sw.toString();
    }


    /**
     * 异常类型
     *
     * @param e
     * @return
     */
    private Throwable getExceptionType(Exception e) {
        return e;
    }
}
