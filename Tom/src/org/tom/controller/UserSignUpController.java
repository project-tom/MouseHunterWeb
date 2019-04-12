/*
 * 		  	FILE : UserSignUpController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 04- 03
 * 		 COMMENT : 
 */



package org.tom.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.domain.UserVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.UserDAOImpl;

public class UserSignUpController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// DB에 접근하기 위한 dao 객체 생성
		UserDAOImpl dao = new UserDAOImpl();
		
		// dao에 값을 전달하기 위한 vo 객체 생성
		UserVO vo = new UserVO();
		
		// 생일을 저장하기 위한 date 객체 선언
		Date date =null;
		// date에 값을 저장하기 위한 포맷터
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		// 휴대폰 번호를 저장하기 위한 변수
		// 휴대폰 번호는 3개의 텍스트를 합쳐서 생성
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		
		
		try {
			// 앱에서 오지 않았을 경우 실행
			// 앱의 경우 dialog 문제로 생일 지정을 위한 프래그먼트 생성이 너무 오래 걸려서 제거함
			if(request.getParameter("fromApp").equals("false")){
				String birth =  request.getParameter("year")+"-"+	
								request.getParameter("month")+"-"+
								request.getParameter("day");
				
				date= format.parse(birth);
			}
			vo.setUser_id(request.getParameter("id"));
			vo.setUser_pw(request.getParameter("pw"));
			vo.setUser_name(request.getParameter("name"));
			vo.setUser_email(request.getParameter("email"));
			vo.setUser_birth(date);
			vo.setUser_gender(request.getParameter("gender"));
			vo.setUser_phone(phone);
			vo.setUser_address(request.getParameter("address"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// dao 의 출력 결과를 result에 저장
		// userAdd의 반환형은 boolean으로 행 삽입이 성공하면 true, 실패하면 false를 반환한다.
		boolean result = dao.userAdd(vo);
		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("SignUpResultForApp.jsp");
		
		return actionForward;
	}
	
}
