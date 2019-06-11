package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.review.ReviewDeleteAction;
import action.review.ReviewListAction;
import action.review.ReviewUpdateAction;
import action.review.ReviewUpdateProAction;
import action.review.ReviewViewAction;
import action.review.ReviewWriteProAction;
import vo.ActionForward;

@WebServlet("*.rv")
public class ReviewFrontController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();

		String command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;
		if (command.equals("/reviewList.rv")) {
			action = new ReviewListAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (command.equals("/reviewWrite.rv")) {
			System.out.println("write");
			forward = new ActionForward();
			forward.setPath("review/review_write.jsp");
		} else if (command.equals("/reviewWritePro.rv")) {
			System.out.println("Controller - reviewWritePro.rv");
			action = new ReviewWriteProAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (command.equals("/reviewView.rv")) {
			action = new ReviewViewAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/fileDown.rv")) {
			forward = new ActionForward();
			forward.setPath("review/file_down.jsp");
		} else if (command.equals("/reviewUpdateForm.rv")) {
			action = new ReviewUpdateAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if (command.equals("/reviewUpdatePro.rv")) {
			action = new ReviewUpdateProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(command.equals("/reviewDelete.rv")) {
			action = new ReviewDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		// -----------review 끝----------------------------- 

		// ----------------------------------------------------------------------------
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
