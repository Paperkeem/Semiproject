package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.Dto.orderitemDto;
import db.mysql.DbConnect;

public class orderDao {
	DbConnect db = new DbConnect();
	
	public void makeOrderid(String num) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into cartorder(orderid,num) values(null,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public String getOrderid(String num) {
		String orderid=null;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql="select orderid from cartorder where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				orderid = rs.getString("orderid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return orderid;
	}
	
	
	
	public void insertOrderItem(orderitemDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into orderitem values(null,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getOrderid());
			pstmt.setString(2, dto.getShopnum());
			pstmt.setInt(3, dto.getCnt());
			pstmt.setInt(4, dto.getPrice());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
}
