package my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import my.model.Purchase;
import my.util.JdbcUtil;

public class PurchaseDao {
	
	public void insert(Connection conn, Purchase purchase) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into purchase (userId,watchId,price,amount,gift,pdate,address,watchStyle)"
					+ " values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, purchase.getUserId());
			pstmt.setInt(2, purchase.getWatchId());
			pstmt.setInt(3, purchase.getPrice());
			pstmt.setInt(4, purchase.getAmount());
			pstmt.setString(5, purchase.getGift());
			pstmt.setTimestamp(6, 
					new Timestamp(purchase.getpDate().getTime()));
			pstmt.setString(7, purchase.getAddress());
			pstmt.setString(8, purchase.getWatchStyle());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Purchase selectById(Connection conn, String userId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Purchase purchase = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from purchase where userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				purchase = new Purchase(); 
				purchase.setPurchaseId(rs.getInt(1));
				purchase.setUserId(rs.getString(2));
				purchase.setWatchId(rs.getInt(3));
				purchase.setPrice(rs.getInt(4));
				purchase.setAmount(rs.getInt(5));
				purchase.setGift(rs.getString(6));
				purchase.setpDate(rs.getTimestamp(7));
				purchase.setAddress(rs.getString(8));
				purchase.setWatchStyle(rs.getString(9));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return purchase;
	}
	
	public String myFavWatch(Connection conn, String userId)//리턴값을 String으로 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		String myWatchStyle= "";
		try {
			pstmt = conn.prepareStatement
			("select watchStyle from purchase where userId = ? group by watchStyle order by count(*) desc");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				myWatchStyle = rs.getString(1);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return myWatchStyle;
	}
	
	/*
	public void update(Connection conn, Purchase purchase) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update purchase set guestname=?,password=?,purchase=?, "
					+ "   registertime=? where purchaseId=?");
			pstmt.setString(1, purchase.getGuestName());
			pstmt.setString(2, purchase.getPassword());
			pstmt.setString(3, purchase.getPurchase());
			pstmt.setTimestamp(4, new Timestamp(purchase.getRegisterTime().getTime()));
			pstmt.setInt(5, purchase.getPurchaseId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	*/
	public void deleteById(Connection conn, int purchaseId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from purchase where purchaseId = ?");
			pstmt.setInt(1, purchaseId);
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
			rs = stmt.executeQuery("select count(*) from purchase");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}*/
	public List<Purchase> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Purchase> purchaseList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from purchase");
			rs  = pstmt.executeQuery(); 
			purchaseList = new ArrayList<Purchase>();
			while (rs.next()){
				Purchase purchase = new Purchase();
				purchase.setPurchaseId(rs.getInt(1));
				purchase.setUserId(rs.getString(2));
				purchase.setWatchId(rs.getInt(3));
				purchase.setPrice(rs.getInt(4));
				purchase.setAmount(rs.getInt(5));
				purchase.setGift(rs.getString(6));
				purchase.setpDate(rs.getTimestamp(7));
				purchase.setAddress(rs.getString(8));
				purchase.setWatchStyle(rs.getString(9));
				purchaseList.add(purchase);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return purchaseList;
	}
	
	public List<Purchase> selectListById(Connection conn, String userId) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Purchase> purchaseList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from purchase where userId = ?");
			pstmt.setString(1, userId);
			rs  = pstmt.executeQuery(); 
			purchaseList = new ArrayList<Purchase>();
			while (rs.next()){
				Purchase purchase = new Purchase();
				purchase.setPurchaseId(rs.getInt(1));
				purchase.setUserId(rs.getString(2));
				purchase.setWatchId(rs.getInt(3));
				purchase.setPrice(rs.getInt(4));
				purchase.setAmount(rs.getInt(5));
				purchase.setGift(rs.getString(6));
				purchase.setpDate(rs.getTimestamp(7));
				purchase.setAddress(rs.getString(8));
				purchaseList.add(purchase);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return purchaseList;
	}
	
}
