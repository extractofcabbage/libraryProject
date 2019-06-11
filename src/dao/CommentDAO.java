package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.BoardBean;
import vo.CommentBean;
import vo.MemberBean;
import static db.JdbcUtil.*;
public class CommentDAO {
	private CommentDAO(){
	}
	
	private static CommentDAO instance;
	
	public static CommentDAO getInstance() {
		if(instance==null) {
			instance = new CommentDAO();
		}
		return instance;
	}

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertComment(CommentBean comment, MemberBean memberBean) {
		int insertCount = 0;
		String sql = "insert into board_comment(content,board_no,member_no,reg_date) values(?,?,?,now())";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, comment.getContent());
			pstmt.setInt(2, comment.getBoard_no());
			pstmt.setInt(3, memberBean.getNo());
			System.out.println("insertComment : "+pstmt.toString());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return insertCount;
	}

	public int deleteComment(int comment_num) {
		int deleteCount = 0;
		String sql = "delete from board_comment where no = ?";
		
		try {
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, comment_num);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return deleteCount;
	}
}
