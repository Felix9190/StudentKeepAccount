<%@page import="com.jaovo.msg.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>添加消费记录</title>
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
添加消费记录成功！
<br>
<br>
<br>
<br>
<br>
<a href="Welcome.jsp">点击这里返回主菜单</a>
</div>

</body>
</html>