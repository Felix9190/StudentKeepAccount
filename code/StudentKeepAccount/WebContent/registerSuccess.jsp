<%@page import="com.jaovo.msg.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>用户注册</title>
</head>

<style>
	 a:link {color: blue}          
     a:visited {color: blue}          
     a:hover {color: red}            
     a:active {color: red}   
</style>
<%
	User user=(User)request.getAttribute("user");
%>

<body>
<br>
<br>
<br>
<div align="center">
<%=user.getNickname() %>,恭喜您已注册成功！
<br>
<br>
请牢记您的用户名及密码：
<br>
用户名：<font color="red"><%=user.getUsername() %></font>
<br>
密码：<font color="red"><%=user.getPassword() %></font>
<br>
<br>
<br>
<a href="LoginInput.jsp">点击这里登录您的账户</a>
</div>

</body>


</html>