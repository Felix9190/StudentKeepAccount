<%@page import="com.jaovo.msg.Util.ValidateUtil"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>
	<title>用户注册</title>
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
	    top:120px;
	    left:460px;
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
	    top:0px;
	    left:440px;
		width:800px;
    	height:200px;
    	position:absolute; 
	 }
	 #box5
	 {
	    top:170px;
	    left:50px;
		width:200px;
    	height:200px;
    	position:absolute; 
	 }
	 #box6
	 {
	    top:215px;
	    left:50px;
		width:200px;
    	height:200px;
    	position:absolute; 
	 }
</style>



<body>
	<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
     <img src="images/backimage.jpg" height="100%" width="100%"/>    
    </div>
     
    <div id="box1">
	<img src="images/铁大.jpg" width="200" height="200" /> 
	<div id="box2">
	<font size=25 face="幼圆">
	用户注册
	</font>
	</div>
	</div>

	<br>
	
	<div id="box3">
	<form action="" method="post">
		<input type="button" value="返回" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='LoginInput.jsp';this.form.submit();">
	</form>
	
	<br>
	<br>
	
	<div id="box4">
	<form action="register.jsp" method="post">
		
			<tr>
			用户名称:<input type="text" name="username" />
					<%
// 						if(errorMsg != null){
// 							if(errorMsg.get("username") != null){
// 								out.println( errorMsg.get("username"));
// 							}
// 						}
						
					%>
					<strong><%=ValidateUtil.showError(request, "username") %></strong>
			</tr>
			
			<br>
			<br>
			
			<tr>
				用户密码:<input type="password" name="password" />
    				<%
// 						if(errorMsg != null){
// 							if(errorMsg.get("password") != null){
// 								out.println( errorMsg.get("password"));
// 							}
// 						}
    				
					%>
					<strong><%=ValidateUtil.showError(request, "password") %></strong>
    		</tr>
    		<br>
			<br>
    		<tr>
    			用户昵称:<input type="text" name="nickname" />
				<strong><%=ValidateUtil.showError(request, "nickname") %></strong>
    		</tr>
    		<br>
			<br>
    		<tr>
    			初始额度:<input type="text" name="amount" />&nbsp;&nbsp;元/月
				<strong><%=ValidateUtil.showError(request, "amount") %></strong>
    		</tr>
    		<br>
			<br>
 
    	
    	<div id="box5">
        <table cellpadding="0" cellspacing="0" border="1" >
           <tr><td colspan="2">
               <input type="submit" value="提&nbsp交"
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
               <input type="reset" value="重 &nbsp置"
               style="background:url(images/button.jpg);
                border-style:none; 
                width:124px; 
                height:35px; 
                background-repeat:no-repeat;" 
               ></td>
               </tr>
        </table>
        </div>
    		
    		<br>
			<br>
    </div>
    </div>
	</form>
</body>
</html>