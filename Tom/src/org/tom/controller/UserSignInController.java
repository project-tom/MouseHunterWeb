/*
 * 		  	FILE : UserSignInController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 04- 03
 * 		 COMMENT : 로그인 컨트롤러
 * 				로그인시 ID 와 PASSWORD 를 체크하며 ID 와 PASSWORD가 DB의 정보와 같으면 true 반환
 * 				이때 결과값이 true면 해당 유저의 유저번호도 같이 전송한다.
 */

package org.tom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.com.encryption.PasswordEncryption;
import org.tom.domain.UserVO;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.UserDAOImpl;

public class UserSignInController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// DB에 접근하기 위한 dao 객체 생성
		UserDAOImpl dao = new UserDAOImpl();

		// dao에 값을 전달하기 위한 vo 객체 생성
		UserVO vo = new UserVO();
		vo.setUser_id(request.getParameter("user_id"));
		if(request.getParameter("fromWeb").equals("true")){
			vo.setUser_pw(new PasswordEncryption(request.getParameter("user_pw")).getPass());
		}else {
			vo.setUser_pw(request.getParameter("user_pw"));
		}
		// dao 의 출력 결과를 result에 저장
		// userSignIn의 반환형은 boolean으로 id와 pw 가 DB의 정보와 일치하면 true, 아니면 false를 반환한다.
		boolean result= dao.userSignIn(vo);
		if(result) {
			// 로그인이 성공할시 해당 유저의 사용자 번호도 전달한다.
			request.setAttribute("user_index_temp", new UserDAOImpl().userIndexReturn(vo));
			if(request.getParameter("user_id").equals("admin")) {
				request.setAttribute("admin", "true");
			}
		}else {
			request.setAttribute("user_index_temp", "");
		}
		
		
		
		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		if(request.getParameter("fromWeb").equals("true")) {
			actionForward.setURI("/user/signInTemp.jsp");
		}else {
			actionForward.setURI("/forApps/SignInResultForApp.jsp");
		}
		
		
		return actionForward;
	}

}
