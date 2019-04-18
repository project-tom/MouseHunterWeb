package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.QnAVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.QnADAOImpl;

public class QnADeleteController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		QnADAOImpl dao = new QnADAOImpl();
		QnAVO vo = new QnAVO();
		int page = Integer.parseInt(request.getParameter("page"));
		vo.setQna_index(Integer.parseInt(request.getParameter("index")));
		
		boolean result = dao.qnaDelete(vo);

		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("QnAList.qna?page="+page);
		return actionForward;
	}
}
