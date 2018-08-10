package com.jaovo.msg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.jaovo.msg.Util.DBUtil;
import com.jaovo.msg.Util.UserException;
import com.jaovo.msg.model.User;


public class UserDaoImpl implements IUserDao 
{
	public void add(User user) 
	{
		//������Ӷ���
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select count(*) from t_user where username = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try 
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			//���ս����
			resultSet = preparedStatement.executeQuery();
			//���������
			while(resultSet.next()) 
			{
				if (resultSet.getInt(1) > 0) 
				{
					throw new UserException("�û��Ѵ���") ;
				} 
			}
			//SQLserver�Ĳ������value��Ҫ��s����Ȼ�ᱨ�������мǣ�����
			sql = "insert into t_user(username,password,nickname,type,status,amount) values (?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getNickname());
			preparedStatement.setInt(4, user.getType());
			preparedStatement.setInt(5, user.getStatus());
			preparedStatement.setDouble(6, user.getAmount());
			preparedStatement.executeUpdate();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			//�ر���Դ
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	public void delete(int id) 
	{
		Connection connection = DBUtil.getConnection();
		String sql = "delete from t_user where id = ?";
		PreparedStatement preparedStatement = null;
		try 
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}	
	}

	public void update(User user) 
	{
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "update t_user set password =?,nickname=?,type=?,status=?,amount=? where id = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		try 
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getPassword());
			preparedStatement.setString(2, user.getNickname());
			preparedStatement.setInt(3, user.getType());
			preparedStatement.setInt(4, user.getStatus());
			preparedStatement.setDouble(5, user.getAmount());
			preparedStatement.setInt(6, user.getId());
			preparedStatement.executeUpdate();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	public User load(int id) 
	{
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from t_user  where id = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) 
			{
				user = new User();
				user.setId(id);
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setNickname(resultSet.getString("nickname"));
				user.setType(resultSet.getInt("type"));
				user.setStatus(resultSet.getInt("status"));
				user.setAmount(resultSet.getDouble("amount"));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return user;
	}

	public User load(String username) 
	{
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from t_user  where username = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) 
			{
				user = new User();
				user.setId(resultSet.getInt("id"));
				user.setUsername(username);
				user.setPassword(resultSet.getString("password"));
				user.setNickname(resultSet.getString("nickname"));
				user.setType(resultSet.getInt("type"));
				user.setStatus(resultSet.getInt("status"));
				user.setAmount(resultSet.getDouble("amount"));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return user;
	}

	public List<User> load() 
	{
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from t_user ";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//������ֻ�ܷ���user����
		List<User> users = new ArrayList<User>();
		User user = null;
		try 
		{
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) 
			{
				user = new User();
				user.setId(resultSet.getInt("id"));
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setNickname(resultSet.getString("nickname"));
				user.setType(resultSet.getInt("type"));
				user.setStatus(resultSet.getInt("status"));
				user.setAmount(resultSet.getDouble("amount"));
				users.add(user);
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}finally 
		{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return users;
	}

	public User load(String username, String password) 
	{
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from t_user where username = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try 
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				user = new User();
				user.setId(resultSet.getInt("id"));
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setNickname(resultSet.getString("nickname"));
				user.setType(resultSet.getInt("type"));
				user.setStatus(resultSet.getInt("status"));
				user.setAmount(resultSet.getDouble("amount"));
			}
			if (user == null) 
			{
				throw new UserException("���û���������");
			}
			if (!user.getPassword().equals(password)) 
			{
				throw new UserException("�����벻��ȷ");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return user;
	}
}
