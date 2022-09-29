package db.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	
	static final String MYSQLDRIVER="com.mysql.cj.jdbc.Driver";
	static final String MYSQLURL="jdbc:mysql://webservice.cww6sacccz1g.ap-northeast-2.rds.amazonaws.com:3306/webservice";

	// mysql 드라이버.. 생성자.. 
	public DbConnect() {
		try {
			Class.forName(MYSQLDRIVER);
			System.out.println("Mysql 드라이버 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Mysql 드라이버 실패");
		}
	}
	
	// Connection.. 오라클과 자바 연결
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn=DriverManager.getConnection(MYSQLURL, "jaeadmin", "kmjy1753~");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클 연결 실패: "+e.getMessage());
		}
		
		return conn;
	}
	
	// close 메소드 총 4개
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
		
			try {
				if(rs!=null)
					rs.close();
				if(stmt!=null)
					stmt.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}
	
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		
		try {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void dbClose(Statement stmt, Connection conn) {
		
		try {
			if(stmt!=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {
			
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DbConnect db = new DbConnect();
	}

}
