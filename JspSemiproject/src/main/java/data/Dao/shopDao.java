package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.Dto.shopDto;

import db.mysql.DbConnect;

public class shopDao {
	
	DbConnect db=new DbConnect();
	
	public void InsertShop(shopDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into shop values(null,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
		
	       pstmt.setString(1, dto.getCategory());
	       pstmt.setString(2, dto.getSangpumtype());
	       pstmt.setString(3, dto.getGomin());
	       pstmt.setString(4, dto.getSangpum());
	       pstmt.setString(5, dto.getPhoto());
	       pstmt.setString(6, dto.getPrice());
	       pstmt.setInt(7, dto.getLikechu());
	       pstmt.setString(8, dto.getIpgoday());
	       
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//전체데이터 가져오기(list)
	public List<shopDto> getList(int start, int perPage)
	{
		List<shopDto>list =new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop order by shopnum desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				shopDto dto=new shopDto();
				
				dto.setShopnum(rs.getString("shopnum"));
				dto.setCategory(rs.getString("category"));
				dto.setSangpumtype(rs.getString("sangpumtype"));
				dto.setGomin(rs.getString("gomin"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getString("price"));
				dto.setLikechu(rs.getInt("likechu"));
				dto.setIpgoday(rs.getString("ipgoday"));
			
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		
		return list;
	}
	
	//한개데이터 가져오기
	public shopDto getData(String shopnum)
	{
		shopDto dto=new shopDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop where shopnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, shopnum);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setShopnum(rs.getString("shopnum"));
				dto.setCategory(rs.getString("category"));
				dto.setSangpumtype(rs.getString("sangpumtype"));
				dto.setGomin(rs.getString("gomin"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getString("price"));
				dto.setLikechu(rs.getInt("likechu"));
				dto.setIpgoday(rs.getString("ipgoday"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return dto;
	}

	public int getTotalCount()
	{
		int n=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from shop";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				n=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return n;
	}
	
	public void deleteShop(String shopnum)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from shop where shopnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, shopnum);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		
	}
	
	
}
