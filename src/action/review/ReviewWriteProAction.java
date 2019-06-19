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
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String isPublic = request.getParameter("isPublic");
		int rental_no = Integer.parseInt(request.getParameter("rentalNo"));
		
		ReviewBean reviewBean = new ReviewBean();
		reviewBean.setTitle(title);
		reviewBean.setContent(content);
		reviewBean.setRental_no(rental_no);
		
		ReviewWriteProService reviewWriteProService  = new ReviewWriteProService();
		reviewWriteProService.insertArticle(reviewBean);
		
		
		return null;
	}

}
