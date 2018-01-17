<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="team.rngu.shop.bean.Goods" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<%
	List<String> list = new ArrayList<String>();
	list.add("蛇皮");
	list.add("发生");
	list.add("方法对付");
	list.add("法计算的");
	list.add("热情我");
	list.add("人权为荣");
%>
<c:set var="limit" value="<%=10 %>"></c:set>
<c:set var="goods" value="<%=list %>"></c:set>
<body>
	<c:out value="-----"></c:out>
	
	<!-- 
	<c:forEach var="tmp" items="${goods }">
	<ul>
		<li>
			<p>${tmp }</p>
		</li>
	</ul>
	</c:forEach>
	 -->
	 
	 <c:forEach var="tmp" begin="1" end="${limit }">
	 	<c:out value="${tmp }"></c:out>
	 </c:forEach>
	 
</body>
</html>