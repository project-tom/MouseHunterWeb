/*
 * 		  	FILE : UserVO.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 03- 27
 * 		 COMMENT : 
 */

package org.tom.domain;

import java.util.Date;

public class UserVO {
	private int user_index;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private Date user_birth;
	private String user_gender;
	private String user_phone;
	private String user_address;
	private Date user_reg;
	public int getUser_index() {
		return user_index;
	}
	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public java.sql.Date getUser_birth() {
		
		return user_birth!=null ? new java.sql.Date(user_birth.getTime()) : null;
		
	}
	public void setUser_birth(Date user_birth) {
		System.out.println("util : "+user_birth);
		this.user_birth = user_birth;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public Date getUser_reg() {
		return user_reg;
	}
	public void setUser_reg(Date user_reg) {
		this.user_reg = user_reg;
	}
	
	
}
