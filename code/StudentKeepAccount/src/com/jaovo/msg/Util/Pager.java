package com.jaovo.msg.Util;

import java.util.List;

public class Pager<E> {
	//����������
	private int totalRecord;
	//ÿһҳ��ʾ����������
	private int pageSize;
	//ҳ����
	private int pageIndex;
	//��ҳ��
	private int totalPage;
	//ÿһҳ��ʾ�����ݵ���ʼ�±� , Ϊ������׼��
	
	//��ѯ�������ݵļ���
	private List<E> datas;

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<E> getDatas() {
		return datas;
	}

	public void setDatas(List<E> datas) {
		this.datas = datas;
	}
	
	
}
