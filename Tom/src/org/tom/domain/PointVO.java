/*
 * 		  	FILE : PointVO.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 03- 27
 * 		 COMMENT : 
 */

package org.tom.domain;

import java.util.Date;

public class PointVO {
	private int user_index;
	private int point_index;
	private String point_name;
	private double point_longitude;
	private double point_latitude;
	private String point_address;
	private String bluetooth_address;
	private int hunting_count;
	private Date reset_date;
	
	public String getBluetooth_address() {
		return bluetooth_address;
	}
	public void setBluetooth_address(String bluetooth_address) {
		this.bluetooth_address = bluetooth_address;
	}
	public int getUser_index() {
		return user_index;
	}
	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}
	public int getPoint_index() {
		return point_index;
	}
	public void setPoint_index(int point_index) {
		this.point_index = point_index;
	}
	public String getPoint_name() {
		return point_name;
	}
	public void setPoint_name(String point_name) {
		this.point_name = point_name;
	}
	public double getPoint_longitude() {
		return point_longitude;
	}
	public void setPoint_longitude(double point_longitude) {
		this.point_longitude = point_longitude;
	}
	public double getPoint_latitude() {
		return point_latitude;
	}
	public void setPoint_latitude(double point_latitude) {
		this.point_latitude = point_latitude;
	}
	public String getPoint_address() {
		return point_address;
	}
	public void setPoint_address(String point_address) {
		this.point_address = point_address;
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
