<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2016/12/29
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="网站关键词">
    <meta name="Description" content="网站介绍">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ui/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ui/css/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ui/css/reg.css">
    <title>用户注册</title>

    <style>
        .tips {
            color: #f71313;
            margin: 0;
            height: 20px;
            line-height: 20px;
            font-size: 14px;
            padding-left: 14px;
            text-align: left;
        }
    </style>

    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function () {

            var nameView = $("#name");
            var namePrompt = $("#namePrompt");

            var mobilePhoneNumberView = $("#mobilePhoneNumber");
            var mobilePhoneNumberPrompt = $("#mobilePhoneNumberPrompt");

            var passwordView = $("#password");
            var passwordPrompt = $("#passwordPrompt");

            var name = nameView.val();
            var mobilePhoneNumber = mobilePhoneNumberView.val();
            var password = passwordView.val();

            var promptView = $("#prompt");

            nameView.focus(function () {
                namePrompt.addClass("changebgimg");
                promptView.text("");
            });
            nameView.blur(function () {
                namePrompt.removeClass("changebgimg");
            });

            mobilePhoneNumberView.focus(function () {
                mobilePhoneNumberPrompt.addClass("changebgimg");
                promptView.text("");
            });
            mobilePhoneNumberView.blur(function () {
                mobilePhoneNumberPrompt.removeClass("changebgimg");
            });

            passwordView.focus(function () {
                passwordPrompt.addClass("changebgimg");
                mobilePhoneNumber = mobilePhoneNumberView.val();
                if ("" === mobilePhoneNumber || 11 !== mobilePhoneNumber.length) {
                    promptView.text("请输入正确格式的手机号码");
                }
            });
            passwordView.blur(function () {
                passwordPrompt.removeClass("changebgimg");
            });

            $("#registerBtn").click(function () {

                name = nameView.val();
                mobilePhoneNumber = mobilePhoneNumberView.val();
                password = passwordView.val();

                if ("" === name || name.length < 2) {
                    nameView.focus();
                    promptView.text("请输入正确格式的姓名");
                    return;
                }

                if ("" === mobilePhoneNumber || 11 !== mobilePhoneNumber.length) {
                    mobilePhoneNumberView.focus();
                    promptView.text("请输入正确格式的手机号码");
                    return;
                }

                if ("" === password || password.length < 6) {
                    mobilePhoneNumberView.focus();
                    promptView.text("请输入正确格式的密码");
                    return;
                }

                promptView.text("注册信息校验中...");

                $.ajax("${pageContext.request.contextPath}/api/users",
                    {
                        dataType: "json",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify(
                            {
                                name: name,
                                mobilePhoneNumber: mobilePhoneNumber,
                                password: password
                            }
                        ),
                        async: true,
                        success: function (data) {
                            if (200 === data.statusCode) {
                                promptView.text("注册成功");
                                window.location.href = "${pageContext.request.contextPath}/mvc/login";
                            } else if (7002 === data.statusCode){
                                promptView.text("用户已存在");
                            } else {
                                promptView.text("系统错误");
                            }
                        }
                    }
                );
            });
        });
    </script>
</head>
<body>
<div id="ajax-hook"></div>
<div class="wrap">
    <div class="wpn">
        <div class="form-data pos">
            <form>
                <p class="p-input pos">
                    <label for="name">真实姓名</label>
                    <input type="text" id="name" autocomplete="off">
                    <span class="tel-warn tel-err hide"><em></em><i class="icon-warn"></i></span>
                </p>
                <p class="p-input pos">
                    <label for="mobilePhoneNumber">手机号</label>
                    <input type="number" id="mobilePhoneNumber" autocomplete="off">
                    <span class="tel-warn tel-err hide"><em></em><i class="icon-warn"></i></span>
                </p>
                <p class="p-input pos">
                    <label for="password">密码</label>
                    <input type="number" id="password" autocomplete="off">
                    <span class="tel-warn tel-err hide"><em></em><i class="icon-warn"></i></span>
                </p>
            </form>
            <div class="reg_checkboxline pos">
                <span class="z"><i class="icon-ok-sign boxcol" nullmsg="请同意!"></i></span>
                <input type="hidden" name="agree" value="1">
                <div class="Validform_checktip"></div>
                <p>我已阅读并接受 <a href="#" target="_brack">《协议说明》</a></p>
            </div>
            <div class="reg_checkboxline pos"><p id="prompt" class="tips"></p></div>
            <button id="registerBtn" type="button" class="lang-btn">注册</button>
            <div class="bottom-info">已有账号，<a href="${pageContext.request.contextPath}/mvc/login">马上登录</a></div>
            <div class="third-party">
                <a href="#" class="log-qq icon-qq-round"></a>
                <a href="#" class="log-qq icon-weixin"></a>
                <a href="#" class="log-qq icon-sina1"></a>
            </div>
            <p class="right">Powered by © 2018</p>
        </div>
    </div>
</div>
</div>
</body>
</html>
