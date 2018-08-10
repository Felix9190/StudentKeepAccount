package com.jaovo.msg.Util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class ValidateUtil 
{
	public static  boolean validateNull(HttpServletRequest request,String[] fileds) 
	{
		boolean validate = true;
		//map��������װ�ز�ͬ�Ĵ�����Ϣ
		Map<String,String> errorMsg = new  HashMap();
		for(String filed :fileds) 
		{
			String value = request.getParameter(filed);
			if (value == null || "".equals(value.trim())) 
			{
				validate = false;
				//errorMsg.put(filed, filed+"����Ϊ��");
				if(filed.equals("username"))
				{
					errorMsg.put(filed, "���û����Ʋ���Ϊ��");
				}
				if(filed.equals("password"))
				{
					errorMsg.put(filed, "���û����벻��Ϊ��");
				}
				if(filed.equals("nickname"))
				{
					errorMsg.put(filed, "���û��ǳƲ���Ϊ��");
				}
				if(filed.equals("amount"))
				{
					errorMsg.put(filed, "��ÿ�³�ʼ��Ȳ���Ϊ��");
				}
                //��������֤��Ӽ�¼�����ͺͽ���Ƿ���д
				if(filed.equals("type"))
				{
					errorMsg.put(filed, "���������Ͳ���Ϊ��");
				}
				if(filed.equals("money"))
				{
					errorMsg.put(filed, "�����ѽ���Ϊ��");
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
