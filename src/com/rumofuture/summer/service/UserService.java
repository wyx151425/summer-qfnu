package com.rumofuture.summer.service;

import com.rumofuture.summer.model.User;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
    User login(User user);
    void register(User user);
    User updateUser(User user);
}
