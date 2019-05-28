package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardBean;
import vo.MemberBean;

import static db.JdbcUtil.*;
public class BoardDetailService {
	public ArrayList getArticle(int board_num) throws Exception{
		System.out.println("BoardDetailService getArticle 왔당");
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		ArrayList beans = boardDAO.selectArticle(board_num);
		int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount == 1) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return beans;
	}
}
