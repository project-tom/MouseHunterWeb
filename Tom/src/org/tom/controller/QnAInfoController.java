package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.QnAVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.QnADAOImpl;

public class QnAInfoController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		QnADAOImpl dao = new QnADAOImpl();
		int page = Integer.parseInt(request.getParameter("page"));
		
		QnAVO info = dao.qnaInfo(Integer.parseInt(request.getParameter("qna_index")));
		
		request.setAttribute("info", info);
		
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("qna/qnaRead.jsp?page="+page);
		return actionForward;
	}
}
