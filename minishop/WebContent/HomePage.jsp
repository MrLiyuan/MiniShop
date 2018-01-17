<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<%@ page import="team.rngu.shop.bean.Buyer" %>
<%@ page import="team.rngu.shop.bean.GoodsClass" %>
<%
	Buyer buyer = (Buyer) session.getAttribute("userinfo");
	List<GoodsClass> list = (List<GoodsClass>)request.getAttribute("homelist");
%>
<c:set var="user" value="<%=buyer %>"></c:set>
<c:set var="list" value="<%=list %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>首页</title>
	<!-- 源代码引入 -->
	<link href="css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="css/admin.css" rel="stylesheet" type="text/css" />

	<link href="css/demo.css" rel="stylesheet" type="text/css" />

	<link href="css/hmstyle.css" rel="stylesheet" type="text/css"/>
	<link href="css/skin.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<!-- 修改引入 -->
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="css/HomePage.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header ly-bor">
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
					<div class="menu-hd"><a href="#" target="_top" class="h ly-chcol">商城首页</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng"><a href="PersonServlet?id=<c:out value="${user.id }"></c:out>" class="ly-chcol"><i class="fa fa-user"></i>&nbsp;<span>个人中心</span></a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top" class="ly-chcol"><i class="fa fa-shopping-cart"></i>&nbsp;<span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd"><a href="#" target="_top" class="ly-chcol"><i class="fa fa-heart"></i>&nbsp;<span>收藏夹</span></a></div>
			</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
				<div class="logo"><img src="img/logo.png" /></div>
				<div class="logoBig">
					<li><img src="img/logo.png" /></li>
				</div>

				<div class="search-bar pr">
					<a name="index_none_header_sysc" href="#"></a>
					<form action="GoodsListServlet" method="get">
						<input name="page" style="display:none" value="1"></input>
						<input id="searchInput" name="search-context" type="text" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>
		</div>
		<div class="banner">
              <!--轮播 -->
				<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
					<ul class="am-slides">
						<li class="banner1"><a href="introduction.html"><img src="img/ad1.jpg" /></a></li>
						<li class="banner2"><a><img src="img/ad2.jpg" /></a></li>
						<li class="banner3"><a><img src="img/ad3.jpg" /></a></li>
						<li class="banner4"><a><img src="img/ad4.jpg" /></a></li>
					</ul>
				</div>
				<div class="clear"></div>	
		</div>
		<div class="shopNav">
			<div class="slideall">
				
			   <div class="long-title"><span class="all-goods">全部分类</span></div>
			   <div class="nav-cont">
					<ul>
					<c:forEach var="tc" items="${list }">
						<li class="index"><a href="#">${tc.name }</a></li>
					</c:forEach>
					</ul>
				</div>
				<!--轮播-->
				
				<script type="text/javascript">
					(function() {
						$('.am-slider').flexslider();
					});
					$(document).ready(function() {
						$("li").hover(function() {
							$(".category-content .category-list li.first .menu-in").css("display", "none");
							$(".category-content .category-list li.first").removeClass("hover");
							$(this).addClass("hover");
							$(this).children("div.menu-in").css("display", "block")
						}, function() {
							$(this).removeClass("hover")
							$(this).children("div.menu-in").css("display", "none")
						});
					})
				</script>

			<script type="text/javascript">
				if ($(window).width() < 640) {
					function autoScroll(obj) {
						$(obj).find("ul").animate({
							marginTop: "-39px"
						}, 500, function() {
							$(this).css({
								marginTop: "0px"
							}).find("li:first").appendTo(this);
						})
					}
					$(function() {
						setInterval('autoScroll(".demo")', 3000);
					})
				}
			</script>
		</div>
		<div class="shopMainbg">
			<div class="shopMain" id="shopmain">
			<c:forEach var="tmp" items="${list }">
			<c:set var="tlist" value="${tmp.list }"></c:set>
                <div id="f${tmp.id }">
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${tmp.name }</h4>
							<h3>${tmp.pro }</h3>
						</div>
					</div>
					<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<img src="img/${tmp.img }" />									
						</div>
						<div class="triangle-topright"></div>						
					</div>
						<c:forEach var="tt" items="${tlist }" varStatus="i">
						<c:choose>
							<c:when test="${i.index==0 }">
							<div class="am-u-sm-7 am-u-md-4 text-two sug">
								<div class="outer-con ">
									<div class="title ">
										${tt.name }
									</div>									
									<div class="sub-title ">
										¥ ${tt.price }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="intro.action?id=${tt.id }"><img src="img/${tt.imgs }" /></a>
							</div>
							</c:when>
							<c:when test="${i.index==1 }">
							<div class="am-u-sm-7 am-u-md-4 text-two">
							<div class="outer-con ">
									<div class="title ">
										${tt.name }
									</div>									
									<div class="sub-title ">
										¥ ${tt.price }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="intro.action?id=${tt.id }"><img src="img/${tt.imgs }" /></a>
							</div>
							</c:when>
							<c:when test="${i.index==2 }">
							<div class="am-u-sm-3 am-u-md-2 text-three big">
							<div class="outer-con ">
									<div class="title ">
										${tt.name }
									</div>									
									<div class="sub-title ">
										¥ ${tt.price }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="intro.action?id=${tt.id }"><img src="img/${tt.imgs }" /></a>
							</div>
							</c:when>
							<c:when test="${i.index==3 }">
							<div class="am-u-sm-3 am-u-md-2 text-three sug">
							<div class="outer-con ">
									<div class="title ">
										${tt.name }
									</div>									
									<div class="sub-title ">
										¥ ${tt.price }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="intro.action?id=${tt.id }"><img src="img/${tt.imgs }" /></a>
							</div>
							</c:when>
							<c:when test="${i.index==4 }">
							<div class="am-u-sm-3 am-u-md-2 text-three ">
							<div class="outer-con ">
									<div class="title ">
										${tt.name }
									</div>									
									<div class="sub-title ">
										¥ ${tt.price }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="intro.action?id=${tt.id }"><img src="img/${tt.imgs }" /></a>
							</div>
							</c:when>
							<c:when test="${i.index==5 }">
							<div class="am-u-sm-3 am-u-md-2 text-three last big ">
							<div class="outer-con ">
									<div class="title ">
										${tt.name }
									</div>									
									<div class="sub-title ">
										¥ ${tt.price }
									</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<a href="intro.action?id=${tt.id }"><img src="img/${tt.imgs }" /></a>
							</div>
							</c:when>
						</c:choose>
						</c:forEach>
					</div>
                 <div class="clear "></div>  
                 </div>
   			</c:forEach>
					<div class="footer ">
						<div class="footer-bd ">
							<p>
								<a href="# ">关于恒望</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
							</p>
						</div>
					</div>

		</div>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li class="active"><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>


		<!--菜单 -->
		
		<div class="tip">
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

					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>

				</div>
			</div>
			
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="../basic/js/quick_links.js "></script>
	</body>

</html>