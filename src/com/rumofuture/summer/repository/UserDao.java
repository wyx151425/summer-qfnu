package com.rumofuture.summer.repository;

import com.rumofuture.summer.model.User;
import org.springframework.stereotype.Repository;

@Repository(value = "userDao")
public interface UserDao {
    void save(User user);
    void update(User user);
    User selectById(Integer id);
    User selectByMobilePhoneNumber(String mobilePhoneNumber);
    User selectByIdNumber(String idNumber);
}
