<%@page import="com.jaovo.msg.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改密码</title>
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
<%=user.getNickname() %>,您已成功修改密码！
<br>
<br>
请牢记您新密码：
<font color="red"><%=user.getPassword() %></font>
<br>
<br>
<br>
<a href="Logout.jsp">点击这里登录您的账户</a>
</div>

</body>
</html>