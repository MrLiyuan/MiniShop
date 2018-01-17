<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String username = "";
	String password = "";
	Cookie[] cookies = request.getCookies();
	for( Cookie cookie : cookies ){
		if( cookie.getName().equals("username") ){
			username = cookie.getValue();
		}
		if( cookie.getName().equals("userpwd") ){
			password = cookie.getValue();
		}
	}
%>
<c:set var="username" value="<%=username %>"></c:set>
<c:set var="password" value="<%=password %>"></c:set>
<!DOCTYPE html>
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>登录</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="css/amazeui.css" />
		<link href="css/dlstyle.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<div class="login-boxtitle">
			<a href="home.html"><img alt="logo" src="img/logobig.png" /></a>
		</div>

		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="img/big.jpg" /></div>
				<div class="login-box">
						<a href="AdminLoginPage.jsp" class="am-btn-default" style="padding:3px">卖家登录 ></a><br/>
						<h3 class="title">登录商城</h3>
						<div class="clear"></div>
						<div class="login-form">
						  <form action="login.action" method="post">
						  	<input type="text" name="state" value="1" style="display:none" >
						   <div class="user-name">
							    <label for="user"><i class="am-icon-user"></i></label>
							    <input type="text" name="username" id="user" placeholder="邮箱/手机/用户名" value="<c:out value="${username }"></c:out>">
			                 </div>
			                 <div class="user-pass">
							    <label for="password"><i class="am-icon-lock"></i></label>
							    <input type="password" name="userpwd" id="password" placeholder="请输入密码" value="<c:out value="${password }"></c:out>">
			                 </div>
			                 <div class="am-cf">
								<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
							</div>
							<input id="remember-me" name="remember" type="checkbox" style="float:left; width:15px; height:15px; margin-top:5px">记住密码
							<a href="#" class="am-fr">忘记密码</a>
			              </form>
			           </div>
            
		            <div class="login-links">
						<a href="BuyerRegisterPage.jsp" class="zcnext am-fr am-btn-default">注册</a>
						<br/>
		            </div>
			
				<div class="partner">		
					<h3>合作账号</h3>
					<div class="am-btn-group">
						<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
					</div>
				</div>	

			</div>
			</div>
		</div>
	</body>
</html>