package action.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.QnaCommentProService;
import vo.ActionForward;
import vo.BoardBean;
import vo.CommentBean;

public class QnaCommentProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		CommentBean comment = new CommentBean();
		System.out.println("1");
		HttpSession session = request.getSession();
		System.out.println("2");
		String email = (String) session.getAttribute("email");
		System.out.println("3");
		System.out.println("QnaCommentProAction - board_num Attri : "+request.getAttribute("board_num"));
		System.out.println("QnaCommentProAction - board_num para : "+request.getParameter("board_num"));
		System.out.println("QnaCommentProAction - int attri : "+Integer.parseInt(request.getAttribute("board_num").toString()));
		comment.setBoard_no(Integer.parseInt(request.getAttribute("board_num").toString()));
//		comment.setNo((int)request.getAttribute("board_num"));
		System.out.println("4");
		comment.setContent(request.getParameter("comment_content"));
		System.out.println("5");
		
		QnaCommentProService qnaCommentProService = new QnaCommentProService();
		System.out.println("6");
		boolean isWriteSuccess = qnaCommentProService.registComment(comment,email);
		System.out.println("7");
		if(!isWriteSuccess) {
			System.out.println("8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('코멘트 등록 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			System.out.println("9");
			// true 이면 ActionForward 객체를 사용하여 이동
			// => ActionForward 객체 생성, boardList.bo 서블릿주소 지정, isRedirect 변수 값을 true 로 설정
			// => boardList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
			forward = new ActionForward();
			forward.setPath("qnaDetail.bo?board_num="+comment.getBoard_no()+"&page=1");
			forward.setRedirect(true);
		}
		return forward;
	}

}
