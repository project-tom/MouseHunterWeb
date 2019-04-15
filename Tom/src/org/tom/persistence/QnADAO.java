package org.tom.persistence;

import java.util.ArrayList;

import org.tom.domain.QnAVO;

public interface QnADAO {
	public ArrayList<QnAVO> qnaList();
	public boolean qnaAdd(QnAVO vo);
	public boolean qnaModify(QnAVO vo);
	public boolean qnaDelete(QnAVO vo);
	public QnAVO qnaInfo(int qna_index);
}
