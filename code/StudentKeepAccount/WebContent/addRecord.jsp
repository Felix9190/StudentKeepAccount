<%@page import="com.jaovo.msg.model.User"%>
<%@page import="com.jaovo.msg.Util.ValidateUtil"%>
<%@page import="com.jaovo.msg.dao.RecordDaoImpl"%>
<%@page import="com.jaovo.msg.model.Record"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	//接收客户端传递过来的参数
	User user = (User)session.getAttribute("loginUser");

    String username = user.getUsername();
	String type = request.getParameter("type");
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	String money = request.getParameter("money");
	String comment = request.getParameter("comment");
	
	boolean validate = ValidateUtil.validateNull(request, new String[]{"type","money"});
	if(!validate)
	{
%>
	<jsp:forward page="Welcome.jsp"></jsp:forward>
<%
//<jsp:forward page="registerInput.jsp"></jsp:forward>这种方式跳转不能改变浏览器地址，刷新的话会导致重复提交！！！
	}
	
	Record record=new Record();
	record.setUsername(username);
	record.setType(type);
	record.setYear(year);
	record.setMonth(month);
	record.setDay(day);
	record.setMoney(Double.parseDouble(money));
	record.setComment(comment);
	RecordDaoImpl recordDao = new RecordDaoImpl();
	try
	{
		recordDao.add(record);
	    //重定向
	    response.sendRedirect("addRecordSuccess.jsp");
%>

<%
	}catch(Exception e){
%>
	<h2 style="color:red ; font-size:50px">发生错误 : <%=e.getMessage() %></h2>
	<%
	}
	%>
</html>