package svc.review;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;


public class ReviewListService {
	public int getListCount() throws Exception{
		int listCount = 0;
		String type = "review";
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		
		listCount = reviewDAO.selectCount(type);
		
		System.out.println("게시물 갯수 : " + listCount);
		
		close(con);
		
		return listCount;
	}
	
	public ArrayList<ReviewBean> getArticleList(int page,int limit) throws Exception{
		ArrayList<ReviewBean> articleList = null;
		String board_type = "review";
		String member_type = "승인";
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getinstance();
		reviewDAO.setConnection(con);
		
		articleList = reviewDAO.selectArticleList(page, limit,board_type,member_type);
		
		close(con);
		
		return articleList;
	}
}
