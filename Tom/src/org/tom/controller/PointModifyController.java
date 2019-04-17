/*
 * 		  	FILE : PointModifyController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 04- 03
 * 		 COMMENT : 좌표 수정을 위한 컨트롤러
 * 			 	     수정된 좌표의 정보를 인자로 받음
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

public class PointModifyController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		// DB에 접근하기 위한 dao 객체 생성
		PointDAOImpl dao = new PointDAOImpl();
		
		// 정보를 담기 위한 vo 객체 생성
		PointVO vo = new PointVO();
		vo.setPoint_index(Integer.parseInt(request.getParameter("point_index")));
		vo.setPoint_name(request.getParameter("point_name"));
		vo.setPoint_address(request.getParameter("point_address"));
		vo.setPoint_latitude(Double.parseDouble(request.getParameter("point_latitude")));
		vo.setPoint_longitude(Double.parseDouble(request.getParameter("point_longitude")));

		// dao 의 출력 결과를 result에 저장
		// modifyPoint의 반환형은 int로 수정된 행의 수를 반환
		boolean result = dao.modifyPoint(vo);
		
		request.setAttribute("result", result);
		
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("forApps/pointUpdateResultForApp.jsp");
		return actionForward;
	}

}
