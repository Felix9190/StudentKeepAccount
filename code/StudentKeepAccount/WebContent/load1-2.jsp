<%@page import="java.math.BigDecimal"%>
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
<title>分类查询————消费明细</title>
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
	    left:470px;
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
	    left:460px;
		width:800px;
    	height:200px;
    	position:absolute; 
	 }
</style>

<!-- 获取系统当前的年、月、日 -->
<%@ page import="java.util.*"%>
<% 
    Calendar calendar=Calendar.getInstance(); 
    int nowyear=calendar.get(Calendar.YEAR); 
    int nowmonth=calendar.get(Calendar.MONTH)+1;    
    
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));

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
     <font size=10 face="幼圆">分类查询</font>
     <br>
     </div>
     
	 <br>
	 <div id="box3">
	 <form action="" method="post">
		<input type="button" value="返回" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='load1.jsp';this.form.submit();">
		<br>
		<input type="button" value="回主菜单" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='Welcome.jsp';this.form.submit();">
		<br>
	 </form>
	 </div>
	 
	 
	 <div id="box4">
	 <table border=1px>
	 <tr>
	 <th colspan="3">
	 <%=year %>年<%=month %>月分类查询结果
	 </th>
	 </tr>
	 <tr>
	 <th>消费类型</th><th>消费金额</th><th>所占比例</th>
	 </tr>

	 <%
	 	double amount = user.getAmount();//显示用户初始额度
	 	double sum = 0;//累计花销汇总
	 	double remaining = amount;//余额
	 	double[] a = new double[10];//每月的各种类型花销总和
	 	String[] b = new String[]{"餐饮","医疗","超市购物","学习","网吧","网购","旅游","电影","聚会","其他"};//花销类型
	 	double[] c = new double[10];//各个类型花销所占比例
		for( Record record : records )
		{
			if((year==record.getYear())&&(month==record.getMonth()))
			{
				if(record.getType().equals("餐饮"))
				{
					a[0] = a[0]+record.getMoney();	
				}
				if(record.getType().equals("医疗"))
				{
					a[1] = a[1]+record.getMoney();
				}
				if(record.getType().equals("超市购物"))
				{
					a[2] = a[2]+record.getMoney();
				}
				if(record.getType().equals("学习"))
				{
					a[3] = a[3]+record.getMoney();
				}
				if(record.getType().equals("网吧"))
				{
					a[4] = a[4]+record.getMoney();
				}
				if(record.getType().equals("网购"))
				{
					a[5] = a[5]+record.getMoney();
				}
				if(record.getType().equals("旅游"))
				{
					a[6] = a[6]+record.getMoney();
				}
				if(record.getType().equals("电影"))
				{
					a[7] = a[7]+record.getMoney();
				}
				if(record.getType().equals("聚会"))
				{
					a[8] = a[8]+record.getMoney();
				}
				if(record.getType().equals("其他"))
				{
					a[9] = a[9]+record.getMoney();
				}
			}
	    }

		for(int i=0;i<10;i++)
		{
			sum=sum+a[i];
		}
		
		for(int i=0;i<10;i++)
		{
			if(a[i]!=0)
			{
				c[i]=a[i]/sum*100;
				//四舍五入法取得double保留两位小数的结果
				
				BigDecimal d = new BigDecimal(c[i]);  
				double f1 = d.setScale(1,BigDecimal.ROUND_HALF_UP).doubleValue();
				
				//定义格式法取得double保留两位小数的结果
				/*
				java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.0");  
				String f1 = df.format(c[i]);
				*/
	 %>
	 <tr>
	 <td><%=b[i] %></td><td><%=a[i] %></td><td><%=f1%>%</td>
	 </tr>
	 <%
			}
		}
	 %>
	 
	 </table>
	 <br>
	 <br>
	 <%
	if(year==nowyear&&month==nowmonth)
	{
	%>
	 您本月初始额度为：<%=amount %>元&nbsp;&nbsp;&nbsp;&nbsp;
	<%
	remaining = amount - sum;
	if(remaining>=(amount*0.2))
	{
	%>
		余额为：<font color="red"><%=remaining %></font>元
	<%
	}
	else if(remaining<(amount*0.2)&&remaining>0)
	{
	%>
		余额为：<font color="red"><%=remaining %></font>元<br>
		注意：<font color="red">您本月余额已不足20%，请您合理安排，计划消费，健康生活。</font>
	<%	
	}
	else
	{
		remaining = Math.abs(remaining);
	%>
		余额为：<font color="red">0</font>元<br>
		注意：<font color="red">您已超出预期额度<%=remaining %>元，请您理性消费，健康生活。</font>
	<%
	}
	}
	else
	{
	%>
	您<%=year %>年<%=month %>月总花销为：<font color="red"><%=sum %></font>元
	<%
	}
	%>
	 <br>
	 </div>
	 </div>
</body>
</html>