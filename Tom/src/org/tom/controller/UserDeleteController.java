package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.UserVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.UserDAOImpl;

public class UserDeleteController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		UserDAOImpl dao = new UserDAOImpl();
		int page = Integer.parseInt(request.getParameter("page"));
		UserVO vo = new UserVO();
		vo.setUser_id(request.getParameter("user_id"));
		
		boolean result = dao.userDelete(vo);
		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("UserList.user?page="+page);
		
		return actionForward;
	}

}
