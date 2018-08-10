<%@page import="com.jaovo.msg.Util.ValidateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎</title>
</head> 

<style type="text/css">
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
	    left:220px;
		width:400px;
    	height:200px;
    	position:absolute; 
	 }
	 #box3
	 {
	    top:0px;
	    left:0px;
		width:200px;
    	height:200px;
    	position:relative; 
	 }
	 #box4
	 {
	    top:15px;
	    left:220px;
		width:800px;
    	height:200px;
    	position:absolute; 
	 }
	 #box5
	 {
	    top:280px;
	    left:50px;
		width:800px;
    	height:200px;
    	position:absolute; 
	 }
	 #box6
	 {
	    top:280px;
	    left:200px;
		width:800px;
    	height:200px;
    	position:absolute; 
	 }
	 #top
	 {
	 	top:20px;
	 	right:0px;
		width:400px;
    	height:200px;
    	position:absolute; 
	 }
</style>



<div id="top">
<jsp:include page="inc/top.jsp" >
		<jsp:param name="op" value="展示" />
</jsp:include>
</div>

<body>
     <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
     <img src="images/backimage.jpg" height="100%" width="100%"/>    
     </div>
     
     <div id="box1">
     <img   src="images/铁大.jpg"   width="200"   height="200" />
     <div id="box2">
	 <font size=25 face="幼圆">学生快捷记账系统</font>
	 </div>
     </div>
     
     
	 <br>
<!-- 获取系统当前的年、月、日 -->
<%@ page import="java.util.*"%>
<% 
    Calendar calendar=Calendar.getInstance(); 
    int year=calendar.get(Calendar.YEAR); 
    int month=calendar.get(Calendar.MONTH)+1; 
    int day=calendar.get(Calendar.DATE);    
    String date=year+"年"+month+"月"+day+"日";
 %>
	 
	 <form action="" method="post">
	 	<div id="box3">
		<input type="button" value="消费明细" style="background-image:url(images/橘黄色.jpg);border-style:none;width:160px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='XiaoFeiMingXi.jsp';this.form.submit();"><br>
        <input type="button" value="精准查账" style="background-image:url(images/橘黄色.jpg);border-style:none;width:160px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='JingZhunChaZhang.jsp';this.form.submit();"><br>
		<input type="button" value="个人设置" style="background-image:url(images/橘黄色.jpg);border-style:none;width:160px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='GeRenSheZhi.jsp';this.form.submit();"><br>		
		
		<div id="box4">
	  	<font size=3>类型：</font>
		 <input type="radio" name="type" value="餐饮">餐饮
		 <input type="radio" name="type" value="医疗">医疗
		 <input type="radio" name="type" value="超市购物">超市购物
		 <input type="radio" name="type" value="学习">学习
		 <input type="radio" name="type" value="网吧">网吧
		 <input type="radio" name="type" value="网购">网购
		 <input type="radio" name="type" value="旅游">旅游
		 <input type="radio" name="type" value="电影">电影
		 <input type="radio" name="type" value="聚会">聚会
		 <input type="radio" name="type" value="其他">其他
		 <br>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%=ValidateUtil.showError(request, "type") %></strong>
		 <br>
		 <br>
		 <font size=3>时间：</font>
		<select name="year" size="1">
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
		
		<select name="month" size="1">
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

		<select name="day" size="1">
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
		
		<font size=3>金额：</font>
			<input type="text" name="money">&nbsp;元
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%=ValidateUtil.showError(request, "money") %></strong>
		<br>
		<br>
			<font size=3>备注：</font>
			<textarea rows="3" name="comment" cols="50"></textarea>
		<br>
		
		<div id="box5">
        <table cellpadding="0" cellspacing="0" border="1" >
           <tr><td colspan="2">
               <input type="submit" value="添&nbsp加"
               onclick="this.form.action='addRecord.jsp';this.form.submit();"
               style="background:url(images/button.jpg);
                border-style:none; 
                width:124px; 
                height:35px; 
                background-repeat:no-repeat;" 
               ></td>
               </tr>
        </table>
		</div>
		
		<div id="box6">
        <table cellpadding="0" cellspacing="0" border="1" >
               <tr><td colspan="2">
               <input type="submit" value="重&nbsp置"
               style="background:url(images/button.jpg);
                border-style:none; 
                width:124px; 
                height:35px; 
                background-repeat:no-repeat;" 
               ></td>
               </tr>
        </table>
        </div>
	</div>
	</div>
</form>
</body>
</html>