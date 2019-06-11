package svc.review;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewWriteProService {
	public int checkMemberNoArticle(String email) throws Exception {
System.out.println("ReviewWriteProService - checkMemberNoArticle");
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		int checkMemberNo = reviewDAO.checkMemberNo(email);
		close(con);
		return checkMemberNo;
	}

	public int checkMemberTypeArticle(int checkMemberNo) throws Exception {
		System.out.println("ReviewWriteProService - checkMemberTypeArticle");
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		int checkMemberType = reviewDAO.checkMemberType(checkMemberNo);
		close(con);
		return checkMemberType;
	}

	public boolean InsertArticle(ReviewBean boardBean) throws Exception {
		System.out.println("ReviewWriteProService - InsertArticle");
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		String type = "review";
		int insertCount = reviewDAO.insertArticle(boardBean, type);

		if (insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		return isWriteSuccess;
	}
}
