package svc.review;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;
import vo.book.BookBean;

import static db.JdbcUtil.*;

public class ReviewViewService {
	public ReviewBean getArticle(int no) throws Exception{
		System.out.println("ReviewViewService  도착");
		Connection con = getConnection();
		ReviewBean reviewBean = null;
		BookBean bookBean = null;
		
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		
		reviewBean = reviewDAO.getViewArticle(no);
		
		int updateCount = reviewDAO.updateReadcount(no);
		
		if(updateCount == 1) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return reviewBean;
	}
}
