<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="team.rngu.shop.bean.Indent" %>
<%@ page import="team.rngu.shop.entity.Page" %>
<%
	List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("backindentlist");
	HashMap<String, Object> map = (HashMap<String,Object>) list.get(list.size()-1);
	Page pag = (Page)map.get("page");
%>
<c:set var="list" value="<%=list %>"></c:set>
<c:set var="page" value="<%=pag %>"></c:set>
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
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
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
		 <script type="text/javascript">
           	function del(id){
           		var flag = confirm("确认删除吗");
           		if( flag ){
           			var data = "{\"id\":\""+id+"\"}";
           			
           			$.ajax({
           				type:"post",
           				url:"http://localhost:8080/minishop/delindent.action",
           				async:true,
           				data:data,
           				dataType:"json",
           				complete:function(data){
           					var info = JSON.parse(data["responseText"]);
           					if( info["state"]=="success" ){
           						alert("删除成功");
           					}else{
           						alert("删除失败");
           					}
           				},
           			})
           			window.location.reload();
           		}
           	}
          </script>
</div>

<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on"> 订单列表</ul>
      <!--这里打开的是新页面-->
    </div>

    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <th class="table-id">ID</th>
                <th class="table-title">商品名称</th>
                <th class="table-type">购买数量</th>
                <th class="table-author am-hide-sm-only">购买人</th>
                <th class="table-date am-hide-sm-only">购买日期</th>
                <th width="130px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="tmp" items="${list }">
              <tr>
                <td>${tmp.indent.id }</td>
                <td><a href="#">${tmp.goods.name }</a></td>
                <td>${tmp.indent.goodsNum }</td>
                <td class="am-hide-sm-only">${tmp.buyer.name }</td>
                <td class="am-hide-sm-only">${tmp.indent.createTime }</td>
                <td>
                	<div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                      <a href="ShowIndentServlet?id=${tmp.indent.id }" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改订单"><span class="am-icon-pencil-square-o"></span></a>
                      <button type="button" onclick="del(${tmp.indent.id})" class="shepi am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除订单"><span class="am-icon-trash-o" ></span></button>
                      <a href="OutGoodsServlet?id=${tmp.indent.id }" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="发货"><span class="am-icon-check"></span></a>
                    </div>
                  </div>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          
          <ul class="am-pagination am-fr">
          <c:choose>
				<c:when test="${page.pageNum==1 }">
					<li class="am-disabled"><a href="#">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="BackIndentListServlet?type=<c:out value="${page.searchLimit }"></c:out>&page=<c:out value="${page.pageNum-1 }"></c:out>">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="1" end="${page.totalPage }">
				<c:choose>
					<c:when test="${page.pageNum==i}">
						<li class="am-active"><a href="BackIndentListServlet?type=<c:out value="${page.searchLimit }"></c:out>&page=<c:out value="${i }"></c:out>"><c:out value="${i }"></c:out></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="BackIndentListServlet?type=<c:out value="${page.searchLimit }"></c:out>&page=<c:out value="${i }"></c:out>"><c:out value="${i }"></c:out></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${page.pageNum==page.totalPage }">
					<li class="am-disabled"><a href="#">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="BackIndentListServlet?type=<c:out value="${page.searchLimit }"></c:out>&page=<c:out value="${page.pageNum+1 }"></c:out>">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
          </ul>
      
          <hr />
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