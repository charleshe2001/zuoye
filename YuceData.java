package model;

import java.io.Serializable;

public class YuceData implements Serializable {

	private static final long serialVersionUID = 1L;
	
	

	public int getYuce_num() {
		return yuce_num;
	}

	public void setYuce_num(int yuce_num) {
		this.yuce_num = yuce_num;
	}






	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private int yuce_num;


	private int yuce_week;
	

	public int getYuce_week() {
		return yuce_week;
	}

	public void setYuce_week(int yuce_week) {
		this.yuce_week = yuce_week;
	}

	public YuceData() {
		super();
	}

	// �����Ϣ��


	// �޸���Ϣ��
	public YuceData( int yuce_week
			,int yuce_num) {
		super();
	
		this.yuce_week = yuce_week;
		this.yuce_num = yuce_num;
		
	}

	// ɾ����Ϣ��
	public YuceData(int yuce_week) {
		super();
		this.yuce_week = yuce_week;;
	}

	

}

