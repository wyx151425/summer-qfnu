package com.rumofuture.summer.service.impl;

import com.rumofuture.summer.context.SummerException;
import com.rumofuture.summer.model.User;
import com.rumofuture.summer.repository.UserDao;
import com.rumofuture.summer.service.UserService;
import com.rumofuture.summer.util.Constant;
import com.rumofuture.summer.util.Generator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public User login(User user) {
        User targetUser = userDao.selectByMobilePhoneNumber(user.getMobilePhoneNumber());
        if (null == targetUser) {
            throw new SummerException(Constant.RespStatus.USER_UNREGISTER);
        } else {
            if (0 == targetUser.getStatus()) {
                throw new SummerException(Constant.RespStatus.USER_DISABLE);
            } else {
                if (targetUser.getPassword().equals(user.getPassword())) {
                    return targetUser;
                } else {
                    throw new SummerException(Constant.RespStatus.USER_PASSWORD_ERROR);
                }
            }
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void register(User user) {
        User targetUser = userDao.selectByMobilePhoneNumber(user.getMobilePhoneNumber());
        if (null == targetUser) {
            user.setObjectId(Generator.getObjectId());
            user.setStatus(1);
            LocalDateTime at = LocalDateTime.now().withNano(0);
            user.setCreateAt(at);
            user.setUpdateAt(at);
            user.setEmail("");
            user.setIdNumber("");
            user.setType(1);
            userDao.save(user);
        } else {
            throw new SummerException(Constant.RespStatus.USER_REGISTERED);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public User updateUser(User user) {
        if (null != user.getIdNumber() && !"".equals(user.getIdNumber())) {
            User targetUser = userDao.selectByIdNumber(user.getIdNumber());
            if (null != targetUser && !targetUser.getId().equals(user.getId())) {
                throw new SummerException(Constant.RespStatus.USER_ID_NUMBER_EXIST);
            }
        }
        user.setUpdateAt(LocalDateTime.now().withNano(0));
        userDao.update(user);
        return userDao.selectById(user.getId());
    }
}
