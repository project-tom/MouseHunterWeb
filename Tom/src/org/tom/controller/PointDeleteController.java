/*
 * 		  	FILE : PointDeleteController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 04- 03
 * 		 COMMENT : 좌표 제거시 컨트롤러
 * 				     해당 쥐덫의 인덱스를 이용해서 삭제 
 */

package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.PointVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.PointDAOImpl;

public class PointDeleteController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// DB에 접근하기 위한 dao 객체 생성
		PointDAOImpl dao = new PointDAOImpl();
		
		// dao에 값을 전달하기 위한 vo 객체 생성
		PointVO vo = new PointVO();
		
		// vo 객체에 앱에서 넘어온 index 값 저장
		vo.setPoint_index(Integer.parseInt(request.getParameter("point_index")));

		// dao 의 출력 결과를 result에 저장
		// deletePoint의 반환형은 int로 제거된 행의 수를 반환
		boolean result = dao.deletePoint(vo);
		
		
		request.setAttribute("result", result);
		
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("pointUpdateResultForApp.jsp");
		return actionForward;
	
	}

}
