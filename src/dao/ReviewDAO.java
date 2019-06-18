package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import vo.MemberBean;
import vo.ReviewBean;
import vo.book.BookBean;
import vo.book.RentBean;

public class ReviewDAO {
	private static ReviewDAO instance;
	Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private ReviewDAO() {

	}

	public static ReviewDAO getinstance() {
		if (instance == null) {
			instance = new ReviewDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// ------------- checkMemberNo -----------------------------------
		public int checkMemberNo(String email) {
			int checkMemberNo = 0;
			String sql = "select no from member where email=?";

			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					checkMemberNo = rs.getInt("no");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("checkMemberNo 에러 : " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}

			return checkMemberNo;
		}
		//------------------ checkMemberType -------------------
		public int checkMemberType(int checkMemberNo) {
			int checkMemberType = 0;
			String temp;
			String sql = "select type from member where no=?";

			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, checkMemberNo);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					temp = rs.getString("type");
					if(temp.equals("미승인")) {
						checkMemberType = 0;
					}else {
						checkMemberType = 1;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("checkMemberNo 에러 : " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}

			return checkMemberType;
		}
		// -------------------- isWriter -------------------------------
		public boolean isWriter(int no, String email) {

			boolean isWriter = false;
			int member_no=0;
			String sql = "SELECT member_no FROM review WHERE no=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
//				if(rs.next()) {
//					board_member_no = rs.getInt(1);
//				}
				
				sql = "select no from member where email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					member_no = rs.getInt(1);
				}
//				if(board_member_no == member_no) {
//					isWriter = true;
//				}
				
			} catch (SQLException e) {
				System.out.println("isWriter() 실패! : " + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return isWriter;
		}
		//--------------------updateArticle----------------------------------
		public int updateArticle(ReviewBean reviewBean) {
			int updateCount = 0;
			
			// BoardBean 객체의 board_num 에 해당하는 레코드를 수정
			// => 글제목(board_subject), 글내용(content) 수정
			String sql = "UPDATE review SET title=?,content=?,file=? WHERE no=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, reviewBean.getTitle());
				pstmt.setString(2, reviewBean.getContent());
				pstmt.setString(3, reviewBean.getFile());
				pstmt.setInt(4, reviewBean.getNo());
				updateCount = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("updateArticle() 실패! : " + e.getMessage());
			} finally {
				close(pstmt);
			}
			
			return updateCount;
		}
		
		//---------------- insertArticle ---------------------
		public int insertArticle(ReviewBean reviewBean,String type) {
			int no = 0;
			int insertCount = 0;

			String sql = "select max(no) from review";
			
			
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					no = rs.getInt(1) + 1;
				}
				sql = "insert into review(no,title,content,readcount,file,ispublic,reg_date,rental_no) values(null,?,?,0,?,?,now(),?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, reviewBean.getTitle());
				pstmt.setString(2, reviewBean.getContent());
				pstmt.setString(3, reviewBean.getFile());
				pstmt.setString(4, reviewBean.getIspublic());
				pstmt.setInt(5, reviewBean.getRental_no());
				//대여한 책 번호를 넘겨줘야함
				
				System.out.println(pstmt);
				
				
				insertCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("insert 에러 : " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}
			System.out.println(insertCount + "개 성공");

			return insertCount;
		}
		//-------------selectCount---------------------------
		public int selectCount() {
			System.out.println("ReviewDAO - selectCount()");
			int listCount = 0;
			String sql = "select count(*) from review";
			try {
				

				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					listCount = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("selectCount : 실패" + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
			}
			return listCount;
		}

		// ------------selectArticleList ---------------------------

		public ArrayList selectArticleList(int page, int limit) {
			ArrayList articleList = new ArrayList();
			ReviewBean reviewBean = null;
			MemberBean memberBean = null;
			BookBean bookBean = null;
			int startRow = (page - 1) * 10; // 읽기 시작할 row 번호
//			String sql = "select email from member where type=?";

			// => 참조글번호 내림차순 & 답글순서번호 오름차순 정렬
			// => 지정 row 번호부터 10개 조회

			try {
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, member_type);
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()) {
//					email = rs.getString(1);
//				}
				
				String sql = "select * " + 
						" from review v, rental r, member m, book b " + 
						" where v.rental_no = r.no " + 
						" and m.no = r.member_no " + 
						" and b.no = r.book_no ORDER BY v.reg_date DESC LIMIT ?,? ";
				
				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1,board_type);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, limit);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// 1개 게시물 레코드 읽어와서 BoardBean 객체에 저장
					reviewBean = new ReviewBean();

					reviewBean.setNo(rs.getInt("v.no"));
					reviewBean.setTitle(rs.getString("v.title"));
					reviewBean.setContent(rs.getString("v.content"));
					reviewBean.setReadcount(rs.getInt("v.readcount"));
					reviewBean.setFile(rs.getString("v.file"));
					reviewBean.setReg_date(rs.getDate("v.reg_date"));
					reviewBean.setIspublic(rs.getString("v.ispublic"));
					reviewBean.setRental_no(rs.getInt("v.rental_no"));
					
					memberBean = new MemberBean();
					
