<%@page import="com.jaovo.msg.Util.ValidateUtil"%>
<%@page import="com.jaovo.msg.Util.DaoFactory"%>
<%@page import="com.jaovo.msg.dao.IUserDao"%>
<%@page import="com.jaovo.msg.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<title>修改密码</title>
</head>


<%
	User user = (User)session.getAttribute("loginUser");
%>


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
	    top:120px;
	    left:50px;
		width:200px;
    	height:200px;
    	position:absolute; 
	 }
	 #box6
	 {
	    top:165px;
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
	修改密码
	</font>
	</div>
	</div>

	<br>
	
	<div id="box3">
	<form action="" method="post">
		<input type="button" value="返回" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='GeRenSheZhi.jsp';this.form.submit();">
		<br>
		<input type="button" value="回主菜单" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='Welcome.jsp';this.form.submit();">
		<br>
	</form>
	
	<br>
	<br>
	
	<div id="box4">
	<form action="changePassword.jsp" method="post">
			<input type="hidden" name="id" value="<%=user.getId() %>" />
		
			<tr>
			用户名称:<input type="text" name="username" value="<%=user.getUsername() %>" />
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
				新&nbsp;&nbsp;密&nbsp;&nbsp;码:<input type="password" name="password" />
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
    			用户昵称:<input type="text" name="nickname" value="<%=user.getNickname() %>"/>
    				<%
// 						if(errorMsg != null){
// 							if(errorMsg.get("nickname") != null){
// 								out.println( errorMsg.get("nickname"));
// 							}
// 						}
					%>
					<strong><%=ValidateUtil.showError(request, "nickname") %></strong>
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