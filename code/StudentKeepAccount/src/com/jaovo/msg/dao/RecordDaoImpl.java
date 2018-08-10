package com.jaovo.msg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jaovo.msg.Util.DBUtil;
import com.jaovo.msg.Util.Pager;
import com.jaovo.msg.Util.UserException;
import com.jaovo.msg.model.Record;
import com.jaovo.msg.model.User;

public class RecordDaoImpl implements IRecordDao
{
	public void add(Record record)
	{
		Connection connection = DBUtil.getConnection();
		//SQLserver�Ĳ������value��Ҫ��s����Ȼ�ᱨ�������мǣ�����
		String sql="insert into t_record(username,type,year,month,day,money,comment) values (?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, record.getUsername());
			preparedStatement.setString(2, record.getType());
			preparedStatement.setInt(3, record.getYear());
			preparedStatement.setInt(4, record.getMonth());
			preparedStatement.setInt(5, record.getDay());
			preparedStatement.setDouble(6, record.getMoney());
			preparedStatement.setString(7, record.getComment());
			preparedStatement.executeUpdate();
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
	}
	public List<Record> load(String username) 
	{
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = "select * from t_record where username = ?";
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Record> records = new ArrayList<Record>();
		Record record = null;
		try 
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) 
			{
				record = new Record();
				record.setYear(resultSet.getInt("year"));
				record.setMonth(resultSet.getInt("month"));
				record.setDay(resultSet.getInt("day"));
				record.setType(resultSet.getString("type"));
				record.setMoney(resultSet.getDouble("money"));
				record.setComment(resultSet.getString("comment"));
				records.add(record);
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
		return records;
	}
	
	
	public Pager<Record> load(String username,int pageIndex,int pageSize) {
		Pager<Record> pager = new  Pager<Record>();
		Connection connection = DBUtil.getConnection();
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//׼��sql���
		String sql = "select * from t_record ";
		//����������
		String  sqlCount = "select count(*) from t_record";
		//������ֻ�ܷ���user����
		List<Record> records = new ArrayList<Record>();
		Record record = null;
		try {
			if (pageIndex <= 0) {
				pageIndex = 1;
			}
			
			int start = (pageIndex-1)*pageSize;
			
			if (username == null || "".equals(username)) {
				sql += "";
			}else {
				sql += " where username like '%" + username +"%'";
				sqlCount += " where username like '%" + username +"%'";
			}
			preparedStatement = connection.prepareStatement(sqlCount);
			resultSet = preparedStatement.executeQuery();
			
			//�ܼ�¼��
			int totalRecord = 0;
			
			while(resultSet.next()) {
				totalRecord = resultSet.getInt(1);
			}	
			//��ҳ��
			int totalPage = totalRecord%pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
			
			//�ӷ�ҳ
			sql += "limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, start);
			preparedStatement.setInt(2, pageSize);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				record = new Record();
				record.setType(resultSet.getString("type"));
				record.setYear(resultSet.getInt("year"));
				record.setMonth(resultSet.getInt("month"));
				record.setDay(resultSet.getInt("day"));
				record.setMoney(resultSet.getDouble("money"));
				record.setComment(resultSet.getString("comment"));
				record.setUsername(resultSet.getString("username"));
				records.add(record);
			}	
			//����ҳ����������������
			pager.setDatas(records);
			pager.setPageIndex(pageIndex);
			pager.setPageSize(pageSize);
			pager.setTotalPage(totalPage);
			pager.setTotalRecord(totalRecord);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return pager;
	}
}




