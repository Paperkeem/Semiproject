package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.Dto.cartorderDto;
import data.Dto.orderitemDto;
import db.mysql.DbConnect;

public class orderDao {
	DbConnect db = new DbConnect();
	
	public void insertCartOrder(cartorderDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into cartorder(orderid,num,orderdate) values(?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getOrderid());
			pstmt.setString(2, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	public void insertOrderItem(orderitemDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into orderItem values(null,?,?,?,?)";
		
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
	
	// 주문 내역 출력
			public List<HashMap<String, String>> getOrderList(String num){
				List<HashMap<String, String>>list=new ArrayList<>();
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs = null;
				
				String sql="select c.orderid, s.sangpum, s.shopnum, s.photo, o.price, o.cnt, c.orderdate\n"
						+ "from cartorder c,orderItem o, member m, shop s\n"
						+ "where c.orderid=o.orderid and c.num=m.num and o.shopnum=s.shopnum and m.num=?";
				
				try {
					pstmt=conn.prepareStatement(sql);
					
					pstmt.setString(1, num);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						HashMap<String, String> map=new HashMap<>();
						
						map.put("orderid", rs.getString("orderid"));
						map.put("sangpum", rs.getString("sangpum"));
						map.put("shopnum", rs.getString("shopnum"));
						map.put("photo", rs.getString("photo"));
						map.put("price", rs.getString("price"));
						map.put("cnt", rs.getString("cnt"));
						map.put("orderdate", rs.getString("orderdate"));
						
						list.add(map);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(rs, pstmt, conn);
				}
				return list;
			}
	
	
	
}
