package com.jaovo.msg.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil 
{
	public static Connection getConnection() 
	{
		try 
		{
			//加载驱动
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			System.out.println("驱动加载成功！");
		}
		catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) 
		{			
			System.out.println("驱动加载失败！");
			e.printStackTrace();
		}
		String user="sa";
		String password="woshizcy0919";
		String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=StudentKeepAccount_DB";
		Connection connection=null;
		try 
		{
			//创建链接对象connection
			connection=DriverManager.getConnection(url, user, password);
			System.out.println("数据库连接成功！");
		}
		catch(SQLException e) 
		{
			System.out.println("数据库连接失败！");
			e.printStackTrace();
		}
		return connection;
	}
	
	//关闭资源的方法
	public static void close(Connection connection) 
	{
		if(connection!=null) 
		{
			try 
			{
				connection.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	}
	
	public static void close(PreparedStatement preparedStatement) 
	{
		
		if(preparedStatement !=null) 
		{
			try 
			{
				preparedStatement.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet resultSet) 
	{
			if(resultSet!=null) 
			{
				try 
				{
					resultSet.close();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
	}	

}
