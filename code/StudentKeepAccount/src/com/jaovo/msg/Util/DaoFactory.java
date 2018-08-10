package com.jaovo.msg.Util;

import com.jaovo.msg.dao.RecordDaoImpl;
import com.jaovo.msg.dao.UserDaoImpl;

public class DaoFactory 
{
	public static UserDaoImpl getDaoImpl() 
	{
		return new UserDaoImpl();
	}
	public static RecordDaoImpl getRecordDaoImpl() 
	{
		return new RecordDaoImpl();
	}
}
