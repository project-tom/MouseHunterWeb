package org.tom.persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.tom.domain.QnAVO;

public class QnADAOImpl extends DAO implements QnADAO {
	static Logger logger = Logger.getLogger(QnADAOImpl.class);
	public QnADAOImpl() {
		super();
	}
	
	public ArrayList<QnAVO> qnaSearchListPage(int page,String search_criteria,String search) {
		try {
			
			if(search_criteria.equals("qna_title")) {
				pstmt = conn.prepareStatement("SELECT * FROM qna WHERE qna_title like '%"+search+"%' ORDER BY qna_parentnum desc,qna_answer asc LIMIT ?,?");
				logger.debug("[search_criteria] : Title");
			}else {
				pstmt = conn.prepareStatement("SELECT * FROM qna WHERE qna_author like '%"+search+"%' ORDER BY qna_parentnum desc,qna_answer asc LIMIT ?,?");
				logger.debug("[search_criteria] : Author");
			}
			pstmt.setInt(1, (page-1)*10);
			pstmt.setInt(2, 10);
			
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
			logger.debug("[List Load...] : Success");
			return list;
		}catch (SQLException e) {
			e.printStackTrace();
			logger.warn("[List Load...] : Fail");
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}
	
	public ArrayList<QnAVO> qnaListPage(int page) {
		try {
			pstmt = conn.prepareStatement("SELECT * FROM qna ORDER BY qna_parentnum desc,qna_answer asc LIMIT ?,?");
			pstmt.setInt(1, (page-1)*10);
			pstmt.setInt(2, 10);
			
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
			logger.debug("[List Load...] : Success");
			return list;
		}catch (SQLException e) {
			e.printStackTrace();
			logger.warn("[List Load...] : Fail");
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}
		
	public int totalQnA() {
		try {
			pstmt = conn.prepareStatement("SELECT count(*) AS count FROM qna");
			rs = pstmt.executeQuery();
			rs.next();
			
			int total = rs.getInt("count");
			
			logger.debug("[Total QnA] : "+total);
			return total;
			
		}catch (SQLException e) {
			e.printStackTrace();
			logger.warn("[Total Check] : Fail");
			return 0;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
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
			pstmt = conn.prepareStatement("INSERT INTO qna(qna_index, qna_title, qna_content, qna_author, qna_date, qna_pass,qna_parentnum, qna_answer) VALUES (?,?,?,?,now(),?,?,?)");
			pstmt.setInt(1, vo.getQna_index());
			pstmt.setString(2, vo.getQna_title());
			logger.debug(vo.getQna_title());
			pstmt.setString(3, vo.getQna_content());
			pstmt.setString(4, vo.getQna_author());
			pstmt.setString(5, vo.getQna_pass());
			pstmt.setInt(6, vo.getQna_parentnum());
			pstmt.setInt(7, vo.getQna_answer());
			
			pstmt.executeUpdate();
			
			logger.debug("[QnA Add...] : Success");
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
			logger.warn("[QnA Add...] : Fail");
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
			pstmt = conn.prepareStatement("UPDATE qna SET qna_title = ?, qna_content = ? WHERE qna_index = ?");
			pstmt.setString(1, vo.getQna_title());
			pstmt.setString(2, vo.getQna_content());
			pstmt.setInt(3,vo.getQna_index());
			pstmt.executeUpdate();
			logger.debug("[QnA Modify...] : Success");
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
			logger.warn("[QnA Modify...] : Fail");
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
			logger.debug("[QnA Delete...] : Success");
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
			logger.warn("[QnA Delete...] : Fail");
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
			logger.debug("[QnA Info Load...] : Success");
			return vo;
		}catch (SQLException e) {
			e.printStackTrace();
			logger.debug("[QnA Info Load...] : Fail");
			return null;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}
	
	public int getLastIndex() {
		try {
			pstmt = conn.prepareStatement("SELECT max(qna_index) as i FROM qna");
			rs = pstmt.executeQuery();
			rs.next();
			int index = rs.getInt("i");
			logger.debug("[QnA Last Index] : "+index);
			return index;
		}catch (SQLException e) {
			e.printStackTrace();
			logger.warn("[QnA Last Index Load] : Fail");
			return 0;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}
	
	public boolean answer(int qna_index) {
		try {
			pstmt = conn.prepareStatement("SELECT count(*) AS count FROM qna WHERE qna_parentnum = (SELECT qna_parentnum FROM qna WHERE qna_index = ?)");
			pstmt.setInt(1, qna_index);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1) == 2) {
					logger.debug("exist");
					return true; 
				}
			}
			
			return false;
		}catch (SQLException e) {
			e.printStackTrace();
			logger.warn("[QnA Last Index Load] : Fail");
			return false;
		}finally {
			try {
				close();
			} catch (Exception e) {}
		}
	}

}
