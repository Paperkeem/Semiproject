package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import data.Dto.cartDto;
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
	
	public void updateLikechu(String shopnum) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="update shop set likechu=likechu+1 where shopnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, shopnum);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {db.dbClose(pstmt, conn);}
		
	}
	
		
	
		// cart 제품 있는지 확인
		public boolean isCartorNot(String shopnum, String num) {
			boolean b = false;
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql="select * from cart where shopnum=? and num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, shopnum);
				pstmt.setString(2, num);
	
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					b=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return b;
		}	
		
	    // cart insert
		public void insertCart(cartDto dto) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into cart values(null,?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getShopnum());
				pstmt.setString(2, dto.getNum());
				pstmt.setInt(3, dto.getCnt());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//제품이 이미 존재하면 수량만 증가
		public void plusCart(cartDto dto) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update cart set cnt=cnt+? where shopnum=? and num=?;";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, dto.getCnt());
				pstmt.setString(2, dto.getShopnum());
				pstmt.setString(3, dto.getNum());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		
		// 장바구니 출력
		public List<HashMap<String, String>> getCartList(String id){
			List<HashMap<String, String>>list=new ArrayList<>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			
			String sql="select c.idx,s.sangpum,s.shopnum,s.photo,s.price,c.cnt,c.cartday "
					+ "from cart c,shop s, member m "
					+ "where c.shopnum=s.shopnum and c.num=m.num and m.id=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					HashMap<String, String> map=new HashMap<>();
					
					map.put("idx", rs.getString("idx"));
					map.put("sangpum", rs.getString("sangpum"));
					map.put("shopnum", rs.getString("shopnum"));
					map.put("photo", rs.getString("photo"));
					map.put("price", rs.getString("price"));
					map.put("cnt", rs.getString("cnt"));
					map.put("cartday", rs.getString("cartday"));
					
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

		
		// cart 상품 삭제
		public void deleteSangpum(String idx) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from cart where idx=?";
			
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
		
		// 추천 순으로 가져오기
		public List<shopDto> getLikeChu()
		{
			List<shopDto>list =new Vector<>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from shop order by likechu desc";
			
			try {
				pstmt=conn.prepareStatement(sql);

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
	
		//카테고리별 리스트 불러오기
		public List<shopDto> getCateList(String category, int start, int perPage)
		{
			List<shopDto>list =new Vector<>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from shop where category=? order by shopnum desc limit ?,?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, start);
				pstmt.setInt(3, perPage);
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
		//카테고리별 상품갯수 구하기
		public int getTotalCateCount(String category)
		{
			int n=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from shop where category=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, category);
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
		
}
