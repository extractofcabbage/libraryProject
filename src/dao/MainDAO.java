package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import vo.ReviewBean;
import vo.book.BookBean;

public class MainDAO {
	
	private static MainDAO instance;
	
	private MainDAO() {}
	
	public static MainDAO getInstance() {
		if(instance == null) {
			instance = new MainDAO();
		}
		return instance;
	}
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	// 베스트 대여 5개
	public ArrayList<BookBean> getBestBookList() {
		ArrayList<BookBean> bestBookList = null;
		
		String sql = "SELECT book.*, COUNT(*) as rentCount FROM book join rental on book.no=rental.book_no "
				+ "GROUP BY isbn ORDER BY rentCount DESC limit 0, 5";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			bestBookList = new ArrayList<BookBean>();
			while(rs.next()) {
				BookBean bookBean = new BookBean();
				bookBean.setIsbn(rs.getString("isbn"));
				bookBean.setImage(rs.getString("image"));
				bookBean.setRentCount(rs.getInt("rentCount"));
				bestBookList.add(bookBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bestBookList;
	}
	
	
	// 최신 리뷰 5개
	public ArrayList<ReviewBean> getRecentReviewList() {
		ArrayList<ReviewBean> recentReviewList = null;
		
		String sql = "SELECT review.no, review.title, review.content, book.isbn, book.image "
				+ "FROM review join book on review.isbn=book.isbn ORDER BY review.reg_date DESC LIMIT 0, 5";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			recentReviewList = new ArrayList<ReviewBean>();
			while(rs.next()) {
				ReviewBean reviewBean = new ReviewBean();
				reviewBean.setNo(rs.getInt("no"));
				reviewBean.setTitle(rs.getString("title"));
				
				if(rs.getString("content").length() > 100) {
					String content = rs.getString("content").substring(0, 100) + "...";
					reviewBean.setContent("content");
				} else {
					reviewBean.setContent(rs.getString("content"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public JSONArray getRecentNoticeList() {
		JSONArray noticeList = null;
		String content = "";
		
		String sql = "SELECT no, content FROM board WHERE board_type='notice' ORDER BY reg_date DESC LIMIT 0, 5";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			noticeList = new JSONArray();
			while(rs.next()) {
				JSONObject notice = new JSONObject();
				
				notice.put("no", rs.getInt("no") + "");
				content = rs.getString("content").trim();
				if(content.length() > 40) {
					content = content.substring(0, 39) + "...";
				}
				notice.put("content", content);
				
				noticeList.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return noticeList;
	}
	
	
}
