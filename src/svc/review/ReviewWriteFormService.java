package svc.review;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewWriteFormService {

	public ArrayList getRentalBookList(int member_no) {
		System.out.println("ReviewWriteFormService - getRentalBookList()");
		ArrayList bookList = null;
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		
		bookList = reviewDAO.getRentalBookList(member_no);
		
				
		close(con);
		
		return bookList;
	}
}
