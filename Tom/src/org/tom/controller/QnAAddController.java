package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.com.encryption.PasswordEncryption;
import org.tom.domain.QnAVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.QnADAOImpl;


public class QnAAddController implements Action {
	static Logger logger = Logger.getLogger(QnAAddController.class);
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		QnADAOImpl dao = new QnADAOImpl();
		QnAVO vo = new QnAVO();
		
		int index = dao.getLastIndex();
		int page = Integer.parseInt(request.getParameter("page"));
		vo.setQna_index(index+1);
		vo.setQna_title(request.getParameter("qna_title"));
		
		logger.debug("title is : " + request.getParameter("qna_title"));
		String content = new String();
		if(request.getParameter("question") != null) {
			content = request.getParameter("question")+
					"[---]"+
					request.getParameter("qna_content");
		}else {
			content = request.getParameter("qna_content");
		}
		
		vo.setQna_content(content);
		vo.setQna_author(request.getParameter("qna_author"));
		vo.setQna_pass(new PasswordEncryption(request.getParameter("qna_pass")).getPass());
		if(request.getParameter("isAdmin").equals("true")) {
			vo.setQna_answer(1);
			vo.setQna_parentnum(Integer.parseInt(request.getParameter("qna_index")));
		}else {
			vo.setQna_answer(0);
			vo.setQna_parentnum(index+1);
		}
		dao = new QnADAOImpl();
		boolean result = dao.qnaAdd(vo);
		
		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("QnAList.qna?page="+page);
		return actionForward;
	}
}
