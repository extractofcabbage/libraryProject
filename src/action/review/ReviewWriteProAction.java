package action.review;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.review.ReviewWriteProService;
import vo.ActionForward;
import vo.ReviewBean;
import vo.MemberBean;
import action.Action;

public class ReviewWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ReviewWriteProAction");
		ActionForward forward = null;
		ReviewBean boardBean = null;

		String realFolder = "";
		String saveFolder = "/images/review";
		int fileSize = 5 * 1024 * 1024;

		ServletContext context = request.getServletContext(); // 현재 서블릿 컨텍스트 객체 얻어오기
		realFolder = context.getRealPath(saveFolder); // 가상의 경로에 해당하는 실제 경로 얻어오기
		System.out.println("1");
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		System.out.println("2");
		HttpSession session = request.getSession();
		MemberBean memberBean = (MemberBean) session.getAttribute("memberBean");
		String email = memberBean.getEmail();
		String name = memberBean.getName();
		System.out.println(name);
		boardBean = new ReviewBean();
		System.out.println("3");
		ReviewWriteProService reviewWriteProService = new ReviewWriteProService();
		System.out.println("4");
		int checkMemberNo = reviewWriteProService.checkMemberNoArticle(email);
		System.out.println("5");
//		int checkMemberType = reviewWriteProService.checkMemberTypeArticle(checkMemberNo);
		System.out.println("6");
//		if (checkMemberType == 0) {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('미승인 상태 입니다.')");
//			out.println("history.back()");
//			out.println("</script>");
//		} else {	
		
//		no,readcount,rental_no,member_no,book_no;
//		private String title,content,file,ispublic;
//		private Date reg_date;
			boardBean.setTitle(multi.getParameter("title"));
			boardBean.setContent(multi.getParameter("content"));
			boardBean.setFile(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			boardBean.setIspublic(multi.getParameter("ispublic"));
			boardBean.setRental_no(Integer.parseInt(multi.getParameter("rental_no")));
//			boardBean.setMember_no(checkMemberNo);

			boolean isInsertSuccess = reviewWriteProService.InsertArticle(boardBean);

//			if (!isInsertSuccess) {
//				response.setContentType("text/html;charset=UTF-8");
//				PrintWriter out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('글등록 실패')");
//				out.println("history.back()");
//				out.println("</script>");
//
//			} else {
				forward = new ActionForward();
				forward.setPath("reviewList.rv");
				forward.setRedirect(true);
//			}
//		}
		return forward;
	}

}
