package my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.model.Fav;
import my.util.JdbcUtil;

public class FavDao {
	
	public void insert(Connection conn, Fav fav) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into fav (userId,watchId,watchname, price, watchImage, watchImage1)"
					+ " values(?,?,?,?,?,?)");
			pstmt.setString(1, fav.getUserId());
			pstmt.setInt(2, fav.getWatchId());
			pstmt.setString(3, fav.getWatchName());
			pstmt.setInt(4, fav.getPrice());
			pstmt.setString(5, fav.getWatchImage());
			pstmt.setString(6, fav.getWatchImage1());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Fav selectById(Connection conn, String userId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Fav fav = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from fav where userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				fav = new Fav(); 
				fav.setFavId(rs.getInt(1));
				fav.setUserId(rs.getString(2));
				fav.setWatchId(rs.getInt(3));
				fav.setWatchName(rs.getString(4));
				fav.setPrice(rs.getInt(5));
				fav.setWatchImage(rs.getString(6));
				fav.setWatchImage1(rs.getString(7));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return fav;
	}
	/*
	public void update(Connection conn, Fav fav) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update fav set guestname=?,password=?,fav=?, "
					+ "   registertime=? where favId=?");
			pstmt.setString(1, fav.getGuestName());
			pstmt.setString(2, fav.getPassword());
			pstmt.setString(3, fav.getFav());
			pstmt.setTimestamp(4, new Timestamp(fav.getRegisterTime().getTime()));
			pstmt.setInt(5, fav.getFavId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}*/
	
	public void deleteById(Connection conn, int favId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from fav where favId = ?");
			pstmt.setInt(1, favId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	/*
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from fav");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}*/
	
	public List<Fav> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Fav> favList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from fav");
			rs  = pstmt.executeQuery(); 
			favList = new ArrayList<Fav>();
			while (rs.next()){
				Fav fav = new Fav();
				fav.setFavId(rs.getInt(1));
				fav.setUserId(rs.getString(2));
				fav.setWatchId(rs.getInt(3));
				fav.setWatchName(rs.getString(4));
				fav.setPrice(rs.getInt(5));
				fav.setWatchImage(rs.getString(6));
				fav.setWatchImage1(rs.getString(7));
				favList.add(fav);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return favList;
	}
	
	public List<Fav> selectListById(Connection conn, String userId) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Fav> favList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from fav where userId = ?");
			pstmt.setString(1, userId);
			rs  = pstmt.executeQuery(); 
			favList = new ArrayList<Fav>();
			while (rs.next()){
				Fav fav = new Fav();
				fav.setFavId(rs.getInt(1));
				fav.setUserId(rs.getString(2));
				fav.setWatchId(rs.getInt(3));
				fav.setWatchName(rs.getString(4));
				fav.setPrice(rs.getInt(5));
				fav.setWatchImage(rs.getString(6));
				fav.setWatchImage1(rs.getString(7));
				favList.add(fav);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return favList;
	}
}
