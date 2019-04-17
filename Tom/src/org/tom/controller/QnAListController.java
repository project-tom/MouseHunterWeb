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
		int total = dao.totalQnA();
		int page = Integer.parseInt(request.getParameter("page"));
		ArrayList<QnAVO> qnaList;
		String uri;
		
		if(request.getParameter("search") == null) {
			dao = new QnADAOImpl();
			qnaList = dao.qnaListPage(page);
			uri="qna/qna.jsp?page=";
		}else {
			System.out.println(request.getParameter("search"));
			dao = new QnADAOImpl();
			String search_criteria = request.getParameter("search_criteria");
			qnaList = dao.qnaSearchListPage(page,search_criteria,request.getParameter("search"));
			uri="qna/qnaSearch.jsp?search="+request.getParameter("search")+"&page=";
		}
		
		System.out.println(uri);
		request.setAttribute("totalQnA", total);
		request.setAttribute("qnaList", qnaList);
		
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI(uri+page);
		return actionForward;
	}

}