					memberBean.setAddress1(rs.getString("m.address1"));
					memberBean.setAddress2(rs.getString("m.address2"));
					memberBean.setBirth(rs.getString("m.birth"));
					memberBean.setEmail(rs.getString("m.email"));
					memberBean.setGender(rs.getString("m.gender"));
					memberBean.setImage(rs.getString("m.image"));
					memberBean.setName(rs.getString("m.name"));
					memberBean.setNo(rs.getInt("m.no"));
					memberBean.setPassword(rs.getString("m.password"));
					memberBean.setPhone(rs.getString("m.phone"));
					memberBean.setPostcode(rs.getInt("m.postcode"));
					memberBean.setReg_date(rs.getDate("m.reg_date"));
					memberBean.setType(rs.getString("m.type"));
					
					bookBean = new BookBean();
					
					bookBean.setNo(rs.getInt("b.no"));
					bookBean.setTitle(rs.getString("b.title"));
					bookBean.setAuthor(rs.getString("b.author"));
					bookBean.setPublisher(rs.getString("b.publisher"));
					bookBean.setPublish_date(rs.getDate("b.publish_date"));
					bookBean.setPrice(rs.getInt("b.price"));
					bookBean.setIsbn(rs.getString("b.isbn"));
					bookBean.setImage(rs.getString("b.image"));
					bookBean.setStatus(rs.getString("b.status"));
					bookBean.setKeyword1(rs.getString("b.keyword1"));
					bookBean.setKeyword2(rs.getString("b.keyword2"));
					bookBean.setKeyword3(rs.getString("b.keyword3"));
					bookBean.setCategory(rs.getString("b.category"));
					bookBean.setRent_code(rs.getString("b.rent_code"));
					bookBean.setBar_code(rs.getString("b.bar_code"));
					bookBean.setReg_date(rs.getTimestamp("b.reg_date"));
					
					articleList.add(reviewBean); // ArrayList 객체에 레코드 단위로 저장
					articleList.add(memberBean);
					articleList.add(bookBean);
				}
			} catch (SQLException e) {
//				e.printStackTrace();
				System.out.println("selectArticleList() 실패! : " + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
			}

			return articleList;
		}
		
		//----------------- getViewArticle -------------------
		
		public ReviewBean getViewArticle(int no) {
			System.out.println("getViewArticle");
			ReviewBean reviewBean = null;
			
			String sql = "SELECT * FROM review WHERE no=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					reviewBean = new ReviewBean();
					
					reviewBean.setNo(rs.getInt("no"));
					reviewBean.setTitle(rs.getString("title"));
					reviewBean.setContent(rs.getString("content"));
					reviewBean.setReadcount(rs.getInt("readcount"));
					reviewBean.setFile(rs.getString("file"));
					reviewBean.setReg_date(rs.getDate("reg_date"));
				}
				sql = "select * from member where no= ?";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					reviewBean.setContent(rs.getString("content"));
					reviewBean.setFile(rs.getString("file"));
					reviewBean.setIspublic(rs.getString("ispublic"));
					reviewBean.setNo(rs.getInt("no"));
					reviewBean.setReadcount(rs.getInt("readcount"));
					reviewBean.setReg_date(rs.getDate("reg_date"));
					reviewBean.setRental_no(rs.getInt("rental_no"));
					reviewBean.setTitle(rs.getString("title"));
				}
				
			} catch (SQLException e) {
//				e.printStackTrace();
				System.out.println("getViewArticle() 실패! : " + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
			}
					
			return reviewBean;
		}
		public int updateReadcount(int no) {
			int updateCount = 0;
			
			// board_num 에 해당하는 레코드의 board_readcount 값을 1 증가시키기
			String sql = "UPDATE review SET readcount=readcount+1 WHERE no=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				updateCount = pstmt.executeUpdate();
//				System.out.println(updateCount);
			} catch (SQLException e) {
				System.out.println("updateReadcount() 실패! : " + e.getMessage());
			} finally {
				close(pstmt);
			}
			
			return updateCount;
		}
		//----------------- deleteArticle --------------------------
		public int deleteArticle(int no) {
			int deleteCount = 0;
			
			// board_num 에 해당하는 레코드를 삭제
			String sql = "DELETE FROM review WHERE no=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				deleteCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("deleteArticle() 실패! : " + e.getMessage());
			} finally {
				close(pstmt);
			}
			
			return deleteCount;
		}

		public ArrayList getRentalBookList(int member_no) {
			ArrayList bookList = new ArrayList();
			BookBean bookBean = null;
			String sql = "select *  " + 
					"from rental r, book b " + 
					"where member_no = ? " + 
					"and r.status not in('신청중') " + 
					"and r.no not in(select r.no from review v, rental r " + 
					"where v.rental_no = r.no " + 
					"and member_no = ?) " + 
					"and r.book_no = b.no ";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, member_no);
				pstmt.setInt(2, member_no);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					bookBean = new BookBean();
					bookBean.setImage(rs.getString("image"));;
					bookBean.setIsbn(rs.getString("isbn"));
					bookList.add(bookBean);
									}
			} catch (SQLException e) {
				System.out.println("getRentalBookList() 실패! : " + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
			} 
			
			return bookList;
		}
}
