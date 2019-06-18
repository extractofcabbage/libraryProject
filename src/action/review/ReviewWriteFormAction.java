package action.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.review.ReviewViewService;
import svc.review.ReviewWriteFormService;
import vo.ActionForward;
import vo.ReviewBean;
import vo.MemberBean;

public class ReviewWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWriteFormAction");
		HttpSession session = request.getSession();
		MemberBean memberBean = (MemberBean) session.getAttribute("memberBean");
		int member_no = memberBean.getNo();
		
		ReviewWriteFormService reviewWriteFormService = new ReviewWriteFormService();
		ArrayList bookList = reviewWriteFormService.getRentalBookList(member_no);
		
		request.setAttribute("bookList", bookList);
		ActionForward forward = new ActionForward();
		
		forward.setPath("review/review_write.jsp");
		
		
		return forward;
	}

}
