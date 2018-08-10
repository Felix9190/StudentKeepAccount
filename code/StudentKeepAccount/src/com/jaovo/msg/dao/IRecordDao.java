package com.jaovo.msg.dao;

import java.util.List;

import com.jaovo.msg.model.Record;

public interface IRecordDao 
{
	public void add(Record record);
	public List<Record> load(String username);
}
