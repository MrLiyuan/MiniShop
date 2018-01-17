<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="team.rngu.shop.bean.Goods" %>
<%@ page import="team.rngu.shop.bean.Buyer" %>
<%@ page import="team.rngu.shop.entity.Page" %>
<%
	Buyer buyer = (Buyer) session.getAttribute("userinfo");
	Page<Goods> con = (Page<Goods>)request.getAttribute("goodslist");
	List<Goods> list = con.getPageList();
%> 
<c:set var="user" value="<%=buyer %>"></c:set>
<c:set var="page" value="<%=con %>"></c:set>
<c:set var="list" value="<%=list %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品列表</title>

		<link href="css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="css/admin.css" rel="stylesheet" type="text/css" />

		<link href="css/demo.css" rel="stylesheet" type="text/css" />

		<link href="css/seastyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
	</head>

	<body>

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
					<div class="menu-hd MyShangcheng"><a href="PersonServlet?id=<c:out value="${user.id }"></c:out>" class="ly-chcol"><i class="fa fa-user"></i>&nbsp;<span>个人中心</span></a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
				</div>
			</ul>
			</div>

			<div class="nav white">
				<div class="logo"><img src="img/logo.png" /></div>
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
			<b class="line"></b>
           <div class="search">
			<div class="search-list">
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">商品列表</span></div>
			</div>
				
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
							<div class="search-content">

								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
									<c:forEach var="ani" items="${list }">
									<li>
									<a href="intro.action?id=<c:out value="${ani.id }"></c:out>">
										<div class="i-pic limit">
											<img src="img/${ani.imgs }" />											
											<p class="title fl"><c:out value="${ani.introduce }"></c:out></p>
											<p class="price fl">
												<b>¥</b>
												<strong><c:out value="${ani.price }"></c:out></strong>
											</p>
											<p class="number fl">
												<span>销量</span><c:out value="${ani.sales}"></c:out>
											</p>
										</div>
									</a>	
									</li>
									</c:forEach>
								</ul>
							</div>
							<div class="search-side">

								<li>
									<div class="i-pic check">
										<img src="img/cp.jpg" />
										<p class="check-title">吃鸡吃鸡</p>
										<p class="price fl">
											<b>¥</b>
											<strong>29.90</strong>
										</p>
										<p class="number fl">
											库存<span>1110</span>
										</p>
									</div>
								</li>
								
							</div>
							<div class="clear"></div>
							<ul class="am-pagination am-pagination-right">
								<c:choose>
									<c:when test="${page.pageNum==1 }">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="GoodsListServlet?search-context=<c:out value="${page.searchLimit }"></c:out>&page=<c:out value="${page.pageNum-1 }"></c:out>">&laquo;</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="i" begin="1" end="${page.totalPage }">
									<c:choose>
										<c:when test="${page.pageNum==i}">
											<li class="am-active"><a href="GoodsListServlet?search-context=<c:out value="${page.searchLimit }"></c:out>&page=<c:out value="${i }"></c:out>"><c:out value="${i }"></c:out></a></li>
										</c:when>
										<c:otherwise>
											<li><a href="GoodsListServlet?search-context=<c:out value="${page.searchLimit }"></c:out>&page=<c:out value="${i }"></c:out>"><c:out value="${i }"></c:out></a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${page.pageNum==page.totalPage }">
										<li class="am-disabled"><a href="#">&raquo;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="GoodsListServlet?search-context=<c:out value="${page.searchLimit }"></c:out>&page=<c:out value="${page.pageNum+1 }"></c:out>">&raquo;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
					<div class="footer">
						<div class="footer-hd">					
						</div>
						<div class="footer-bd">
							<p>
								<a href="#">team.rngu</a>
								<em class=centerr>©2018-2025</em>
							</p>
						</div>
					</div>
				</div>

			</div>

		<div class=tip>
			<div id="sidebar">
				<div id="sidebar">
				<div id="wrap">
					<div id="shopCart " class="item">
						<a href="# ">
							<span class="message"></span>
						</a>
						<p>
						购物车
						</p>
						<p class="cart_num ">0</p>
					</div>

					<div class="quick_toggle ">
						<li class="qtitem">
							<a href="#top" class="return_top"><span class="top"><i class="fa fa-level-up fa-2x" style="color: #CCCCCC;"></i></span></a>
						</li>
					</div>

					<!--åå°é¡¶é¨ -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>

				</div>
			</div>
		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

	</body>

</html>