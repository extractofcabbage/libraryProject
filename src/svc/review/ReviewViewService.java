package svc.review;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;
import static db.JdbcUtil.*;

public class ReviewViewService {
	public ReviewBean getArticle(int no) throws Exception{
		System.out.println("ReviewViewService");
		ReviewBean reviewBean = null;
		Connection con = getConnection();
		
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
