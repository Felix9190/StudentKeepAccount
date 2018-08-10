<%@page import="com.jaovo.msg.model.User"%>
<%@page import="com.jaovo.msg.Util.DaoFactory"%>
<%@page import="com.jaovo.msg.dao.IUserDao"%>
<%@page import="com.jaovo.msg.Util.ValidateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//获取客户端传递过来的参数
	int id = Integer.parseInt(request.getParameter("id"));
	String amount = request.getParameter("amount");
	boolean validate = ValidateUtil.validateNull(request, new String[]{"amount"});
	if(!validate){
%>	
	<jsp:forward page="designAmountInput.jsp"></jsp:forward>	
<%
	}
	IUserDao userDao = DaoFactory.getDaoImpl();
	User user = userDao.load(id);
	user.setAmount(Double.parseDouble(amount));
	userDao.update(user);
	
	user = userDao.load(id);
	//将查询出来的新的数据封装到session
	
	session.setAttribute("loginUser", user);
	
	response.sendRedirect("designAmountSuccess.jsp");
%>