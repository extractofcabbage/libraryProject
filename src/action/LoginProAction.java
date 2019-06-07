package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginProService;
import svc.MemberInfoService;
import vo.ActionForward;
import vo.MemberBean;

public class LoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		ActionForward forward=null;
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		System.out.println("LoginProAction - email : "+email);
		System.out.println("LoginProAction - password : "+password);
		
		MemberBean memberBean=new MemberBean();
		memberBean.setEmail(email);
		memberBean.setPassword(password);
		
		LoginProService loginProService=new LoginProService();
		boolean isLoginSuccess = loginProService.loginMember(memberBean);
		MemberInfoService memberInfoService = new MemberInfoService();
		
		memberBean =memberInfoService.getMemberInfo(memberBean); 
		
		if(!isLoginSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 실패')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("memberBean", memberBean);
			System.out.println("memberBean 가져오기 성공");
			forward = new ActionForward();
			forward.setPath("index.ma");
		}
		
		return forward;
	}

}
