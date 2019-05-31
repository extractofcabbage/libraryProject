package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.AES256Cipher;
import vo.MemberBean;
import static db.JdbcUtil.*;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private MemberDAO() {
		
	}
	private static MemberDAO instance;
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	public MemberBean selectMemberBean(String email){
		MemberBean memberBean= null;
		String sql = "select * from member where email = ?";
		System.out.println("MemberDAO email : "+email);
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println("7");
			pstmt.setString(1, email);
			System.out.println("2");
			rs = pstmt.executeQuery();
			System.out.println("2.5");
			if(rs.next()) {
				System.out.println("3");
				memberBean = new MemberBean();
				memberBean.setAddress1(rs.getString("address1"));
				memberBean.setAddress2(rs.getString("address2"));
				memberBean.setBirth(rs.getString("birth"));
				memberBean.setEmail(rs.getString("email"));
				memberBean.setGender(rs.getString("gender"));
				memberBean.setImage(rs.getString("image"));
				memberBean.setName(rs.getString("name"));
				memberBean.setNo(rs.getInt("no"));
				memberBean.setPassword(rs.getString("password"));
				memberBean.setPhone(rs.getString("phone"));
				memberBean.setPostcode(rs.getInt("postcode"));
				memberBean.setReg_date(rs.getDate("reg_date"));
				memberBean.setType(rs.getString("type"));
				System.out.println("selectMemberBean 성공");
			}else {
				System.out.println("실패");
			}
		} catch (SQLException e) {
			System.out.println("selectMemberBean() 실패"+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return memberBean;
	}
	public int insertMember(MemberBean memberBean) {
		int insertCount=0;
		
		try {
			
			String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getEmail());
			//pstmt.setString(2, memberBean.getPassword());
			pstmt.setString(2, AES256Cipher.getInstance().encryption(memberBean.getPassword()));
			pstmt.setString(3, memberBean.getName());
			pstmt.setString(4, memberBean.getGender());
			pstmt.setString(5, memberBean.getBirth());
			pstmt.setString(6, memberBean.getPhone());
			pstmt.setString(7, memberBean.getImage());
			pstmt.setString(8, memberBean.getAddress1());
			pstmt.setString(9, memberBean.getAddress2());
			pstmt.setInt(10, memberBean.getPostcode());
			pstmt.setString(11, "미승인");
			
			System.out.println(sql);
			
			insertCount=pstmt.executeUpdate();
			System.out.println("성공");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("insertMember() 실패!" + e.getMessage());
		}finally {
			close(pstmt);
		}
		return insertCount;
	
		
		
	}

	public int emailCheck(MemberBean memberBean) {

		int isCheck=0;
		
		String sql="SELECT * FROM member where email=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getEmail());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()==true) {
				isCheck=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return isCheck;
	}
	
	public int emailFind(MemberBean memberBean) {
		
		
		int isCheck=0;
		String emailCheck;
		
		String sql="SELECT * FROM member where email=? AND phone=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getEmail());
			pstmt.setString(2, memberBean.getPhone());
			
			rs=pstmt.executeQuery();
			
			//memberBean.setEmail(rs.getString("email"));
			memberBean.setEmail(AES256Cipher.getInstance().decryption(rs.getString("email")));
			
			if(rs.next()==true) {
				isCheck=1;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return isCheck;
	}
	public boolean isRightUser(MemberBean memberBean) {
		boolean isRightUser = false;
		String sql = "SELECT * FROM member WHERE email=? AND password = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getEmail());
			//pstmt.setString(2, memberBean.getPassword());
			pstmt.setString(2, AES256Cipher.getInstance().encryption(memberBean.getPassword()));
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				isRightUser = true;
			}
		} catch (SQLException e) {
			System.out.println("isRightUser() 실패");
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return isRightUser;
	}
}
