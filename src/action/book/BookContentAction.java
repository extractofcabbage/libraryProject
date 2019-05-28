package action.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookContentService;
import svc.book.NaverAPISearchBook;
import vo.ActionForward;
import vo.book.BookBean;
import vo.book.BookCommentBean;

public class BookContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int memberNo = Integer.parseInt(String.valueOf(request.getSession().getAttribute("memberNo")));
		
		String isbn = request.getParameter("isbn");
		String page = request.getParameter("page");

		BookContentService bookRentDetailService = new BookContentService();
		BookBean bookBean = bookRentDetailService.getBook(memberNo, isbn);

		// 관심도서 등록 여부 --> getBook()에 추가 
		//boolean isFavorBook = bookRentDetailService.isFavoriteBook(memberNo, isbn);
		
		// 책 소개(NAVER BOOK API)
		String description = NaverAPISearchBook.getInstance().searchBook(isbn);
		
		// 댓글..
		ArrayList<BookCommentBean> bookCommentList = bookRentDetailService.getBookCommentList(isbn);

		request.setAttribute("memberNo", memberNo);
		request.setAttribute("page", page);
		request.setAttribute("book", bookBean);
		//request.setAttribute("isFavorBook", isFavorBook); --> getBook()에 추가. 생략
		request.setAttribute("description", description);
		request.setAttribute("bookCommentList", bookCommentList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("book/rental/bookContent.jsp"); // 이동할 jsp 페이지 지정

		return forward;
	}

}
