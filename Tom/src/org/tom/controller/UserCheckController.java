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

import org.tom.domain.UserVO;
import org.tom.encryption.PasswordEncryption;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;
import org.tom.persistence.UserDAOImpl;

public class UserCheckController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserDAOImpl dao = new UserDAOImpl();

		UserVO vo = new UserVO();
		vo.setUser_id(request.getParameter("user_id"));
		vo.setUser_pw(new PasswordEncryption(request.getParameter("user_pw")).getPass());
		
		boolean result= dao.userSignIn(vo);
		
		request.setAttribute("result", result);
		ActionForward actionForward = new ActionForward();
		actionForward.setRedirect(false);
		
		if(result) {
			if(request.getParameter("flag").equals("Modify")) {
				actionForward.setURI("/user/signUpdate.jsp");
			}else if(request.getParameter("flag").equals("Withdrawal")){
				dao = new UserDAOImpl();
				result = dao.userDelete(vo);
				actionForward.setURI("/user/userWithdrawalResult.jsp");
			}
		}else {
			actionForward.setURI("/user/signIn.jsp");
		}
		
		
		return actionForward;
	}

}
