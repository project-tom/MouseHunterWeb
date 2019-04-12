/*
 * 		  	FILE : PointAddController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 04- 03
 * 		 COMMENT : 좌표 저장 컨트롤러
 * 				     사용자의 유저번호와 좌표의 이름, 주소 , 위/경도, 블루투스 주소를 인자로 받음
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

public class PointAddController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// DB에 접근하기 위한 dao 객체 생성
		PointDAOImpl dao = new PointDAOImpl();
		
		// 좌표 정보를 담기 위한 vo 객체 생성
		PointVO vo = new PointVO();
		
		// vo 객체에 값 전달
		vo.setUser_index(Integer.parseInt(request.getParameter("user_index")));
		vo.setPoint_name(request.getParameter("point_name"));
		vo.setPoint_address(request.getParameter("point_address"));
		vo.setPoint_latitude(Double.parseDouble(request.getParameter("point_latitude")));
		vo.setPoint_longitude(Double.parseDouble(request.getParameter("point_longitude")));
		
		// 블루투스 주소의 경우 연결된 경우만 추가
		if(!request.getParameter("bluetooth_address").equals("")) {
			vo.setBluetooth_address(request.getParameter("bluetooth_address"));
		}
		// 시연중엔 블루투스가 1대 뿐이라 생략하지만 실제 서비스 시에는 블루투스가 연결 안된경우 좌표 추가 안되게 설정해야함
		// else{ 연결이 안된경우 }
		
		boolean result = dao.addPoint(vo);
		
		request.setAttribute("result", result);
		
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("pointAddResultForApp.jsp");
		return actionForward;
	}

}
