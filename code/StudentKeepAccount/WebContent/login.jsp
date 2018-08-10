<%@page import="com.jaovo.msg.Util.UserException"%>
<%@page import="com.jaovo.msg.model.User"%>
<%@page import="com.jaovo.msg.Util.DaoFactory"%>
<%@page import="com.jaovo.msg.dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//获取客户端传递过来的参数
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	try
	{
	IUserDao userDao = DaoFactory.getDaoImpl();
	User user = userDao.load(username,password);
	session.setAttribute("loginUser", user);
	if(user.getStatus()==0)
	{
		if(user.getType()==1)
		{
			response.sendRedirect(request.getContextPath()+"/user/list.jsp");
		}
		else
		{
			response.sendRedirect("Welcome.jsp");
		}
	}
	else
	{
		throw new UserException("！你已被禁用登录");
	}
	}
	catch(UserException e)
	{
		//验证出错
		request.setAttribute("loginError", e.getMessage());
%>
	<jsp:forward page="LoginInput.jsp"></jsp:forward>
<%
    //<jsp:forward page="LoginInput.jsp"></jsp:forward>这种方式跳转不能改变浏览器地址，刷新的话会导致重复提交！！！
	}
%>