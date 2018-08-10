package com.jaovo.msg.model;

public class User 
{
	private int id;
	private String  username;
	private String  nickname;
	private String  password;
	
	/*
	 * 用户权限字段
	 * 
	 * 普通用户 : 0
	 * 管理员 : 1
	 * 
	 */
	private int type;
	
	/*
	 * 用户状态字段
	 * 
	 *    启用 : 0;
	 *    禁用 : 1
	 */
	private int status;
	
	/*
	 * 用户每月初始额度
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
