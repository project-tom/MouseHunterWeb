/*
 * 		  	FILE : UserDAOImpl.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 03- 27
 * 		 COMMENT : 
 */

package org.tom.persistence;

import java.sql.*;
import java.util.ArrayList;

import org.tom.domain.UserVO;

public class UserDAOImpl extends DAO implements UserDAO{
	
	public UserDAOImpl() {
		super();	
	}
	
	// 유저 추가
	@Override
	public boolean userAdd(UserVO vo) {
		try {
			pstmt = conn.prepareStatement("INSERT INTO user(user_id, user_pw, user_name, user_email, user_birth, user_gender, user_phone, user_address, user_reg) VALUES (?,?,?,?,?,?,?,?,now())");
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_pw());
			pstmt.setString(3, vo.getUser_name());
			pstmt.setString(4, vo.getUser_email());
			pstmt.setDate(5, vo.getUser_birth());
			pstmt.setString(6, vo.getUser_gender());
			pstmt.setString(7, vo.getUser_phone());
			pstmt.setString(8, vo.getUser_address());
			System.out.println("DAO(sql.date) :"+vo.getUser_birth());
			pstmt.executeUpdate();
			
			
			return true;
		}catch (SQLException e) {
			
			e.printStackTrace();
			return false;
			
		}finally {
			try {
				close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 로그인
	@Override
	public boolean userSignIn(UserVO vo) {
		try {
			pstmt = conn.prepareStatement("SELECT count(*) AS count FROM user WHERE user_id = ? AND user_pw = ? ");
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_pw());
			
			rs = pstmt.executeQuery();
			rs.next();
			if(rs.getInt("count") == 1) {
				return true;
			}else {
				return false;
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {	}
		}
	}

	// 중복 체크
	@Override
	public boolean userCheckID(UserVO vo) {
		try {
			pstmt = conn.prepareStatement("SELECT count(user_id) FROM user WHERE user_id = ?");
			pstmt.setString(1,vo.getUser_id());
			
			rs = pstmt.executeQuery();
			rs.next();
			
			if(rs.getInt(1) == 0) {
				return true;
			}else {
				return false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();

			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
		
	}

	// 사용자 번호 출력
	@Override
	public int userIndexReturn(UserVO vo) {
		try {
			pstmt = conn.prepareStatement("SELECT user_index FROM user WHERE user_id = ?");
			pstmt.setString(1,vo.getUser_id());
			
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	
	}

	// 사용자 정보 수정
	@Override
	public int userInfoModify(UserVO vo) {
		try {
			pstmt = conn.prepareStatement("UPDATE user SET user_id = ?, user_pw = ?, user_name = ?,user_email = ? , user_phone = ? user_address = ? WHERE user_index = ?");
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_pw());
			pstmt.setString(3, vo.getUser_name());
			pstmt.setString(4, vo.getUser_email());
			pstmt.setString(5, vo.getUser_phone());
			pstmt.setString(6, vo.getUser_address());
			pstmt.setInt(7, vo.getUser_index());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
		
		return 0;
	}

	// 유저 목록 
	// 관리자용
	@Override
	public ArrayList<UserVO> userInfoList() {
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user");
			rs = pstmt.executeQuery();
			
			ArrayList<UserVO> list = new ArrayList<UserVO>();
			
			while(rs.next()) {
				UserVO vo = new UserVO();
				vo.setUser_index(rs.getInt("user_index"));
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_pw(rs.getString("user_pw"));
				vo.setUser_name(rs.getString("user_name"));
				vo.setUser_email(rs.getString("user_email"));
				vo.setUser_phone(rs.getString("user_phone"));
				vo.setUser_address(rs.getString("user_address"));
				vo.setUser_birth(rs.getDate("user_birth"));
				vo.setUser_gender(rs.getString("user_gender"));
				vo.setUser_reg(rs.getDate("user_gender"));
				
				list.add(vo);
				
			}
			
			return list;
		} catch (SQLException e) {
			e.printStackTrace();

			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
		
		
	}

	// 유저 정보
	@Override
	public UserVO userInfo(UserVO vo) {
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user WHERE user_index = ?");
			pstmt.setInt(1, vo.getUser_index());
			rs = pstmt.executeQuery();
			if(rs.next()) {
			
				vo = new UserVO();
				vo.setUser_index(rs.getInt("user_index"));
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_pw(rs.getString("user_pw"));
				vo.setUser_name(rs.getString("user_name"));
				vo.setUser_email(rs.getString("user_email"));
				vo.setUser_phone(rs.getString("user_phone"));
				vo.setUser_address(rs.getString("user_address"));
				vo.setUser_birth(rs.getDate("user_birth"));
				vo.setUser_gender(rs.getString("user_gender"));
				vo.setUser_reg(rs.getDate("user_gender"));
			}
			return vo;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
		
		
	}

	// 유저 삭제/회원 탈퇴
	@Override
	public int userDelete(UserVO vo) {
		try {
			pstmt = conn.prepareStatement("DELETE FROM user WHERE user_index = ?");
			pstmt.setInt(1, vo.getUser_index());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
		return 0;
	}
}
