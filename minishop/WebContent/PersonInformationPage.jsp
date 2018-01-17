<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="team.rngu.shop.bean.Buyer" %>
<%
	Buyer buyer = (Buyer) session.getAttribute("buyer");
%>
<c:set var="buyer" value="<%=buyer %>"></c:set>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人中心</title>

		<link href="css/admin.css" rel="stylesheet" type="text/css">
		<link href="css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="js/jquery.min.js"></script>
		<script src="js/amazeui.js"></script>			
	</head>

	<body>
		<!--å¤´ -->
		<header>
			<article>
				<div class="mt-logo">
					<!--é¡¶é¨å¯¼èªæ¡ -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									欢迎你，<c:out value="${buyer.name }"></c:out>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
						</ul>
						</div>

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
			  <div class="long-title"><span class="all-goods">个人中心</span></div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<div class="info-main">
							<form action="PersonChangeServlet" method="post" class="am-form am-form-horizontal">
								<input type="text" name="buyerid" style="display:none" value="${buyer.id }" />
								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" name="buyername" id="user-name2" placeholder="nickname" value="<c:out value="${buyer.name }"></c:out>">
                                        <small>昵称长度不能超过16个汉字</small>
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="male" <c:if test="${buyer.sex==1 }"><c:out value="checked='checked'"></c:out></c:if> />男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="female" <c:if test="${buyer.sex==0 }"><c:out value="checked='checked'"></c:out></c:if> />女
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="secret" <c:if test="${buyer.sex==2 }"><c:out value="checked='checked'"></c:out></c:if> />保密
										</label>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" name="buyerphone" placeholder="telephonenumber" type="tel" value="${buyer.phone }">
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">邮箱</label>
									<div class="am-form-content">
										<input id="user-email" name="buyeremail" placeholder="Email" type="email" value="${buyer.email }">
									</div>
								</div>
								
								<div class="info-btn">
									<button type="submit" class="am-btn am-btn-danger">保存修改</button>
								</div>

							</form>
						</div>

					</div>

				</div>
				<!--åºé¨-->
				<div class="footer">
					<div class="footer-bd">
						<p>
							<a href="#">team:rngu</a>
							<em>2017-2025 info</em>
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
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="#">个人信息</a></li>
							<li> <a href="PersonPasswordPage.jsp">修改密码</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="PersonIndentServlet?id=${buyer.id }">订单管理</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>