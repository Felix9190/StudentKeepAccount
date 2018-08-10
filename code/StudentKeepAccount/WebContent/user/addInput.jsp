<%@page import="com.jaovo.msg.Util.ValidateUtil"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>用户添加页面</title>
</head>
<body>
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
     <img src="../images/backimage.jpg" height="100%" width="100%"/>    
     </div>
	<jsp:include page="inc.jsp" >
		<jsp:param name="op" value="添加" />
	</jsp:include>
	<form action="add.jsp" method="post">
		<table align="center" border="1" width="500">
			<tr>
				<td>用户名称 : </td>
				<td>
					<input type="text" name="username" />
					<%
// 						if(errorMsg != null){
// 							if(errorMsg.get("username") != null){
// 								out.println( errorMsg.get("username"));
// 							}
// 						}
						
					%>
					<%=ValidateUtil.showError(request, "username") %>
				</td>
			</tr>
				<tr>
    			<td>用户密码:</td>
    			<td>
    				<input type="password" name="password" />
    				<%
// 						if(errorMsg != null){
// 							if(errorMsg.get("password") != null){
// 								out.println( errorMsg.get("password"));
// 							}
// 						}
    				
					%>
					<%=ValidateUtil.showError(request, "password") %>
    			</td>
    		</tr>
    		<tr>
    			<td>用户昵称:</td>
    			<td>
    				<input type="text" name="nickname" />
    				<%
// 						if(errorMsg != null){
// 							if(errorMsg.get("nickname") != null){
// 								out.println( errorMsg.get("nickname"));
// 							}
// 						}
					%>
					<%=ValidateUtil.showError(request, "nickname") %>
    			</td>
    		</tr>
    		<tr>
    			<td>初始额度:</td>
    			<td>
    				<input type="text" name="amount" />
    				<%
// 						if(errorMsg != null){
// 							if(errorMsg.get("nickname") != null){
// 								out.println( errorMsg.get("nickname"));
// 							}
// 						}
					%>
					<%=ValidateUtil.showError(request, "amount") %>
    			</td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="提交" />
    				<input type="reset" value="重置" />
    			</td>
    		</tr>
		</table>
	</form>
</body>
</html>