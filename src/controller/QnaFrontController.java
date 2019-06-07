package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.NoticeListAction;
import action.qna.QnaCommentProAction;
import action.qna.QnaDeleteProAction;
import action.qna.QnaDetailAction;
import action.qna.QnaListAction;
import action.qna.QnaModifyFormAction;
import action.qna.QnaModifyProAction;
import action.qna.QnaWriteProAction;
import action.qna.qnaWriteAction;
import vo.ActionForward;
import vo.MemberBean;

@WebServlet("*.bo")
public class QnaFrontController extends HttpServlet {
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
		System.out.println(requestURI);
		System.out.println(contextPath);
		System.out.println(command);
		if (command.equals("/qnaList.bo")) {
			action = new QnaListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qnaWrite.bo")) {
			/*
			 * forward = new ActionForward(); forward.setPath("/center/qna/qna_Write.jsp");
			 */
			HttpSession session = request.getSession();
			MemberBean memberBean = (MemberBean) session.getAttribute("memberBean");
			if (memberBean==null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");// 자바스크립트 시작 태그
				out.println("alert('로그인이 필요합니다.')");// 오류 메세지 다이얼로그 표시
				out.println("history.back()");// 이전 페이지로 돌아가기
				out.println("</script>");// 자바스크립트 종료 태그
			}
			action = new qnaWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qnaWriteForm.bo")) {
			forward = new ActionForward();
			forward.setPath("/center/qna/qna_Write.jsp");

		} else if (command.equals("/qnaWritePro.bo")) {
			action = new QnaWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/qnaDetail.bo")) {
			System.out.println("/qnaDetail.bo에 왔다!");
			action = new QnaDetailAction();
			System.out.println("QnaDetailAction()을 성공했다!");
			try {
				System.out.println("FrontController page : " + request.getParameter("page"));
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/qnaModifyForm.bo")) {
			System.out.println("qnaModifyForm.bo 에 왔다!");
			HttpSession session = request.getSession();
			MemberBean memberBean = (MemberBean) session.getAttribute("memberBean");
			if (memberBean==null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");// 자바스크립트 시작 태그
				out.println("alert('로그인이 필요합니다.')");// 오류 메세지 다이얼로그 표시
				out.println("history.back()");// 이전 페이지로 돌아가기
				out.println("</script>");// 자바스크립트 종료 태그
			}
			action = new QnaModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qnaModifyPro.bo")) {
			System.out.println("qnaModifyPro.bo 에 왔다!");
			action = new QnaModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/qnaDeleteForm.bo")) {
			System.out.println("qnaDeleteForm.bo 에 왔다!");
			HttpSession session = request.getSession();
			MemberBean memberBean = (MemberBean) session.getAttribute("memberBean");
			if (memberBean==null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");// 자바스크립트 시작 태그
				out.println("alert('로그인이 필요합니다.')");// 오류 메세지 다이얼로그 표시
				out.println("history.back()");// 이전 페이지로 돌아가기
				out.println("</script>");// 자바스크립트 종료 태그
			}
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			System.out.println("qnaDeleteForm - board_num : " + board_num);
			request.setAttribute("board_num", board_num);
			request.setAttribute("page", request.getParameter("page"));
			forward = new ActionForward();
			forward.setPath("/center/qna/qna_Delete.jsp");
		} else if (command.equals("/qnaDeletePro.bo")) {
			System.out.println("qnaDeletePro.bo에 왔다!");
			action = new QnaDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qnaCommentPro.bo")) {
			System.out.println("qnaCommentPro.bo에 왔다!");
			String comment_content = request.getParameter("comment_content");
			System.out.println("q");
			String board_num = (String) request.getParameter("board_num");
			System.out.println("w");
			System.out.println("qnaCommentPro - board_num : " + board_num);
			request.setAttribute("board_num", board_num);
			System.out.println("e");
			request.setAttribute("comment_content", comment_content);
			System.out.println("r");
			action = new QnaCommentProAction();
			System.out.println("t");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// -----------qna 끝 --------------------------------

		// -----------notice 시작 ----------------------------
		else if (command.equals("/noticeList.bo")) {
			action = new NoticeListAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		// -----------notice 끝 ----------------------------

		// -----------faq 시작---------------------------------
		else if (command.equals("/faq.bo")) {
			forward = new ActionForward();
			forward.setPath("center/faq/faq.jsp");
		}
		// -----------faq 끝 ----------------------------------

		// ------------------------------------------------------------------------------
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
