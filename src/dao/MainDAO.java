package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	
}
