package svc.my;

import java.sql.Connection;

import dao.MyDAO;

import static db.JdbcUtil.*;

public class MyInfoDeleteService {

	public boolean deleteMember(int memberNo) {
		Connection con = getConnection();
		
		MyDAO myDAO = MyDAO.getInstance();
		myDAO.setConnection(con);
		
		int deleteCount = myDAO.deleteMember(memberNo);
		boolean isDelete = false;
		
		if(deleteCount == 1) {
			isDelete = true;
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDelete;
	}

}
