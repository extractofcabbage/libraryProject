package action.book;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookBestRentService;
import vo.ActionForward;
import vo.MemberBean;
import vo.book.BookBean;
import vo.book.PageInfo;

public class BookBestRentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//int memberNo = Integer.parseInt(String.valueOf(request.getSession().getAttribute("memberNo")));
		MemberBean memberBean = (MemberBean)request.getSession().getAttribute("memberBean");
		int memberNo = memberBean.getNo();
		
		int nowYear = Calendar.getInstance().get(Calendar.YEAR);
		int nowMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		
		int year = nowYear;
		int month = nowMonth; 
		
		String category = "";
		int page = 1;
		int limit = 10;

		if (request.getParameter("year") != null) {
			year = Integer.parseInt(request.getParameter("year"));
			if (year < nowYear) {
				year = nowYear - 1;
			}
		}
		
		if (request.getParameter("month") != null) {
			month = Integer.parseInt(request.getParameter("month"));
			if (month < nowMonth) {
				month = nowMonth - 1;
			}
		}
		
		if (request.getParameter("category") != null) {
			category = request.getParameter("category");
		}
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		System.out.println("year: " + year);
		System.out.println("month: " + month);
		System.out.println("category: " + category);
		
		BookBestRentService bookBestRentService = new BookBestRentService(String.valueOf(year), String.valueOf(month), category, page, limit, memberNo);
		int listCount = bookBestRentService.getBookBestRentListCount();
		bookList = bookBestRentService.getBookBestRentList();

		int maxPage = (int)((double)listCount / limit + 0.95); // 총 페이지 수 (0.95를 더해서 올림 처리)		
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, ...)
		int endPage = startPage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, ...)

		if (endPage > maxPage) { // 마지막 페이지 번호가 최대 페이지 번호보다 클 경우
			endPage = maxPage; // 마지막 페이지 번호를 최대 페이지 번호로 대체
		}

		// 페이지 번호 관련 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setNowPage(page);
		pageInfo.setStartPage(startPage);

		// PageInfo 객체와 ArrayList 객체를 request 객체의 setAttribute() 메서드를 사용하여 저장
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("bookList", bookList);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("category", category);
		

		// ActionForward 객체를 사용하여 board 폴더의 qna_board_list.jsp 페이지로 이동 처리 => Dispatch 방식 포워딩
		// => 기존 boardList.do 주소를 변경하지 않고 바로 jsp 페이지로 이동하기 위해서
		ActionForward forward = new ActionForward();
		forward.setPath("/book/bestRental/bookBestRent.jsp");

		return forward;
	}

}
