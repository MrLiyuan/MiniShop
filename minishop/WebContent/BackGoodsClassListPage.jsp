<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="team.rngu.shop.bean.Goods" %>
<%@ page import="team.rngu.shop.entity.Page" %>
<%@ page import="team.rngu.shop.bean.GoodsClass" %>
<%
	List<GoodsClass> list = (List<GoodsClass>) request.getAttribute("classlist");
%>
<c:set var="list" value="<%=list %>"></c:set>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Amaze UI Admin index Examples</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/amazeui.min.css"/>
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.min.js"></script>
<script src="js/app.js"></script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->

</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="img/logo.png"></div>
  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

  </div>
</header>

<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    <div class="sideMenu">
      	<h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
      <ul>
        <li><a href="BackGoodsListServlet?page=1">商品列表</a></li>
        <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="BackAddNewGoodsPage.jsp">添加新商品></a></li>
      </ul>
      <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
      <ul>
        <li><a href="BackIndentListServlet?type=0&page=1">订单列表</a></li>
        <li><a href="BackIndentListServlet?type=1&page=1">发货单列表</a></li>
      </ul>
      <h3 class="am-icon-volume-up"><a href="#">用户管理</a></h3>
      <ul>
        <li><a href="BackUserListServlet?page=1">用户列表 </a></li>
        <li><a href="BackAddSeller.jsp">添加管理员</a></li>
      </ul>
      <h3 class="am-icon-volume-up"><em></em> <a href="#">商品分类管理</a></h3>
      <ul>
        <li><a href="BackClassServlet">商品分类</a></li>
      </ul>
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
			});
		</script>
</div>
<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on"> 栏目名称</ul>
    </div>
	
	<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead>
              <tr class="am-success">
                <th class="table-id">编号</th>
                <th class="table-title">类名称</th>
                <th class="table-title">类介绍</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="tmp" items="${list }">
              <tr>
                <td>${tmp.id }</td>
                <td>${tmp.name }</td>
                <td><a href="#">${tmp.pro }</a></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          
        </form>
 
 <div class="foods">
  <ul>
    版权所有@2015. 模板收集自 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> -  More Templates<a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
  </ul>
  <dl>
    <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
  </dl>
</div>

</div>

</div>

</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->

</body>
</html>