package svc;


import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class EmailFindService {
	
	
	public int emailFind(MemberBean memberBean) {
		
		String name;
		int isCheck;
		
		Connection con=getConnection();
		MemberDAO memberDAO=MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		isCheck=memberDAO.emailFind(memberBean);
		
		
		close(con);
		return isCheck;
		
		
		
	}

}
