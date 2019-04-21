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
    <title>用户登录</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="网站关键词">
    <meta name="Description" content="网站介绍">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ui/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ui/css/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ui/css/reg.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

    <title>用户登录</title>

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

    <script>
        $(document).ready(function () {
            var promptView = $("#prompt");

            var mobilePhoneNumberView = $("#mobilePhoneNumber");
            var mobilePhoneNumberPrompt = $("#mobilePhoneNumberPrompt");

            var passwordView = $("#password");
            var passwordPrompt = $("#passwordPrompt");

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

            $("#loginBtn").click(function () {
                mobilePhoneNumber = mobilePhoneNumberView.val();
                password = passwordView.val();

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

                promptView.text("登录信息校验中...");

                $.ajax("${pageContext.request.contextPath}/api/users/login",
                    {
                        dataType: "json",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify(
                            {
                                mobilePhoneNumber: mobilePhoneNumberView.val(),
                                password: passwordView.val()
                            }
                        ),
                        async: true,
                        success: function (data) {
                            if (200 === data.statusCode) {
                                promptView.text("登录成功");
                                window.location.href = "${pageContext.request.contextPath}/mvc/trainList";
                            } else if (7001 === data.statusCode) {
                                promptView.text("用户未注册");
                            } else if (7003 === data.statusCode) {
                                promptView.text("用户已禁用");
                            } else if (7004 === data.statusCode) {
                                promptView.text("登录密码错误");
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
            <div class="form1">
                <p class="p-input pos">
                    <label for="mobilePhoneNumber">手机号</label>
                    <input type="text" id="mobilePhoneNumber">
                    <span class="tel-warn num-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                </p>
                <p class="p-input pos">
                    <label for="password">密码</label>
                    <input type="password" id="password" autocomplete="new-password">
                    <span class="tel-warn pass-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                </p>
            </div>
            <div class="r-forget cl">
                <a href="${pageContext.request.contextPath}/mvc/register" class="z">账号注册</a>
                <a href="#" class="y">忘记密码</a>
            </div>
            <div class="reg_checkboxline pos"><p id="prompt" class="tips"></p></div>
            <button id="loginBtn" type="button" class="lang-btn off log-btn">登录</button>
            <div class="third-party">
                <a href="#" class="log-qq icon-qq-round"></a>
                <a href="#" class="log-qq icon-weixin"></a>
                <a href="#" class="log-qq icon-sina1"></a>
            </div>
            <p class="right">Powered by © 2018</p>
        </div>
    </div>
</div>
</body>
</html>