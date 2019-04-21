package com.rumofuture.summer.controller;

import com.rumofuture.summer.model.User;
import com.rumofuture.summer.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SummerController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpSession session;

    public HttpServletRequest getRequest() {
        return request;
    }

    public HttpSession getSession() {
        return session;
    }

    public void setSessionUser(User user) {
        session.setAttribute(Constant.USER, user);
    }

    public User getSessionUser() {
        return (User) session.getAttribute(Constant.USER);
    }
}
