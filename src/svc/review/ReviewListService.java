package svc.review;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;


public class ReviewListService {
	public int getListCount() throws Exception{
		System.out.println("ReviewListService - getListCount");
		int listCount = 0;
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		
		listCount = reviewDAO.selectCount();
		
		System.out.println("게시물 갯수 : " + listCount);
		
		close(con);
		
		return listCount;
	}
	
	public ArrayList getArticleList(int page,int limit) throws Exception{
		System.out.println("ReviewListService - getArticleList");
		ArrayList articleList = null;
//		String board_type = "review";
//		String member_type = "승인";
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		
		articleList = reviewDAO.selectArticleList(page, limit);
		
		close(con);
		
		return articleList;
	}
}
