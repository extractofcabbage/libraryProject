package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.review.ReviewDeleteService;
import svc.review.ReviewUpdateProService;
import vo.ActionForward;
import action.Action;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		
		// 게시물 번호 파라미터 가져오기
		int no = Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		// NoticeDeleteAction 객체 생성 후 isArticleWriter() 메서드를 호출하여 본인 확인(파라미터로 글번호, 입력받은 패스워드 전달)
		ReviewUpdateProService reviewUpdateProService = new ReviewUpdateProService();
		boolean isUser = reviewUpdateProService.isArticleWriter(no,email);
		ReviewDeleteService reviewDeleteService = new ReviewDeleteService();
		// 본인 확인 결과 판별
		if(!isUser) {
			// 본인이 아닐 경우 자바스크립트를 사용하여 "삭제할 권한이 없습니다." 출력 후 이전 페이지
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('삭제할 권한이 없습니다.')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			// 본인일 경우 NoticeDeleteAction 클래스의 removeArticle() 메서드를 호출하여 글 삭제 수행(매개변수로 글번호 전달) - boolean 타입 리턴
			boolean isDeleteSuccess = reviewDeleteService.removeArticle(no);
			
			// 글 삭제 여부 판별
			if(!isDeleteSuccess) {
				// 실패 시 자바스크립트 - "삭제실패!" 출력
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('삭제실패!')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>"); // 자바스크립트 종료 태그
			} else {
				// 성공 시 ActionForward 객체 생성, "boardList.bo" 로 포워딩 시 파라미터로 page(form 태그 hidden 으로 전달된 파라미터) 전달
				forward = new ActionForward();
				forward.setPath("reviewList.rv?&page=1");
				forward.setRedirect(true); // Redirect 방식
			}
			
		}
		
		return forward;
	}

}
