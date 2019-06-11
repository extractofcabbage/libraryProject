package action.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReviewViewService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		ReviewViewService reviewViewService = new ReviewViewService();
		ReviewBean boardBean = reviewViewService.getArticle(no);
		
		request.setAttribute("article", boardBean);
		
		forward.setPath("review/review_updateForm.jsp");
		
		return forward;
	}

}
