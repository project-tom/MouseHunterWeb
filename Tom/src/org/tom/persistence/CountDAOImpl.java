package org.tom.persistence;

import java.util.ArrayList;

import org.tom.domain.CountVO;

public class CountDAOImpl extends DAO implements CountDAO {
	
	public CountDAOImpl() {
		super();
	}
	
	
	// 포획 수 목록 반환
	@Override
	public ArrayList<CountVO> countListRead(int point_index) {
		try {
			pstmt = conn.prepareStatement("SELECT * FROM hunting_count WHERE point_index = ?");
			pstmt.setInt(1, point_index);
			rs = pstmt.executeQuery();
			
			ArrayList<CountVO> list = new ArrayList<CountVO>();
			while(rs.next()) {
				CountVO vo = new CountVO();
				vo.setHunting_count(rs.getInt("hunting_count"));
				vo.setReset_date(rs.getDate("reset_date"));
				vo.setPoint_index(point_index);
				
				list.add(vo);
			}
			
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	
	// 포획 수 반환
	@Override
	public CountVO countRead(int point_index) {
		try {
			pstmt = conn.prepareStatement("SELECT sum(hunting_count) as hunting_count ,max(reset_date) as reset_date FROM hunting_count WHERE point_index = ?");
			pstmt.setInt(1, point_index);
			rs = pstmt.executeQuery();
			
			
			rs.next();
			CountVO vo = new CountVO();
			vo.setHunting_count(rs.getInt("hunting_count"));
			vo.setReset_date(rs.getDate("reset_date"));
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	
	// 포획 수 추가
	@Override
	public int addCount(CountVO vo) {
		try {
			pstmt = conn.prepareStatement("INSERT INTO hunting_count (point_index, hunting_count, reset_date) VALUES (?,?,now())");
			pstmt.setInt(1, vo.getPoint_index());
			pstmt.setInt(2, vo.getHunting_count());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	
	//포획 수 제거
	// 사실 필요 없는 부분이긴 한데 만든게 아까워서 안 지움..
	@Override
	public int deleteCount(CountVO vo) {
		try {
			pstmt = conn.prepareStatement("DELETE FROM hunting_count WHERE point_index = ?");
			pstmt.setInt(1, vo.getPoint_index());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}


}
