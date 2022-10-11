package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.Dto.memberDto;
import db.mysql.DbConnect;

public class memberDao {

DbConnect db=new DbConnect();
	
	//아이디체크
	public int isIdcheck(String id)
	{
		int isid=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from member where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				if(rs.getInt(1)==1)
					isid=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return isid;
	}
	
	//아이디에 대한 이름반환
	public String getName(String id)
	{
		String name="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				name=rs.getString("name");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	}
	
	//insert
	public void insertMember(memberDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into member (name,id,pass,type,gomin,hp,gaipday) values(?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getType());
			pstmt.setString(6, dto.getGomin());
			
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//전체출력
	public List<memberDto> getAllMembers()
	{
		List<memberDto> list=new Vector<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member order by id";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				memberDto dto=new memberDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setHp(rs.getString("hp"));
				dto.setType(rs.getString("type"));
				dto.setGomin(rs.getString("gomin"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		} return list;
	}

	//비밀번호체크
	public boolean isPassEqual(String num,String pass)
	{
		boolean b=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from where num=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,  num);
			pstmt.setString(2, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

	//아이디와 비번체크
	public boolean isIdPass(String id,String pass)
	{
		boolean b=false;
	
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	
		String sql="select * from member where id=? and pass=?";
	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
		
			rs=pstmt.executeQuery();
		
		if(rs.next())
			b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	
		return b;
	}
	
	//아이디 찾기
	public String idfind(String name, String hp) {
		String id="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select id from member where name=? and hp=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, hp);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				id=rs.getString("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	//비밀번호 찾기
	
}

