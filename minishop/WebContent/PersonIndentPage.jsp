<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="team.rngu.shop.bean.Buyer" %>
<%@ page import="team.rngu.shop.bean.Indent" %>
<%@ page import="team.rngu.shop.bean.Goods" %>
<%
	Buyer buyer = (Buyer) session.getAttribute("buyer");
	List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("buyerindentlist");
%>
<c:set var="list" value="<%=list %>"></c:set>
<c:set var="user" value="<%=buyer %>"></c:set>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="css/admin.css" rel="stylesheet" type="text/css">
		<link href="css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/bilstyle.css" rel="stylesheet" type="text/css">

		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/amazeui.js" type="text/javascript"></script>

	</head>

	<body>
		<header>
			<article>
				<div class="mt-logo">
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账单明细</strong> / <small>Electronic&nbsp;bill</small></div>
					</div>
					<hr>

					<table width="100%">

						<thead>
							<tr>
								<th class="memo"></th>
								<th class="time">创建时间</th>
								<th class="name">名称</th>
								<th class="amount">金额</th>
								<th class="action">发货情况</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="tmp" items="${list }">
							<tr>
								<td class="img">
									<i><img src="img/${tmp.goods.imgs }"></i>
								</td>
								<td class="time">
									<p> ${tmp.indent.createTime }</p>
								</td>
								<td class="title name">
									<p class="content">
										${tmp.goods.introduce }
									</p>
								</td>

								<td class="amount">
									<span class="amount-pay">${tmp.indent.totalPrice }</span>
								</td>
								<td class="operation">
									<c:choose>
										<c:when test="${tmp.indent.isout==0 }"><c:out value="未发货"></c:out></c:when>
										<c:otherwise><c:out value="已发货"></c:out></c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				
					<script type="text/javascript">
						$(document).ready(function() {
							$(".date-trigger").click(function() {
								$(".show-input").css("display", "none");
							});
							
						 })
					</script>					
					
				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-bd">
						<p>
							<a href="#">联系我们</a>
							<em>2017-2025 </em>
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
							<li><a href="#">订单管理</a></li>
						</ul>
					</li>
				</ul>
			</aside>
		</div>

	</body>

</html>