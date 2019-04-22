/*
 * 		  	FILE : PointListController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 04- 03
 * 		 COMMENT : 유저의 쥐덫 좌표목록을 불러오는 컨트롤러
 * 				     해당 좌표 목록은 결과페이지에서 json 타입으로 변환됨  
 */

package org.tom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.PointVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.PointDAOImpl;

public class PointListWebController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// DB에 접근하기 위한 dao 객체 생성
		PointDAOImpl dao = new PointDAOImpl();
		
		// dao 객체의 getPointList 함수로 좌표 목록을 저장
		ArrayList<PointVO> pointList = dao.getPointList(Integer.parseInt(request.getParameter("user_index")));
		
		// 좌표 목록을 결과 페이지로 전송
		request.setAttribute("pointList", pointList);
		
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("/user/map.jsp");
		return actionForward;
		
	}

}
