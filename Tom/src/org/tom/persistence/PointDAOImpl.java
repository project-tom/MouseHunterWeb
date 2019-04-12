/*
 * 		  	FILE : PointDAOImpl.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 03- 27
 * 		 COMMENT : 
 */

package org.tom.persistence;

import java.sql.*;
import java.util.ArrayList;

import org.tom.domain.CountVO;
import org.tom.domain.PointVO;

public class PointDAOImpl extends DAO implements PointDAO{
	
	
	public PointDAOImpl() {
		super();
	}
	
	// 좌표 목록 조회
	@Override
	public ArrayList<PointVO> getPointList(int user_index){
		try {
			pstmt = conn.prepareStatement("SELECT * FROM point WHERE user_index = ?");
			pstmt.setInt(1, user_index);
			ArrayList<PointVO> pointList = new ArrayList<PointVO>();
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PointVO vo = new PointVO();
				vo.setPoint_index(rs.getInt("point_index"));
				vo.setPoint_name(rs.getString("point_name"));
				vo.setPoint_longitude(rs.getDouble("point_longitude"));
				vo.setPoint_latitude(rs.getDouble("point_latitude"));
				vo.setPoint_address(rs.getString("point_address"));
				vo.setBluetooth_address(rs.getString("bluetooth_address"));
				CountDAOImpl dao = new CountDAOImpl();
				CountVO countVO = dao.countRead(rs.getInt("point_index"));
				System.out.println(countVO.getHunting_count());
				
				if(countVO.getHunting_count()!= 0 && countVO.getReset_date() !=null) {
					System.out.println(countVO.getReset_date());
					vo.setHunting_count(countVO.getHunting_count());
					vo.setReset_date(countVO.getReset_date());
				}else {
					vo.setHunting_count(0);
					vo.setReset_date(null);
				}
				
				
				pointList.add(vo);
			}
			
			return pointList;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	
	// 좌표 추가
	@Override
	public boolean addPoint(PointVO vo) {
		try {
			pstmt = conn.prepareStatement("INSERT INTO point(user_index, point_name, point_latitude, point_longitude, point_address,bluetooth_address) VALUES (?,?,?,?,?,?)");
			pstmt.setInt(1, vo.getUser_index());
			pstmt.setString(2, vo.getPoint_name());
			pstmt.setDouble(3, vo.getPoint_latitude());
			pstmt.setDouble(4, vo.getPoint_longitude());
			pstmt.setString(5, vo.getPoint_address());
			pstmt.setString(6, vo.getBluetooth_address());
			return true;
						
						
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}


	// 좌표 정보 수정
	@Override
	public boolean modifyPoint(PointVO vo) {
		try {
			pstmt = conn.prepareStatement("UPDATE point SET point_name = ?, point_address = ?, point_latitude = ?, point_longitude = ? WHERE point_index = ?");
			pstmt.setString(1, vo.getPoint_name());
			pstmt.setString(2, vo.getPoint_address());
			pstmt.setDouble(3, vo.getPoint_latitude());
			pstmt.setDouble(4, vo.getPoint_longitude());
			pstmt.setInt(5, vo.getPoint_index());
			pstmt.executeUpdate();
			return true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	// 좌표 제거
	@Override
	public boolean deletePoint(PointVO vo) {
		try {
			pstmt = conn.prepareStatement("DELETE FROM point WHERE point_index = ?");
			pstmt.setInt(1, vo.getPoint_index());
			
			return true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}
}
