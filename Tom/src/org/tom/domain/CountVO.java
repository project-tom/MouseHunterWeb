package org.tom.domain;

import java.util.Date;

public class CountVO {
	private int point_index;
	private int hunting_count=0;
	private Date reset_date;
	public int getPoint_index() {
		return point_index;
	}
	public void setPoint_index(int point_index) {
		this.point_index = point_index;
	}
	public int getHunting_count() {
		return hunting_count;
	}
	public void setHunting_count(int hunting_count) {
		this.hunting_count = hunting_count;
	}
	public java.sql.Date getReset_date() {
		return new java.sql.Date(reset_date.getTime());
	}
	public void setReset_date(Date reset_date) {
		this.reset_date = reset_date;
	}
	
}
