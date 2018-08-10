<%@page import="com.jaovo.msg.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改额度</title>
</head>

<style>
	 a:link {color: blue}          
     a:visited {color: blue}          
     a:hover {color: red}            
     a:active {color: red}   
</style>
<%
	User user=(User)session.getAttribute("loginUser");
%>

<body>
<br>
<br>
<br>
<div align="center">
<%=user.getNickname() %>,您已成功修改每月的初始额度为：<font color="red"><%=user.getAmount() %></font>
<br>
<br>
<br>
<br>
<br>
<a href="Welcome.jsp">点击这里回到主菜单</a>
</div>

</body>
</html>