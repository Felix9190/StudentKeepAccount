<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<style type="text/css">
	body 
	{
	background-image:url(images/money.jpg);
	}.text1{width:150px; height:20px}
</style>
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
		width:390px;
    	height:200px;
    	position:absolute; 
	 }
	 #box3
	 {
	    top:180px;
	    left:280px;
		width:400px;
    	height:200px;
    	position:absolute; 
	 }
	 #box4
	 {
	    top:270px;
	    left:360px;
		width:400px;
    	height:200px;
    	position:absolute; 
	 }
	 #box5
	 {
	    top:315px;
	    left:360px;
		width:400px;
    	height:200px;
    	position:absolute; 
	 }
</style>

<body>
<div id="box1">
<img src="images/铁大.jpg"   width="200"   height="200" />
<div id="box2">
 <font size=10 face="幼圆">学生快捷记账系统</font>
</div>
<div id="box3">
<%
	String loginError = (String)request.getAttribute("loginError");
	if(loginError == null)
	{
		loginError = "";
	}
%>
	<form  action="" method="post">
		<font size=4>用户名：</font><input type="text" class="text1" name="username" />
		<br>
		<br>
		<font size=4>密&nbsp;&nbsp;&nbsp;&nbsp;码：</font><input type="password" class="text1" name="password" />
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%=loginError %></strong>
		</div>
		<br>
		<div id="box4">
        <table cellpadding="0" cellspacing="0" border="1" >
           <tr><td colspan="2">
               <input type="submit" value="登&nbsp录"
               onclick="this.form.action='login.jsp';this.form.submit();"
               style="background:url(images/button.jpg);
                border-style:none; 
                width:124px; 
                height:35px; 
                background-repeat:no-repeat;" 
               ></td>
               </tr>
        </table>
		</div>
		<div id="box5">
        <table cellpadding="0" cellspacing="0" border="1" >
               <tr><td colspan="2">
               <input type="submit" value="注 &nbsp册"
               onclick="this.form.action='registerInput.jsp';this.form.submit();"
               style="background:url(images/button.jpg);
                border-style:none; 
                width:124px; 
                height:35px; 
                background-repeat:no-repeat;" 
               ></td>
               </tr>
        </table>
        </div>
	</form>
</div>

</body>

</html>