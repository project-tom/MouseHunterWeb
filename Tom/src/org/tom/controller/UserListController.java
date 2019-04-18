package org.tom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.UserVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.UserDAOImpl;

public class UserListController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		UserDAOImpl dao = new UserDAOImpl();
		int total = dao.totalUser();
		int page = Integer.parseInt(request.getParameter("page"));
		dao = new UserDAOImpl();
		ArrayList<UserVO> userList = dao.userInfoList(); 
		
		request.setAttribute("totalUser", total);
		request.setAttribute("userList", userList);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("admin/memberSearch.jsp?page="+page);
		
		return actionForward;
	}

}
