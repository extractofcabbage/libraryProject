package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ReviewBean;

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
			System.out.println("ReviewDAO - checkMemberNo");
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
			System.out.println("ReviewDAO - checkMemberType");
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
			int board_member_no = 0;
			int member_no=0;
			String sql = "SELECT member_no FROM board WHERE no=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board_member_no = rs.getInt(1);
				}
				
				sql = "select no from member where email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					member_no = rs.getInt(1);
				}
				if(board_member_no == member_no) {
					isWriter = true;
				}
				
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
			String sql = "UPDATE board SET title=?,content=?,file=? WHERE no=?";
			
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

			String sql = "select max(no) from board";

			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					no = rs.getInt(1) + 1;
				}
				sql = "insert into board values(?,?,?,?,?,?,now(),?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.setString(2, reviewBean.getTitle());
				pstmt.setString(3, reviewBean.getContent());
				pstmt.setInt(4, 0);
				pstmt.setString(5, reviewBean.getFile());
				pstmt.setString(6, type);
				pstmt.setInt(7, reviewBean.getMember_no());
				
				
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
		public int selectCount(String type) {
			int listCount = 0;
			String sql = "select count(*) from board where board_type=?";
			try {
				

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, type);
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

		public ArrayList<ReviewBean> selectArticleList(int page, int limit,String board_type,String member_type) {
			ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
			ReviewBean reviewBean = null;
			String email = null;
			int startRow = (page - 1) * 10; // 읽기 시작할 row 번호
			String sql = "select email from member where type=?";

			// => 참조글번호 내림차순 & 답글순서번호 오름차순 정렬
			// => 지정 row 번호부터 10개 조회

			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_type);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					email = rs.getString(1);
				}
				
				sql = "SELECT * FROM board where board_type = ? ORDER BY no DESC LIMIT ?,10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,board_type);
				pstmt.setInt(2, startRow);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// 1개 게시물 레코드 읽어와서 BoardBean 객체에 저장
					reviewBean = new ReviewBean();

					reviewBean.setNo(rs.getInt("no"));
					reviewBean.setTitle(rs.getString("title"));
					reviewBean.setContent(rs.getString("content"));
					reviewBean.setReadcount(rs.getInt("readcount"));
					reviewBean.setFile(rs.getString("file"));
					reviewBean.setBoard_type(rs.getString("board_type"));
					reviewBean.setReg_date(rs.getDate("reg_date"));
					reviewBean.setMember_no(rs.getInt("member_no"));
					reviewBean.setWriter(email);
				
					articleList.add(reviewBean); // ArrayList 객체에 레코드 단위로 저장
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
			ReviewBean boardBean = null;
			
			String sql = "SELECT * FROM board WHERE no=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					boardBean = new ReviewBean();
					
					boardBean.setNo(rs.getInt("no"));
					boardBean.setTitle(rs.getString("title"));
					boardBean.setContent(rs.getString("content"));
					boardBean.setReadcount(rs.getInt("readcount"));
					boardBean.setFile(rs.getString("file"));
					boardBean.setBoard_type(rs.getString("board_type"));
					boardBean.setReg_date(rs.getDate("reg_date"));
					boardBean.setMember_no(rs.getInt("member_no"));
				}
				sql = "select email from member where no= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, boardBean.getMember_no());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					boardBean.setWriter(rs.getString(1));
				}
				
			} catch (SQLException e) {
//				e.printStackTrace();
				System.out.println("getViewArticle() 실패! : " + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
			}
					
			return boardBean;
		}
		public int updateReadcount(int no) {
			int updateCount = 0;
			
			// board_num 에 해당하는 레코드의 board_readcount 값을 1 증가시키기
			String sql = "UPDATE board SET readcount=readcount+1 WHERE no=?";
			
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
			String sql = "DELETE FROM board WHERE no=?";
			
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
}
