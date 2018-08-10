<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>自定义日期查询</title>
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
	    left:450px;
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
	    top:200px;
	    left:400px;
		width:800px;
    	height:200px;
    	position:absolute; 
	 }
	 #box5
	 {
	    top:270px;
	    left:450px;
		width:800px;
    	height:200px;
    	position:absolute; 
	 }
</style>


<body>
	 <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
     <img src="images/backimage.jpg" height="100%" width="100%"/>    
     </div>
     
     <div id="box1">
     <img src="images/铁大.jpg"   width="200"   height="200" /> 
     <div id="box2">
     <font size=10 face="幼圆">自定义日期查询</font>
     </div>
	 <br>
	 <div id="box3">
	 <form action="" method="post">
		<input type="button" value="返回" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='JingZhunChaZhang.jsp';this.form.submit();">
		<br>
		<input type="button" value="回主菜单" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='Welcome.jsp';this.form.submit();">
		<br>
	 </form>
	 </div>
	 
	 <!-- 获取系统当前的年、月、日 -->
	<%@ page import="java.util.*"%>
	<% 
    	Calendar calendar=Calendar.getInstance(); 
   	 	int year=calendar.get(Calendar.YEAR); 
    	int month=calendar.get(Calendar.MONTH)+1; 
    	int day=calendar.get(Calendar.DATE);    
  	  	String date=year+"年"+month+"月"+day+"日";
 	%>
	 
	 <div id="box4">
	 <form action="" method="post">
	 
	 <font size=3>查询日期区间：</font>
	 
	 <select name="year1" size="1">
		<%
		for(int i=2015;i<=2025;i++)
		{
			if(i==year)
			{
				
				%>
				<option value="<%=String.valueOf(i)%>" selected><%=i %></option>
				<%
			}
			else
			{
				%>
				<option value="<%=String.valueOf(i)%>"><%=i %></option>
				<%
			}
		}
		%>
		</select>
		
		<select name="month1" size="1">
		<%
		for(int i=1;i<=12;i++)
		{
			if(i==1)
			{
				%>
				<option value="<%=String.valueOf(i)%>" selected><%=i %></option>
				<%
			}
			else
			{
				%>
				<option value="<%=String.valueOf(i)%>"><%=i %></option>
				<%
			}
		}
		%>
		</select>
		
		<select name="day1" size="1">
		<%
		for(int i=1;i<=31;i++)
		{
			if(i==1)
			{
				%>
				<option value="<%=String.valueOf(i)%>" selected><%=i %></option>
				<%
			}
			else
			{
				%>
				<option value="<%=String.valueOf(i)%>"><%=i %></option>
				<%
			}
		}
		%>
		</select>
	 
	 	&nbsp;&nbsp;到&nbsp;&nbsp;
	 
		<select name="year2" size="1">
		<%
		for(int i=2015;i<=2025;i++)
		{
			if(i==year)
			{
				
				%>
				<option value="<%=String.valueOf(i)%>" selected><%=i %></option>
				<%
			}
			else
			{
				%>
				<option value="<%=String.valueOf(i)%>"><%=i %></option>
				<%
			}
		}
		%>
		</select>
		
		<select name="month2" size="1">
		<%
		for(int i=1;i<=12;i++)
		{
			if(i==month)
			{
				%>
				<option value="<%=String.valueOf(i)%>" selected><%=i %></option>
				<%
			}
			else
			{
				%>
				<option value="<%=String.valueOf(i)%>"><%=i %></option>
				<%
			}
		}
		%>
		</select>
		
		<select name="day2" size="1">
		<%
		for(int i=1;i<=31;i++)
		{
			if(i==day)
			{
				%>
				<option value="<%=String.valueOf(i)%>" selected><%=i %></option>
				<%
			}
			else
			{
				%>
				<option value="<%=String.valueOf(i)%>"><%=i %></option>
				<%
			}
		}
		%>
		</select>
		
	 	<br>
	 	<br>
	 	<br>
	 	</div>
	 <div id="box5">
	 &nbsp;&nbsp;&nbsp;&nbsp;
	 <input type="button" value="明细查询" style="background-image:url(images/button.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='load2-1.jsp';this.form.submit();">
	 &nbsp;&nbsp;&nbsp;&nbsp;
	 <input type="button" value="分类查询" style="background-image:url(images/button.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='load2-2.jsp';this.form.submit();">
	 <br>
	 </form>
	 </div>
	 </div>
</body>
</html>