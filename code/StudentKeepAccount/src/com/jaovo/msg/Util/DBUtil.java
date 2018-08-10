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
			//��������
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			System.out.println("�������سɹ���");
		}
		catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) 
		{			
			System.out.println("��������ʧ�ܣ�");
			e.printStackTrace();
		}
		String user="sa";
		String password="woshizcy0919";
		String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=StudentKeepAccount_DB";
		Connection connection=null;
		try 
		{
			//�������Ӷ���connection
			connection=DriverManager.getConnection(url, user, password);
			System.out.println("���ݿ����ӳɹ���");
		}
		catch(SQLException e) 
		{
			System.out.println("���ݿ�����ʧ�ܣ�");
			e.printStackTrace();
		}
		return connection;
	}
	
	//�ر���Դ�ķ���
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
