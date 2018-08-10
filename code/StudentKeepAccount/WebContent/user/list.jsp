<%@page import="com.jaovo.msg.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.jaovo.msg.dao.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户展示</title>
</head>
<%
	UserDaoImpl userDao = new UserDaoImpl();
	List<User> users = userDao.load();
	
	//获取登录用户
	User loginuser = (User)session.getAttribute("loginUser");
%>
<body>
	<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
     <img src="../images/backimage.jpg" height="100%" width="100%"/>    
     </div>
	<jsp:include page="inc.jsp" >
		<jsp:param name="op" value="展示" />
	</jsp:include>
	<table align="center" border="1" width="700">
		<tr>
			<td>用户编号</td>
			<td>用户名称</td>
			<td>用户密码</td>
			<td>用户昵称</td>
			<td>用户类型</td>
			<td>用户状态</td>
			<td colspan="2">用户操作</td>
		</tr>
		<%
			for( User user : users ){
		%>
		<tr>
			<td> <%=user.getId() %></td>
			<td> <%=user.getUsername() %></td>
			<td> <%=user.getPassword() %></td>
			<td> <%=user.getNickname() %></td>
			<td>
				<%
					if(user.getType() == 0){
				%>
					<span style="color:#000000;font-family: 楷体">普通用户</span>
					<%
						if(loginuser.getType() == 1){
					%>
						<a href="setType.jsp?id=<%=user.getId() %>">设置为管理员</a>
					<%
						}
					%>
				<%
					}else{
				%>	
					<span style="color:#ffff00;font-family: 楷体">管理员</span>
					<%
						if(loginuser.getType() == 1){
					%>
						<a href="setType.jsp?id=<%=user.getId() %>">取消管理员</a>
					<%
						}
					%>
				<%
					}
				%>
			</td>
			
			
			<td>
				<%
					if(user.getStatus() == 0){
				%>
					启用
					<%
						if(loginuser.getType() == 1){
					%>
						<a href="setStatus.jsp?id=<%=user.getId() %>">禁用</a>
					<%
						}
					%>
				<%
					}else{
				%>	
					<font color="red">禁用</font>
					<%
						if(loginuser.getType() == 1){
					%>
						<a href="setStatus.jsp?id=<%=user.getId() %>">启用</a>
					<%
						}
					%>
				<%	
					}
				%>
			</td>
			
			
			
			<td> <a href="delete.jsp?id=<%=user.getId() %>" >删除</a></td>
			<td> <a href="updateInput.jsp?id=<%=user.getId() %>" >更新</a></td>
			
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>