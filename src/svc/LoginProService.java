package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class LoginProService {
	
	
		
		public boolean loginMember(MemberBean memberBean) {
			
			Connection con=getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);
			
			boolean isRightUser = memberDAO.isRightUser(memberBean);
			close(con);
				
			
			return isRightUser;
		}

		
	
	

}
