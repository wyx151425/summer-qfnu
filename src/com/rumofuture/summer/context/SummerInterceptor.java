package com.rumofuture.summer.context;


import com.alibaba.fastjson.JSON;
import com.rumofuture.summer.model.Response;
import com.rumofuture.summer.model.User;
import com.rumofuture.summer.util.Constant;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class SummerInterceptor implements HandlerInterceptor {

    private static final String REGISTER_URI = "%s/mvc/register";
    private static final String LOGIN_URI = "%s/mvc/login";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        /* 1.请求相关数据 操作 */
        String contextPath = request.getContextPath();
        String uri = request.getRequestURI();

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");

        /* 2.非拦截路由 检查 */
        if (uri.contains("/mvc")) {
            if (String.format(REGISTER_URI, contextPath).equals(uri)
                    || String.format(LOGIN_URI, contextPath).equals(uri)) {
                return true;
            }
        } else {
            return true;
        }

        /* 3.登录检查 */
        User user = (User) request.getSession().getAttribute(Constant.USER);
        if (null == user) {
            response.sendRedirect(request.getContextPath() + "/mvc/login");
            return false;
        } else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
