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
<title>自定义日期查询————消费明细</title>
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
	    left:500px;
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

<%
	int year1 = Integer.parseInt(request.getParameter("year1"));
	int month1 = Integer.parseInt(request.getParameter("month1"));
	int day1 = Integer.parseInt(request.getParameter("day1"));
	int year2 = Integer.parseInt(request.getParameter("year2"));
	int month2 = Integer.parseInt(request.getParameter("month2"));
	int day2 = Integer.parseInt(request.getParameter("day2"));
	
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
		<input type="button" value="返回" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='load2.jsp';this.form.submit();">
		<br>
		<input type="button" value="回主菜单" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='Welcome.jsp';this.form.submit();">
		<br>
	 </form>
	 </div>
	 
	 <div id="box4">
	 <table border=1px>
	 <tr>
	 <th colspan="4">
	 <%=year1 %>年<%=month1 %>月<%=day1 %>日&nbsp;&nbsp;到&nbsp;&nbsp;<%=year2 %>年<%=month2 %>月<%=day2 %>日分类查询结果
	 </th>
	 </tr>
	 <tr>
	 <th>消费日期</th><th>消费类型</th><th>消费金额</th><th>备注</th>
	 </tr>

	 <%

	   	 	double sum = 0;

			if(year1==year2)
			{
				if(month1==month2)
				{
					if(day1==day2)
					{
						for( Record record : records )
						{
							if((record.getYear()==year1)&&(record.getMonth()==month1)&&(record.getDay()==day1))
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
					}
					else if(day1<day2)
					{
						for( Record record : records )
						{
							if((record.getYear()==year1)&&(record.getMonth()==month1)&&(record.getDay()>=day1)&&(record.getDay()<=day2))
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
					}
					else
					{
						//后期需要加入健壮性代码，日期的大小关系弄反了，要提示并跳转重新输入
					}
				}
				else if(month1<month2)
				{
					for( Record record : records )
					{
						if((record.getYear()==year1))
						{
							if(record.getMonth()==month1)
							{
								if(record.getDay()>=day1)
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
							if(record.getMonth()>month1&&record.getMonth()<month2)
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
							if(record.getMonth()==month2)
							{
								if(record.getDay()<=day2)
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
						}
					}
				}
				else
				{
					//后期需要加入健壮性代码，日期的大小关系弄反了，要提示并跳转重新输入
				}
			}
			else if(year1<year2)
			{
				for( Record record : records )
				{
						if(record.getYear()==year1)
						{
							if(record.getMonth()==month1)
							{
								if(record.getDay()>=day1)
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
							if(record.getMonth()>month1)
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
						if(record.getYear()>year1&&record.getYear()<year2)
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
						if(record.getYear()==year2)
						{
							if(record.getMonth()==month2)
							{
								if(record.getDay()<=day2)
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
							if(record.getMonth()<month2)
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
					}
			}
			else
			{
				//后期需要加入健壮性代码，日期的大小关系弄反了，要提示并跳转重新输入
			}
	 %>
	 </table>
	 <br>
	 <br>
	 您从<%=year1 %>年<%=month1 %>月<%=day1 %>日&nbsp;&nbsp;到&nbsp;&nbsp;
	 <%=year2 %>年<%=month2 %>月<%=day2 %>日累计花销：<font color="red"><%=sum %></font>元
	 <br>
	 </div>
	 </div>
</body>
</html>