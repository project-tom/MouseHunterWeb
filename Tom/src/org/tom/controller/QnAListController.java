package org.tom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.QnAVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.QnADAOImpl;

public class QnAListController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		QnADAOImpl dao = new QnADAOImpl();
		int page = Integer.parseInt(request.getParameter("page"));
		
		int total = dao.totalQnA();
		ArrayList<QnAVO> qnaList =  dao.qnaListPage(page);
		
		request.setAttribute("totalQnA", total);
		request.setAttribute("qnaList", qnaList);
		
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("qna.jsp?page="+page);
		return actionForward;
	}

}
