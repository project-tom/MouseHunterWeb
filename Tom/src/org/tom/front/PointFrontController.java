/*
 * 		  	FILE : PointFrontController.java
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

import org.tom.controller.CountAddController;
import org.tom.controller.PointAddController;
import org.tom.controller.PointDeleteController;
import org.tom.controller.PointListController;
import org.tom.controller.PointListWebController;
import org.tom.controller.PointModifyController;
import org.tom.forword.Action;
import org.tom.forword.ActionForward;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.po")
public class PointFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PointFrontController() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// URI -> COMMAND 변환 
    	String requestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String command = requestURI.substring(ContextPath.length());

		// 결과 페이지 이동 루틴
		ActionForward actionForward=null;
		Action action = null;

		// COMMAND 별 실행 루틴
		if(command.equals("/PointList.po")) {
			action = new PointListController();
			actionForward = action.execute(request, response);
		}
		if(command.equals("/PointListWeb.po")) {
			action = new PointListWebController();
			actionForward = action.execute(request, response);
		}
		if(command.equals("/PointAdd.po")) {
			action = new PointAddController();
			actionForward = action.execute(request, response);
		}
		
		if(command.equals("/PointModify.po")) {
			action = new PointModifyController();
			actionForward = action.execute(request, response);
		}
		if(command.equals("/PointDelete.po")) {
			action = new PointDeleteController();
			actionForward = action.execute(request, response);
		}
		if(command.equals("/AddCount.po")) {
			action = new CountAddController();
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
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
