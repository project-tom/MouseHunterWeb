/*
 * 		  	FILE : UserFrontController.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 03- 27
 * 		 COMMENT : 
 */


package org.tom.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tom.controller.UserCheckIDController;
import org.tom.controller.UserSignInController;
import org.tom.controller.UserSignUpController;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;



/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.user")
public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    
    //
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// URI -> COMMAND 변환 
    	String requestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String command = requestURI.substring(ContextPath.length());
		
		// 결과 페이지 이동 루틴
		ActionForward actionForward=null;
		Action action = null;
		
		
		// COMMAND 별 실행 루틴
		if(command.equals("/SignUp.user")) {
			action = new UserSignUpController();
			actionForward = action.execute(request, response);
		}
		if(command.equals("/SignIn.user")) {
			action = new UserSignInController();
			actionForward = action.execute(request, response);
		}
		if(command.equals("/IDCheck.user")) {
			action = new UserCheckIDController();
			actionForward = action.execute(request, response);
		}
		
		
		if(actionForward!=null) {
			if(actionForward.isRedirect()) {
				response.sendRedirect(actionForward.getURI());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(actionForward.getURI());
				dispatcher.forward(request, response);
				
			}
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
