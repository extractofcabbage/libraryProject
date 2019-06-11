package action.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.review.ReviewListService;
import vo.ActionForward;
import vo.ReviewBean;
import vo.PageInfo;
import action.Action;


public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		ReviewListService reviewListService = new ReviewListService();
		
		int listCount =	reviewListService.getListCount();
		
		articleList = reviewListService.getArticleList(page, limit);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = (((int)((double)page / 10+0.9))-1)*10+1;
		int endPage = startPage + 10 - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		
		// PageInfo 객체와 ArrayList 객체를 request 객체의 setAttribute() 메서드를 사용하여 저장
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		
		// ActionForward 객체를 사용하여 board 폴더의 qna_board_list.jsp 페이지로 이동 처리 => Dispatch 방식 포워딩
		// => 기존 boardList.bo 주소를 변경하지 않고 바로 jsp 페이지로 이동하기 위해서
		ActionForward forward = new ActionForward();
		forward.setPath("review/review_list.jsp");
		
		return forward;
	}

}
