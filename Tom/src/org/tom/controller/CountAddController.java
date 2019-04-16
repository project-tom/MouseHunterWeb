/*
 * 		  	FILE : CountAddController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 04- 03
 * 		 COMMENT : 포획 수 추가시 컨트롤러
 * 				     포획 수와 해당 쥐덫 인덱스를 인자로 받음
 */

package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.CountVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.CountDAOImpl;

public class CountAddController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// DB에 접근하기 위한 dao 객체 생성
		CountDAOImpl dao = new CountDAOImpl();
		
		// 정보를 담기 위한 vo 객체 생성
		CountVO vo = new CountVO();
		vo.setPoint_index(Integer.parseInt(request.getParameter("point_index")));
		vo.setHunting_count(Integer.parseInt(request.getParameter("hunting_count")));
		
		int result =dao.addCount(vo);
		

		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("forApps/addCountForApp.jsp");
		return actionForward;
	}

}
