<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="css/amazeui.min.css" />
		<link href="css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="js/jquery.min.js"></script>
		<script src="js/amazeui.min.js"></script>

	</head>

	<body>
		<div class="login-boxtitle">
			<a href="home/demo.html"><img alt="" src="img/logobig.png" /></a>
		</div>
		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="img/big.jpg" /></div>
				<div class="login-box">
					
						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active"><a href="">邮箱注册</a></li>
								<li><a href="">手机号注册</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<form action="RegisterServlet" method="post">
										<input type="text" name="state" value="email" style="display:none">					
								     <div class="user-email">
										<label for="email"><i class="am-icon-envelope-o"></i></label>
										<input type="email" name="email" id="email" placeholder="请输入邮箱账号">
					                 </div>										
					                 <div class="user-pass">
									    <label for="password"><i class="am-icon-lock"></i></label>
									    <input type="password" name="pwd1" id="password" placeholder="设置密码">
					                 </div>										
					                 <div class="user-pass">
									    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									    <input type="password" name="pwd2" id="passwordRepeat" placeholder="确认密码">
					                 </div>	
					                 <!-- 修改时js检测表单 -->
					                 <br/><br/>
					                 <input id="reader-me" name="che" type="checkbox" style="width:15px; height:15px; margin-top:5px;"> 点击表示您同意商城《服务协议》
					                 <div class="am-cf">
										<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
									 </div>
					                </form>
								</div>

								<div class="am-tab-panel">
									<form action="RegisterServlet" method="post">
										<input type="text" name="state" value="phone" style="display:none">	
					                 <div class="user-phone">
									    <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
									    <input type="tel" name="phone" id="phone" placeholder="请输入手机号">
					                 </div>																			
									<div class="verification">
										<label for="phone"><i class="am-icon-lock"></i></label>
										<input type="tel" name="name" id="phone" placeholder="请输入昵称">
											</a>
									</div>
					                 <div class="user-pass">
									    <label for="password"><i class="am-icon-lock"></i></label>
									    <input type="password" name="pwd1" id="password" placeholder="设置密码">
					                 </div>										
					                 <div class="user-pass">
									    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									    <input type="password" name="pwd2" id="passwordRepeat" placeholder="确认密码">
					                 </div>
					                 <br/>
					                 <!-- 修改时js检测表单 -->
					                 <input id="reader-me" name="che" type="checkbox" style="width:15px; height:15px; margin-top:5px;"> 点击表示您同意商城《服务协议》	
					                 <div class="am-cf">
											<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>
									</form>
									<hr>
								</div>
								<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  })
								</script>

							</div>
						</div>
				</div>
			</div>
			
		<div class="footer ">
			<div class="footer-hd ">
				<p>
					<a href="# ">联系客服</a>
					<b>|</b>
					<a href="# ">商城首页</a>
					<b>|</b>
					<a href="# ">支付宝</a>
					<b>|</b>
					<a href="# ">物流</a>
				</p>
			</div>
		</div>
	</body>
</html>