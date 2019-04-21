package com.rumofuture.summer.controller;

import com.rumofuture.summer.context.SummerException;
import com.rumofuture.summer.model.Response;
import com.rumofuture.summer.model.User;
import com.rumofuture.summer.service.UserService;
import com.rumofuture.summer.util.Constant;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "api")
public class UserController extends SummerController {

    @Autowired
    private UserService userService;

    @PostMapping("users/login")
    public Response<User> actionLogin(@RequestBody User user, HttpServletRequest request) {
        User targetUser = userService.login(user);
        setSessionUser(targetUser);
        return new Response<>(targetUser);
    }

    @PostMapping(value = "users/logout")
    public Response<Object> actionLogout() {
        setSessionUser(null);
        return new Response<>();
    }

    @PostMapping(value = "users")
    public Response<User> actionRegister(@RequestBody User user) {
        userService.register(user);
        return new Response<>(user);
    }

    @PutMapping(value = "users")
    public Response<Object> actionUpdateUser(@RequestBody User user) {
        User targetUser = userService.updateUser(user);
        setSessionUser(targetUser);
        return new Response<>();
    }
}
