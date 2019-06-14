package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MainDAO;
import vo.book.BookBean;

public class MainService {

	public ArrayList<BookBean> getBestBookList() {
		Connection con = getConnection();
		
		MainDAO mainDAO = MainDAO.getInstance();
		mainDAO.setConnection(con);
		
		ArrayList<BookBean> bestBookList = mainDAO.getBestBookList();
		
		close(con);
		
		return bestBookList;
	}

}
