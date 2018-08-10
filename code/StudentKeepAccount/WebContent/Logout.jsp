<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	思路 : 就是将session中的用户信息清除
	session是服务器管理的, 但是咱们可以设置session失效
 -->
 <%
 	//设置session失效的方法
 	session.invalidate();
	response.sendRedirect(request.getContextPath()+"/LoginInput.jsp");
 %>