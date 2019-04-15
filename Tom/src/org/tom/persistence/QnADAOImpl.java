package org.tom.persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import org.tom.domain.QnAVO;

public class QnADAOImpl extends DAO implements QnADAO {

	public QnADAOImpl() {
		super();
	}
	
	@Override
	public ArrayList<QnAVO> qnaList() {
		try {
			pstmt = conn.prepareStatement("SELECT * FROM qna");
			
			rs = pstmt.executeQuery();
			ArrayList<QnAVO> list = new ArrayList<>();
			while(rs.next()) {
				QnAVO vo = new QnAVO();
				vo.setQna_index(rs.getInt("qna_index"));
				vo.setQna_title(rs.getString("qna_title"));
				vo.setQna_content(rs.getString("qna_content"));
				vo.setQna_author(rs.getString("qna_author"));
				vo.setQna_date(rs.getDate("qna_date"));
				vo.setQna_pass(rs.getString("qna_pass"));
				vo.setQna_parentnum(rs.getInt("qna_parentnum"));
				vo.setQna_readcount(rs.getInt("qna_readcount"));
				vo.setQna_answer(rs.getInt("qna_answer"));
				
				list.add(vo);
			}
			
			return list;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	@Override
	public boolean qnaAdd(QnAVO vo) {
		try {
			pstmt = conn.prepareStatement("INSERT INTO qna(qna_index,qna_title, qna_content, qna_author, qna_date, qna_pass,qna_parentnum, qna_answer) VALUES (?,?,?,?,now(),?,?,?)");
			pstmt.setInt(1, vo.getQna_index());
			pstmt.setString(2, vo.getQna_title());
			pstmt.setString(3, vo.getQna_content());
			pstmt.setString(4, vo.getQna_author());
			pstmt.setString(5, vo.getQna_pass());
			pstmt.setInt(6, vo.getQna_parentnum());
			pstmt.setInt(7, vo.getQna_answer());
			
			pstmt.executeUpdate();
			
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	@Override
	public boolean qnaModify(QnAVO vo) {
		try {
			pstmt = conn.prepareStatement("UPDATE qna SET qna_title = ?, qna_content = ?");
			pstmt.setString(1, vo.getQna_title());
			pstmt.setString(2, vo.getQna_content());
			pstmt.executeUpdate();
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	@Override
	public boolean qnaDelete(QnAVO vo) {
		try {
			pstmt = conn.prepareStatement("DELETE FROM qna WHERE qna_index = ?");
			pstmt.setInt(1, vo.getQna_index());
			pstmt.executeUpdate();
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

	@Override
	public QnAVO qnaInfo(int qna_index) {
		try {
			pstmt = conn.prepareStatement("SELECT * FROM qna WHERE qna_index = ?");
			pstmt.setInt(1, qna_index);
			
			rs = pstmt.executeQuery();

			QnAVO vo = new QnAVO();
			if(rs.next()){
				vo.setQna_index(rs.getInt("qna_index"));
				vo.setQna_title(rs.getString("qna_title"));
				vo.setQna_content(rs.getString("qna_content"));
				vo.setQna_author(rs.getString("qna_author"));
				vo.setQna_date(rs.getDate("qna_date"));
				vo.setQna_pass(rs.getString("qna_pass"));
				vo.setQna_parentnum(rs.getInt("qna_parentnum"));
				vo.setQna_readcount(rs.getInt("qna_readcount"));
				vo.setQna_answer(rs.getInt("qna_answer"));
			}
			return vo;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}
	
	public int getLastIndex() {
		try {
			pstmt = conn.prepareStatement("SELECT max(*) as index FROM qna");
			rs = pstmt.executeQuery();
			rs.next();
			
			return rs.getInt("index");
		}catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

}
