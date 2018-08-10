<%@page import="com.jaovo.msg.model.Record"%>
<%@page import="java.util.List"%>
<%@page import="com.jaovo.msg.Util.DaoFactory"%>
<%@page import="com.jaovo.msg.dao.IRecordDao"%>
<%@page import="com.jaovo.msg.dao.RecordDaoImpl"%>
<%@page import="com.jaovo.msg.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>按月查询————消费明细</title>
</head>


<style>
     #box1
	 {
	 	top:0px;
	 	left:0px;
		width:200px;
    	height:200px;
    	position:relative; 
	 }
	 #box2
	 {
	    top:70px;
	    left:480px;
		width:400px;
    	height:200px;
    	position:absolute; 
	 }
	 #box3
	 {
	    top:220px;
	    left:0px;
		width:200px;
    	height:200px;
    	position:absolute; 
	 }
	 #box4
	 {
	    top:170px;
	    left:430px;
		width:800px;
    	height:200px;
    	position:absolute; 
	 }
</style>
<!-- 获取系统当前的年、月、日 -->
<%@ page import="java.util.*"%>
<% 
    Calendar calendar=Calendar.getInstance(); 
    int nowyear=calendar.get(Calendar.YEAR); 
    int nowmonth=calendar.get(Calendar.MONTH)+1;    
	
    
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));

	User user=(User)session.getAttribute("loginUser");
	String username=user.getUsername();
	IRecordDao recordDao = DaoFactory.getRecordDaoImpl();
	List<Record> records = recordDao.load(username);
%>




<body>
	 <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
     <img src="images/backimage.jpg" height="100%" width="100%"/>    
     </div>
     
     <div id="box1">
     <img src="images/铁大.jpg"   width="200"   height="200" /> 
     <div id="box2">
     <font size=10 face="幼圆">消费明细</font>
     <br>
     </div>
     
	 <br>
	 <div id="box3">
	 <form action="" method="post">
		<input type="button" value="返回" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='load1.jsp';this.form.submit();">
		<br>
		<input type="button" value="回主菜单" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='Welcome.jsp';this.form.submit();">
		<br>
	 </form>
	 </div>
	 
	 <div id="box4">
	 <table border=1px>
	 <tr>
	 <th colspan="4">
	 <%=year %>年<%=month %>月明细查询结果
	 </th>
	 </tr>
	 <tr>
	 <th>消费日期</th><th>消费类型</th><th>消费金额</th><th>备注</th>
	 </tr>

	 <%
	    double amount = user.getAmount();
	    double sum = 0;
	    double remaining = amount;
		for( Record record : records )
		{
			if((year==record.getYear())&&(month==record.getMonth()))
			{
				sum = sum + record.getMoney();
	 %>
		<tr>
			<td><%=record.getYear()+"年"+record.getMonth()+"月"+record.getDay()+"日" %></td>
			<td><%=record.getType() %></td>
			<td><%=record.getMoney() %></td>
			<td><%=record.getComment() %></td>
		</tr>
	 <%
			}
	    }
	 %>
	 
	 </table>
	 <br>
	 <br>
	<%
	if(year==nowyear&&month==nowmonth)
	{
	%>
	 您本月初始额度为：<%=amount %>元&nbsp;&nbsp;&nbsp;&nbsp;
	<%
	remaining = amount - sum;
	if(remaining>=(amount*0.2))
	{
	%>
		余额为：<font color="red"><%=remaining %></font>元
	<%
	}
	else if(remaining<(amount*0.2)&&remaining>0)
	{
	%>
		余额为：<font color="red"><%=remaining %></font>元<br>
		注意：<font color="red">您本月余额已不足20%，请您合理安排，计划消费，健康生活。</font>
	<%	
	}
	else
	{
		remaining = Math.abs(remaining);
	%>
		余额为：<font color="red">0元</font><br>
		注意：<font color="red">您已超出预期额度<%=remaining %>元，请您理性消费，健康生活。</font>
	<%
	}
	}
	else
	{
	%>
	您<%=year %>年<%=month %>月总花销为：<font color="red"><%=sum %></font>元
	<%
	}
	%>
	 <br>
	 </div>
	 </div>
</body>
</html>