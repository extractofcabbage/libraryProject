package action.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.review.ReviewViewService;
import vo.ActionForward;
import vo.ReviewBean;
import vo.book.BookBean;
import action.Action;

public class ReviewViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ReviewViewAction 도착");
		int no = Integer.parseInt(request.getParameter("no"));
		
		String page = request.getParameter("page");
		
		ReviewViewService reviewViewService = new ReviewViewService();
		BookBean bookBean = new BookBean();
		ReviewBean reviewBean = reviewViewService.getArticle(no);
		
		
		request.setAttribute("page", page);
		request.setAttribute("article", reviewBean);
		request.setAttribute("image", bookBean);
		
		ActionForward forward = new ActionForward();
		forward.setPath("review/review_content.jsp");
		
		return forward;
	}

}
