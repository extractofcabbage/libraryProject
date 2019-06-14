package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MainService;
import vo.ActionForward;
import vo.book.BookBean;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MainService mainFormService = new MainService();
		ArrayList<BookBean> bestBookList = mainFormService.getBestBookList();
		
		request.setAttribute("bestBookList", bestBookList);
		
		ActionForward  forward = new ActionForward();
		forward.setPath("main.ma");
		
		return forward;
	}

}
