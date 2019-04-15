package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.QnAVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.QnADAOImpl;

public class QnAModifyController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		QnADAOImpl dao = new QnADAOImpl();
		QnAVO vo = new QnAVO();
		
		vo.setQna_title(request.getParameter("qna_title"));
		vo.setQna_content(request.getParameter("qna_content"));
		
		
		
		boolean result = dao.qnaModify(vo);

		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("");
		return actionForward;
	}
}
