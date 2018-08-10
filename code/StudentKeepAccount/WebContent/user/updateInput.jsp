<%@page import="com.jaovo.msg.Util.ValidateUtil"%>
<%@page import="com.jaovo.msg.model.User"%>
<%@page import="com.jaovo.msg.Util.DaoFactory"%>
<%@page import="com.jaovo.msg.dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户更新</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
%>
	<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
     <img src="../images/backimage.jpg" height="100%" width="100%"/>    
     </div>
	<jsp:include page="../inc/AdminCheck.jsp" >
		<jsp:param name="id" value="<%=id %>" />
	</jsp:include>
	<jsp:include page="inc.jsp" >
		<jsp:param name="op" value="更新" />
	</jsp:include>
	
	<%
		//获取客户端传递过来的参数
		
		IUserDao userDao = DaoFactory.getDaoImpl();
		User user = userDao.load(id);
	%>
	<form action="update.jsp" method="get">
		<table align="center" border="1" width="500">
		<!-- 这个id 不需要再页面上显示 , 就作为一个隐藏域传到服务器 -->
			<input type="hidden" name="id" value="<%=user.getId() %>" />
			<tr>
				<td>用户名称 : </td>
				<td>
					<input type="text" name="username" value="<%=user.getUsername() %>" />
					<%=ValidateUtil.showError(request, "username") %>
				</td>
			</tr>
				<tr>
    			<td>用户密码:</td>
    			<td>
    				<input type="password" name="password" />
    				<%=ValidateUtil.showError(request, "password") %>
    			</td>
    		</tr>
    		<tr>
    			<td>用户昵称:</td>
    			<td>
    				<input type="text" name="nickname" value="<%=user.getNickname() %>" />
    				<%=ValidateUtil.showError(request, "nickname") %>
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