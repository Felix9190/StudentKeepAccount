package com.jaovo.msg.model;

public class User 
{
	private int id;
	private String  username;
	private String  nickname;
	private String  password;
	
	/*
	 * �û�Ȩ���ֶ�
	 * 
	 * ��ͨ�û� : 0
	 * ����Ա : 1
	 * 
	 */
	private int type;
	
	/*
	 * �û�״̬�ֶ�
	 * 
	 *    ���� : 0;
	 *    ���� : 1
	 */
	private int status;
	
	/*
	 * �û�ÿ�³�ʼ���
	 */
	private double amount;
	public int getId() 
	{
		return id;
	}
	public void setId(int id) 
	{
		this.id = id;
	}
	public String getUsername() 
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getNickname() 
	{
		return nickname;
	}
	public void setNickname(String nickname) 
	{
		this.nickname = nickname;
	}
	public String getPassword() 
	{
		return password;
	}
	public void setPassword(String password) 
	{
		this.password = password;
	}
	public int getType() 
	{
		return type;
	}
	public void setType(int type) 
	{
		this.type = type;
	}
	public int getStatus() 
	{
		return status;
	}
	public void setStatus(int status) 
	{
		this.status = status;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
}
