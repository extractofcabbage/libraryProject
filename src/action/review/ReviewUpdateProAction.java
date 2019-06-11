package action.review;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.review.ReviewUpdateProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		
		String realFolder = "";
		String saveFolder = "/reviewUpload";
		int fileSize = 5 * 1024 * 1024;
		
		ServletContext context = request.getServletContext(); // 현재 서블릿 컨텍스트 객체 얻어오기
		realFolder = context.getRealPath(saveFolder); // 가상의 경로에 해당하는 실제 경로 얻어오기
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		int no = Integer.parseInt(multi.getParameter("no"));
		
		System.out.println(no);
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		ReviewUpdateProService reviewUpdateProService = new ReviewUpdateProService();
		boolean isUser = reviewUpdateProService.isArticleWriter(no,email);
		if(!isUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('수정할 권한이 없습니다.')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); 
		} else {
			ReviewBean boardBean = new ReviewBean();
			
			boardBean.setNo(no);
			boardBean.setTitle(multi.getParameter("title"));
			boardBean.setContent(multi.getParameter("content"));
			boardBean.setFile(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			
			boolean isUpdateSuccess = reviewUpdateProService.updateArticle(boardBean);
			
			if(!isUpdateSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('수정 실패.')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>"); 
			}else {
				System.out.println("글 수정 성공");
				forward = new ActionForward();
				forward.setPath("reviewView.rv?no="+no+"&page=1");
				forward.setRedirect(true);
			}
			
		}
		
		return forward;
	}

}
