/*
 * 		  	FILE : DAO.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 03- 27
 * 		 COMMENT : 
 */

package org.tom.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class DAO {
	static Logger logger = Logger.getLogger(DAO.class);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public DAO() {
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariadb");
			conn = ds.getConnection();
			logger.debug("DB Access Succeed");		
		}catch(Exception e){
			e.printStackTrace();
			logger.warn("DB Access Denied");
		}	
	}
	
	public void close() {
		try {
			if(rs!=null) {rs.close();}
			if(pstmt!=null) {pstmt.close();}
			if(conn!=null) {conn.close();}
			logger.debug("DB Closed");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
