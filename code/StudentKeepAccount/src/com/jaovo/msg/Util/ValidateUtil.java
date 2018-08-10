package com.jaovo.msg.Util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class ValidateUtil 
{
	public static  boolean validateNull(HttpServletRequest request,String[] fileds) 
	{
		boolean validate = true;
		//map对象用来装载不同的错误信息
		Map<String,String> errorMsg = new  HashMap();
		for(String filed :fileds) 
		{
			String value = request.getParameter(filed);
			if (value == null || "".equals(value.trim())) 
			{
				validate = false;
				//errorMsg.put(filed, filed+"不能为空");
				if(filed.equals("username"))
				{
					errorMsg.put(filed, "！用户名称不能为空");
				}
				if(filed.equals("password"))
				{
					errorMsg.put(filed, "！用户密码不能为空");
				}
				if(filed.equals("nickname"))
				{
					errorMsg.put(filed, "！用户昵称不能为空");
				}
				if(filed.equals("amount"))
				{
					errorMsg.put(filed, "！每月初始额度不能为空");
				}
                //下面是验证添加记录的类型和金额是否填写
				if(filed.equals("type"))
				{
					errorMsg.put(filed, "！消费类型不能为空");
				}
				if(filed.equals("money"))
				{
					errorMsg.put(filed, "！消费金额不能为空");
				}
			}
			if (!validate) 
			{
				request.setAttribute("errormsg", errorMsg);
			}
		}
		return validate;
	}
	public static String showError(HttpServletRequest request , String filed) 
	{
		Map<String, String> errorMsg = (Map<String,String>)request.getAttribute("errormsg");
		if (errorMsg == null) 
		{
			return "";
		}
		String msg = errorMsg.get(filed);
		if (msg == null) 
		{
			return "";
		}
		return msg;
	}
}
