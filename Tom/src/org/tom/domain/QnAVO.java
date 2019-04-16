package org.tom.domain;

import java.util.Date;

public class QnAVO {
	private int qna_index;
	private String qna_title;
	private String qna_content;
	private String qna_author;
	private Date qna_date;
	private String qna_pass;
	private int qna_readcount;
	private int qna_parentnum;
	private int qna_answer;
	
	
	public int getQna_index() {
		return qna_index;
	}
	public void setQna_index(int qna_index) {
		this.qna_index = qna_index;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_author() {
		return qna_author;
	}
	public void setQna_author(String qna_author) {
		this.qna_author = qna_author;
	}
	public java.sql.Date getQna_date() {
		return new java.sql.Date(qna_date.getTime());
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public int getQna_readcount() {
		return qna_readcount;
	}
	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}
	public int getQna_parentnum() {
		return qna_parentnum;
	}
	public void setQna_parentnum(int qna_parentnum) {
		this.qna_parentnum = qna_parentnum;
	}
	public int getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(int qna_answer) {
		this.qna_answer = qna_answer;
	}
	
	
}
