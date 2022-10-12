package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.Dto.replyDto;
import db.mysql.DbConnect;

public class replyDao {
	DbConnect db = new DbConnect();
	
	// insert
	public void insertReply(replyDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into reply(shopnum,num,content,rating,review,writeday) values(?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getShopnum());
			pstmt.setString(2, dto.getNum());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getRating());
			pstmt.setString(5, dto.getReview());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	// 총 개수
	public int getTotalCount(String shopnum) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select count(*) from reply where shopnum=?";
		int n=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, shopnum);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				n=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return n;
	}
	
	// list 10개 씩
	public List<replyDto> getReplyList(String shopnum, int start, int perpage){
		List<replyDto>list=new Vector<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select * from reply where shopnum=? order by idx desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, shopnum);
			pstmt.setInt(2, start);
			pstmt.setInt(3, perpage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				replyDto dto = new replyDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setShopnum(rs.getString("shopnum"));
				dto.setNum(rs.getString("num"));
				dto.setContent(rs.getString("content"));
				dto.setRating(rs.getInt("rating"));
				dto.setReview(rs.getString("review"));
				dto.setLikes(rs.getInt("likes"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
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
	
	// idx에 따른 dto 반환
	public replyDto getReply(String idx) {
		replyDto dto = new replyDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql="select * from reply where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setShopnum(rs.getString("shopnum"));
				dto.setNum(rs.getString("num"));
				dto.setContent(rs.getString("content"));
				dto.setRating(rs.getInt("rating"));
				dto.setReview(rs.getString("review"));
				dto.setLikes(rs.getInt("likes"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	// update
	public void updateReply(replyDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update reply set rating=?,review=?,content=? where idx=?";

		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getRating());
			pstmt.setString(2, dto.getReview());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIdx());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// 좋아요 +1
	public void plusReplyLikes(String idx) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update reply set likes=likes+1 where idx=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// delete
	public void deleteReply(String idx) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from reply where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// 별점 총점 구하기
	public double avgRating(String shopnum) {
		double avgRating=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql="select avg(rating) from reply where shopnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, shopnum);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				avgRating=rs.getDouble(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return avgRating;
	}
}
