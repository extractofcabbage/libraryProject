package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.EmailFindService;
import vo.ActionForward;
import vo.MemberBean;

public class EmailFindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward=null;
		int isCheckSuccess=0;
		
		MemberBean memberBean = new MemberBean();
		memberBean.setName(request.getParameter("name"));
		memberBean.setPhone(request.getParameter("phone"));
		
		EmailFindService emailFindService=new EmailFindService();
		isCheckSuccess=emailFindService.emailFind(memberBean);
		
		if(isCheckSuccess==1) {
			
			forward = new ActionForward();
			forward.setPath("./member/join/emailCheck.jsp");
			forward.setRedirect(true);
			
		}else if(isCheckSuccess==0) {
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이메일찾기 불가 정보재입력 바랍니다')");
			out.println("window.close()");
			out.println("</script>");
		    out.close();			
		}
		
		
		System.out.println(memberBean.toString());
		
		
		
		
		return forward;
	}
	
	

}
