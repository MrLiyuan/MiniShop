<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="team.rngu.shop.bean.Buyer" %>
<%
	Buyer buyer = (Buyer) session.getAttribute("buyer");
%>
<c:set var="id" value="<%=buyer.getId() %>"></c:set>
<c:set var="user" value="<%=buyer %>"></c:set>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>修改密码</title>

		<link href="css/admin.css" rel="stylesheet" type="text/css">
		<link href="css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="js/jquery-1.7.2.min.js"></script>
		<script src="js/amazeui.js"></script>

	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<c:choose>
									<c:when test="${empty user }">
									<a href="BuyerLoginPage.jsp" target="_top" class="h ly-chcol">亲，请登录</a>
									<a href="BuyerRegisterPage.jsp" target="_top" class="ly-chcol">免费注册</a>
									</c:when>
									<c:otherwise>
										欢迎你，<c:out value="${user.name }"></c:out>
									</c:otherwise>
								</c:choose>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="img/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form action="GoodsListServlet" method="get">
									<input name="page" style="display:none" value="1"></input>
									<input id="searchInput" name="search-context" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<form action="PersonChangePwdServlet" method="post" class="am-form am-form-horizontal">
						<input type="text" value="${id }" name="id" style="display:none" />
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="password" name="pwd" id="user-old-password" placeholder="请输入原登录密码">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password"  class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" name="pwd1" id="user-new-password" placeholder="由数字、字母组合">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" name="pwd2" id="user-confirm-password" placeholder="请再次输入上面的密码" />
							</div>
						</div>
						<div class="info-btn">
							<button type="submit" class="am-btn am-btn-danger">保存修改</button>
						</div>

					</form>

				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-bd">
						<p>
							<a href="#">联系我们</a>
							<em>2018-2025版权所有</em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="PersonServlet?id=<c:out value="${user.id }"></c:out>">个人信息</a></li>
							<li> <a href="PersonPasswordPage.jsp">修改密码</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="PersonIndentServlet?id=${id }">订单管理</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>