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

import org.tom.controller.QnAListController;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;



@WebServlet("*.qna")
public class QnAFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public QnAFrontController() {
        super();
    }

    
    
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String command = requestURI.substring(ContextPath.length());
		
		ActionForward actionForward=null;
		Action action = null;
		
		if(command.equals("/QnAList.qna")) {
			action = new QnAListController();
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
