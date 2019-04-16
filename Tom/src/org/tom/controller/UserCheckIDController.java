/*
 * 		  	FILE : UserCheckIDController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 04- 03
 * 		 COMMENT : ID 중복체크 컨트롤러
 * 				   ID가 중복일 경우 false 아닐경우 true 를 반환  
 */

package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.UserVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.UserDAOImpl;

public class UserCheckIDController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// DB에 접근하기 위한 dao 객체 생성
		UserDAOImpl dao = new UserDAOImpl();
		
		// dao에 값을 전달하기 위한 vo 객체 생성
		UserVO vo = new UserVO();
		vo.setUser_id(request.getParameter("id"));
		
		// dao 의 출력 결과를 result에 저장
		// userCheckID의 반환형은 boolean으로 중복된 행이 없으면 true, 있으면 false를 반환한다.
		boolean result = dao.userCheckID(vo);
		request.setAttribute("result", result);
		
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("forApps/IDCheckResultForApp.jsp");
		
		return actionForward;
	}

}
