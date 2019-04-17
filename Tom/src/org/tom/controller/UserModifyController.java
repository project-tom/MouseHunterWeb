package org.tom.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.com.encryption.PasswordEncryption;
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
			
			vo.setUser_id(request.getParameter("user_id"));
			vo.setUser_pw(new PasswordEncryption(request.getParameter("user_pw")).getPass());
			vo.setUser_name(request.getParameter("user_name"));
			vo.setUser_email(request.getParameter("user_email"));
			vo.setUser_birth(date);
			vo.setUser_phone(phone);
			vo.setUser_address(request.getParameter("user_address"));
			vo.setUser_index(Integer.parseInt(request.getParameter("user_index")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean result = dao.userInfoModify(vo);
		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		actionForward.setURI("user/signIn.jsp");
		
		return actionForward;
	}

}
