<%@page import="com.jaovo.msg.model.User"%>
<%@page import="com.jaovo.msg.Util.DaoFactory"%>
<%@page import="com.jaovo.msg.dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//获取list.jsp传递过来的参数
	int id = Integer.parseInt(request.getParameter("id"));
	//根据这个id将需要更改的user对象查询出来
	IUserDao userDao = DaoFactory.getDaoImpl();
	User user = userDao.load(id);
	
	if(user.getType() == 0){
		user.setType(1);
	}else{
		user.setType(0);
	}
	//再调用dao中的Update方法将数据更新到数据库
	userDao.update(user);
	
	response.sendRedirect("list.jsp");
%>