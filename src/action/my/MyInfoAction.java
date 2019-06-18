package action.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.my.MyInfoService;
import vo.ActionForward;
import vo.MemberBean;

public class MyInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("id");
		System.out.println(email);
		
		MyInfoService myInfoService = new MyInfoService();
		MemberBean memberBean = myInfoService.getMemberInfo();
		
		return null;
	}

}
