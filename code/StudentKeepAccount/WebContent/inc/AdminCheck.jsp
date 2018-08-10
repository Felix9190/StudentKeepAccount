<%@page import="com.jaovo.msg.Util.UserException"%>
<%@page import="com.jaovo.msg.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//验证当前登录的用户的类型
	User loginUser = (User)session.getAttribute("loginUser");
	int id = Integer.parseInt(request.getParameter("id"));
	if(loginUser.getId() != id){
		if(loginUser.getType() == 0){
			throw new  UserException("没有操作权限");
		}
	}
%>