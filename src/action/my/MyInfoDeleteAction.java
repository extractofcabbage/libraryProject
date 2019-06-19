package action.my;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.my.MyInfoDeleteService;
import vo.ActionForward;
import vo.MemberBean;

public class MyInfoDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberBean memberBean = (MemberBean)session.getAttribute("memberBean");
		if(memberBean == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("location.href='index.ma'");
			out.println("</script>");
			
			return null;
		}
		
		int memberNo = memberBean.getNo();
		
		MyInfoDeleteService myInfoDeleteService = new MyInfoDeleteService();
		boolean isDelete = myInfoDeleteService.deleteMember(memberNo);
		
		if(isDelete) {
			session.invalidate();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('성공적으로 탈퇴하였습니다.')");
			out.println("location.href='index.ma'");
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('오류 발생!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
