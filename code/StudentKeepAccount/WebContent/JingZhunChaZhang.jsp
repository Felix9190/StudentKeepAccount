<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>精准查账</title>
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
	    left:490px;
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
	    left:490px;
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
     <font size=10 face="幼圆">精准查账</font>
     </div>
	 <br>
	 <div id="box3">
	 <form action="" method="post">
		<input type="button" value="返回" style="background-image:url(images/橘黄色.jpg);border-style:none;width:124px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='Welcome.jsp';this.form.submit();">
		<br>
	 </form>
	 </div>
	 
	 <div id="box4">
	 <form action="" method="post">
	 <input type="button" value="按月查询" style="background-image:url(images/button.jpg);border-style:none;width:190px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='load1.jsp';this.form.submit();">
	 <br>
	 <br>
	 <input type="button" value="自定义日期查询" style="background-image:url(images/button.jpg);border-style:none;width:190px;height:93px;background-repeat:no-repeat;font-size:25px;font-weight:bold" onclick="this.form.action='load2.jsp';this.form.submit();">
	 <br>
	 </form>
	 </div>
	 </div>
</body>
</html>