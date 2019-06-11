package action.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.review.ReviewViewService;
import vo.ActionForward;
import vo.ReviewBean;
import action.Action;

public class ReviewViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ReviewViewAction");
		int no = Integer.parseInt(request.getParameter("no"));
		
		String page = request.getParameter("page");
		
		ReviewViewService reviewViewService = new ReviewViewService();
		ReviewBean boardBean = reviewViewService.getArticle(no);
		
		request.setAttribute("page", page);
		request.setAttribute("article", boardBean);
		
		ActionForward forward = new ActionForward();
		forward.setPath("review/review_content.jsp");
		
		return forward;
	}

}
