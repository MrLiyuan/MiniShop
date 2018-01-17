<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="team.rngu.shop.bean.Goods" %>
<%@ page import="team.rngu.shop.bean.Buyer" %>
<%
	Buyer buyer = (Buyer) session.getAttribute("userinfo");
	Goods goods = (Goods)request.getAttribute("goods");
%>
<c:set var="goods" value="<%=goods %>"></c:set>
<c:set var="user" value="<%=buyer %>"></c:set>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品详情</title>

		<link href="css/admin.css" rel="stylesheet" type="text/css" />
		<link href="css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="js/quick_links.js"></script>

		<script type="text/javascript" src="js/amazeui.js"></script>
		<script type="text/javascript" src="js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="js/list.js"></script>
		
		<script type="text/javascript" src="js/GoodsintroductionPage.js"></script>
	</head>

	<body>
		<!--é¡¶é¨å¯¼èªæ¡ -->
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
				<div class="topMessage favorite">
					<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
			</ul>
			</div>

			<!--æ¬æµ®æç´¢æ¡-->

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
						<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>
            <b class="line"></b>
			<div class="listMain">

			<div class="nav-table">
				<div class="long-title"><span class="all-goods">商品详情</span></div>
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><c:out value="${goods.clas }"></c:out>>></li>
				</ol>
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="img/<c:out value="${goods.imgs }"></c:out>" title="pic" />
								</li>
							</ul>
						</div>
					</section>
				</div>

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
								<a href="img/<c:out value="${goods.imgs }"></c:out>"><img src="img/<c:out value="${goods.imgs }"></c:out>" alt="ç»èå±ç¤ºæ¾å¤§éç¹æ" rel="img/<c:out value="${goods.imgs }"></c:out>" class="jqzoom" /></a>
							</div>
							<ul class="tb-thumb" id="thumblist">
								<li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="img/<c:out value="${goods.imgs }"></c:out>" mid="img/<c:out value="${goods.imgs }"></c:out>" big="img/<c:out value="${goods.imgs }"></c:out>"></a>
									</div>
								</li>
							</ul>
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">

						<div class="tb-detail-hd">
							<h1>
							<br/>	
							<c:out value="${goods.introduce }"></c:out>
	          				</h1>
						</div>
						<div class="tb-detail-list">
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									<dt>价格</dt>
									<dd><em>¥</em><b class="sys_item_price"><c:out value="${goods.price }"></c:out></b>  </dd>                                 
								</li>
								<div class="clear"></div>
							</div>

							<dl class="iteminfo_parameter freight">
								<dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：<c:out value="${goods.address }"></c:out></dt>
								<div class="iteminfo_freprice">
									
									<div class="pay-logis">
										运送费<b class="sys_item_freprice">10</b>元
									</div>
								</div>
							</dl>
							<div class="clear"></div>

							<!--éé-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon"><span class="tm-label">库存量</span><span class="tm-count">${goods.surplus }</span></div>
								</li>
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">销量</span><span class="tm-count"><c:out value="${goods.sales }"></c:out></span></div>
								</li>
							</ul>
							<div class="clear"></div>

							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">what<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="" method="post">

												<div class="theme-signin-left">
													
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input id="gid" value="<c:out value="${goods.id }"></c:out>" style="display:none"/>
															<input id="text_box" name="goodsnum" type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<span id="Stock" class="tb-hidden">库存<span class="stock">${goods.surplus }</span>件</span>
														</dd>

													</div>
													<div class="clear"></div>
												</div>
											</form>
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
						</div>

						<div class="pay">
							
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<input type="text" id="sub-userid" value="${user.id }" style="display:none" />
									<a id="LikBuy">立即购买</a>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket">加入购物车</a>
								</div>
							</li>
						</div>

					</div>

					<div class="clear"></div>

				</div>

				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2>看了又看</h2>        
					            </div>
						     	
							      <li class="first">
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="img/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		关于商品的介绍
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>35.90</strong></div>
							      </li>
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#">
										<span class="index-needs-dt-txt">商品详情</span></a>
								</li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active">
									<div class="details">
										<div class="twlistNews">
											<img src="img/tw1.jpg" />
											<img src="img/tw2.jpg" />
											<img src="img/tw3.jpg" />
											<img src="img/tw4.jpg" />
											<img src="img/tw5.jpg" />
											<img src="img/tw6.jpg" />
											<img src="img/tw7.jpg" />
										</div>
									</div>
									<div class="clear"></div>

								</div>
							</div>

						</div>

						<div class="clear"></div>
					</div>

				</div>
			</div>
			
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
					<div id="quick_links_pop " class="quick_links_pop hide "></div>
				</div>
			</div>
			</div>
	</body>

</html>