<%@page import="com.jaovo.msg.model.User"%>
<%@page import="com.jaovo.msg.Util.DaoFactory"%>
<%@page import="com.jaovo.msg.dao.IUserDao"%>
<%@page import="com.jaovo.msg.Util.ValidateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<%
	//获取客户端传递过来的参数
	int id = Integer.parseInt(request.getParameter("id"));
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	boolean validate = ValidateUtil.validateNull(request, new String[]

{"password","nickname"});
	if(!validate){
%>	
	<jsp:forward page="updateInput.jsp"></jsp:forward>	
<%
	}
	IUserDao userDao = DaoFactory.getDaoImpl();
	User user = userDao.load(id);
	
	user.setPassword(password);
	user.setNickname(nickname);
	
	userDao.update(user);
	
	response.sendRedirect("list.jsp");
%>