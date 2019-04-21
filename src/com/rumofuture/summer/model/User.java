package com.rumofuture.summer.model;

import java.io.Serializable;

public class User extends Entity implements Serializable {
    private String name;  // 姓名
    private String email;  // 邮箱
    private String mobilePhoneNumber;  // 手机号
    private String idNumber;  // 身份证号
    private String password;  // 密码
    private Integer type;  // 用户类型：0-管理员/1-普通用户

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobilePhoneNumber() {
        return mobilePhoneNumber;
    }

    public void setMobilePhoneNumber(String mobilePhoneNumber) {
        this.mobilePhoneNumber = mobilePhoneNumber;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
