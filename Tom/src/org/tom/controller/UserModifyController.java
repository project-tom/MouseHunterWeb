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

public class UserModifyController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		UserDAOImpl dao = new UserDAOImpl();
		UserVO vo = new UserVO();
		
		// 생일을 저장하기 위한 date 객체 선언
		Date date =null;
		// date에 값을 저장하기 위한 포맷터
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
		// 휴대폰 번호를 저장하기 위한 변수
		// 휴대폰 번호는 3개의 텍스트를 합쳐서 생성
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");				
				
		try {
			
			String birth =  request.getParameter("year")+"-"+	
							request.getParameter("month")+"-"+
							request.getParameter("day");
					
			date= format.parse(birth);
			
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
		
		boolean result = dao.userInfoModify(vo);
		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("");
		
		return actionForward;
	}

}
