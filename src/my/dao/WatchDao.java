package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Watch;
import my.model.Watch;
import my.model.WatchListView;
import my.model.Watch;
import my.util.JdbcUtil;

public class WatchDao {
	

	public void insert(Connection conn, Watch watch) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into watch (watchName, brand, price, watchImage, memo, watchTime, watchStyle, watchAge, watchType, watchImage1, watchImage2, watchImage3)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, watch.getWatchName());
			pstmt.setString(2, watch.getBrand());
			pstmt.setInt(3, watch.getPrice());
			pstmt.setString(4, watch.getWatchImage());
			pstmt.setString(5, watch.getMemo());
			pstmt.setTimestamp(6,new Timestamp(watch.getWatchTime().getTime()));
			pstmt.setString(7, watch.getWatchStyle());
			pstmt.setString(8, watch.getWatchAge());
			pstmt.setString(9, watch.getWatchType());
			pstmt.setString(10, watch.getWatchImage1());
			pstmt.setString(11, watch.getWatchImage2());
			pstmt.setString(12, watch.getWatchImage3());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	public Watch selectById(Connection conn, int watchId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Watch watch = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from watch where watchId = ?");
			pstmt.setInt(1, watchId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				watch = new Watch(); 
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return watch;
	}
	
	public List<Watch> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Watch watch = null; 
		List<Watch> watchs = new ArrayList<Watch>();
		try {
			if(target == null){//target이 null인 경우 전체 목록 보이게
				pstmt = conn.prepareStatement("select * from watch");//전체 리스트 출력
			}
			else{
					pstmt = conn.prepareStatement
							("select * from watch where " +target +" like ?");
					pstmt.setString(1, "%"+keyword+"%");
				}
			rs = pstmt.executeQuery();
			while (rs.next()){
				watch = new Watch(); 
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchs.add(watch);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return watchs;
	}
	

	//새로 만든 메소드
		public void updateClick(Connection conn, int watchId, int inc) //watch객체 받을 필요 x, watchId를 매개변수로 받음, 몇씩 증가할건지 inc변수도 만듦
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("update watch set watchClick = watchClick+"+ inc +" where watchId=?");//fav에 inc를 더해서 지정한 수 만큼 증가하게 만듦
				pstmt.setInt(1, watchId);//매개변수를 db watchId에 맵핑
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
	
	public void update(Connection conn, Watch watch) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update watch set watchname=?,brand=?,price=?, "
					+ "   watchImage=?,memo=?,watchTime=?,watchStyle=?,"
					+ " watchAge=?,watchType=?,watchImage1=?,"
					+ "watchImage2=?,watchImage3=? where watchId=?");
			pstmt.setString(1, watch.getWatchName());
			pstmt.setString(2, watch.getBrand());
			pstmt.setInt(3, watch.getPrice());
			pstmt.setString(4, watch.getWatchImage());
			pstmt.setString(5, watch.getMemo());
			pstmt.setTimestamp(6,new Timestamp(watch.getWatchTime().getTime()));
			pstmt.setString(7, watch.getWatchStyle());
			pstmt.setString(8, watch.getWatchAge());
			pstmt.setString(9, watch.getWatchType());
			pstmt.setString(10, watch.getWatchImage1());
			pstmt.setString(11, watch.getWatchImage2());
			pstmt.setString(12, watch.getWatchImage3());
			pstmt.setInt(13, watch.getWatchId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	/*
	public List<Watch> selectBrand(Connection conn, String Brand) //브랜드 별로 보기
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Watch watch = null; 
		List<Watch> watchs = new ArrayList<Watch>();
		try {
				pstmt = conn.prepareStatement
						("select * from watch where brand =?");
				pstmt.setString(1, Brand);
			
			rs = pstmt.executeQuery();
			while (rs.next()){
				watch = new Watch(); 
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchs.add(watch);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return watchs;
	}
	
	public List<Watch> selectBrandType(Connection conn, String Brand, String Type) //브랜드내 소재별로 보기
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Watch watch = null; 
		List<Watch> watchs = new ArrayList<Watch>();
		try {
				pstmt = conn.prepareStatement
						("select * from watch where brand =? and watchType = ?");
				pstmt.setString(1, Brand);
				pstmt.setString(2, Type);
			
			rs = pstmt.executeQuery();
			while (rs.next()){
				watch = new Watch(); 
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchs.add(watch);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return watchs;
	}*/
	
	public List<Watch> sortingList1(Connection conn,String sorting,String Brand) //브랜드 전체 정렬
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Watch> watchList = null;
		try {
			if(sorting == null){
				pstmt = conn.prepareStatement
					("select * from watch where brand = ?");
				pstmt.setString(1, Brand);
			}else if(sorting.equals("lowPrice")){
				pstmt = conn.prepareStatement("select * from watch where brand=? order by price");
				pstmt.setString(1, Brand);
			}else if(sorting.equals("highPrice")){
				pstmt = conn.prepareStatement("select * from watch where brand=? order by price desc");
				pstmt.setString(1, Brand);
			}else if(sorting.equals("new")){
				pstmt = conn.prepareStatement("select * from watch where brand=? order by watchTime desc");
				pstmt.setString(1, Brand);
			}else if(sorting.equals("fav")){
				pstmt = conn.prepareStatement("select * from watch where brand=? order by watchClick desc");
				pstmt.setString(1, Brand);
			}
			rs  = pstmt.executeQuery(); 
			watchList = new ArrayList<Watch>();
			while (rs.next()){
				Watch watch = new Watch();
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchList.add(watch);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return watchList;
	}
	
	public List<Watch> sortingList2(Connection conn,String sorting,String Brand,String Type) //브랜드 소재 정렬
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Watch> watchList = null;
		try {
			if(sorting == null){
				pstmt = conn.prepareStatement
					("select * from watch where brand = ? and watchType=?");
				pstmt.setString(1, Brand);
				pstmt.setString(2, Type);
			}else if(sorting.equals("lowPrice")){
				pstmt = conn.prepareStatement("select * from watch where brand=? and watchType=? order by price");
				pstmt.setString(1, Brand);
				pstmt.setString(2, Type);
			}else if(sorting.equals("highPrice")){
				pstmt = conn.prepareStatement("select * from watch where brand=? and watchType=? order by price desc");
				pstmt.setString(1, Brand);
				pstmt.setString(2, Type);
			}else if(sorting.equals("new")){
				pstmt = conn.prepareStatement("select * from watch where brand=? and watchType=? order by watchTime desc");
				pstmt.setString(1, Brand);
				pstmt.setString(2, Type);
			}else if(sorting.equals("fav")){
				pstmt = conn.prepareStatement("select * from watch where brand=? and watchType=? order by watchClick desc");
				pstmt.setString(1, Brand);
				pstmt.setString(2, Type);
			}
			rs  = pstmt.executeQuery(); 
			watchList = new ArrayList<Watch>();
			while (rs.next()){
				Watch watch = new Watch();
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchList.add(watch);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return watchList;
	}
	
	public List<Watch> selectPrice(Connection conn, String searchPrice) //가격대 검색
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Watch watch = null; 
		List<Watch> watchs = new ArrayList<Watch>();
		try {
			if(searchPrice.equals("0")){
				pstmt = conn.prepareStatement
						("select * from watch");
			}else if(searchPrice.equals("1")){
				pstmt = conn.prepareStatement
						("select * from watch where (price<100000)");
			}else if(searchPrice.equals("2")){
				pstmt = conn.prepareStatement
						("select * from watch where (price>=100000 and price<200000)");
			}else if(searchPrice.equals("3")){
				pstmt = conn.prepareStatement
						("select * from watch where (price>=200000 and price<300000)");
			}else if(searchPrice.equals("4")){
				pstmt = conn.prepareStatement
						("select * from watch where (price>=300000)");
			}
			rs = pstmt.executeQuery();
			while (rs.next()){
				watch = new Watch(); 
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchs.add(watch);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return watchs;
	}
	
	
	public List<Watch> selectBoth(Connection conn, String target, String keyword,String searchPrice) //시계 검색과 가격 동시검색
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Watch watch = null; 
		List<Watch> watchs = new ArrayList<Watch>();
		try {
			if(target == null){//target이 null인 경우 전체 목록 보이게
				pstmt = conn.prepareStatement("select * from watch");//전체 리스트 출력
			}
			else{
					if(searchPrice==null){
						pstmt = conn.prepareStatement
								("select * from watch where " +target +" like ?");
						pstmt.setString(1, "%"+keyword+"%");
					}
					else if(searchPrice.equals("0")){
					pstmt = conn.prepareStatement
							("select * from watch where " +target +" like ?");
					pstmt.setString(1, "%"+keyword+"%");
					}else if(searchPrice.equals("1")){
						pstmt = conn.prepareStatement
								("select * from watch where " +target +" like ? and price<100000");
						pstmt.setString(1, "%"+keyword+"%");
					}else if(searchPrice.equals("2")){
						pstmt = conn.prepareStatement
								("select * from watch where " +target +" like ? and (price>=100000 and price<200000)");
						pstmt.setString(1, "%"+keyword+"%");
					}else if(searchPrice.equals("3")){
						pstmt = conn.prepareStatement
								("select * from watch where " +target +" like ? and (price>=200000 and price<300000)");
						pstmt.setString(1, "%"+keyword+"%");
					}else if(searchPrice.equals("4")){
						pstmt = conn.prepareStatement
								("select * from watch where " +target +" like ? and price>=300000");
						pstmt.setString(1, "%"+keyword+"%");
					}
				}
			rs = pstmt.executeQuery();
			while (rs.next()){
				watch = new Watch(); 
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchs.add(watch);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return watchs;
	}
	
	/*public List<Watch> selectPrice(Connection conn, String searchPrice) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Watch watch = null; 
		List<Watch> watchs = new ArrayList<Watch>();
		try {
			if(searchPrice == null){//target이 null인 경우 전체 목록 보이게
				pstmt = conn.prepareStatement("select * from watch");//전체 리스트 출력
			}
			else{
				if(searchPrice.equals("0")){
					pstmt = conn.prepareStatement
							("select * from watch");
				}else if(searchPrice.equals("1")){
					pstmt = conn.prepareStatement
							("select * from watch where (price<100000)");
				}else if(searchPrice.equals("2")){
					pstmt = conn.prepareStatement
							("select * from watch where (price>=100000 and price<200000)");
				}else if(searchPrice.equals("3")){
					pstmt = conn.prepareStatement
							("select * from watch where (price>=200000 and price<300000)");
				}else if(searchPrice.equals("4")){
					pstmt = conn.prepareStatement
							("select * from watch where (price>=300000)");
				}
			}
			rs = pstmt.executeQuery();
			while (rs.next()){
				watch = new Watch(); 
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watchs.add(watch);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return watchs;
	}*/
	
	/*
	public List<Watch> selectPrice(Connection conn, String searchPrice) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Watch watch = null; 
		List<Watch> watchs = new ArrayList<Watch>();
		try {
			if(searchPrice == "1"){//target이 null인 경우 전체 목록 보이게
				pstmt = conn.prepareStatement("select * from watch where price<10000");
			}
			else if(searchPrice == "2"){
				pstmt = conn.prepareStatement("select * from watch where price>=100000 and price<200000");
			}else if(searchPrice =="3"){
				pstmt = conn.prepareStatement("select * from watch where price>=200000");
			}
			rs = pstmt.executeQuery();
			while (rs.next()){
				watch = new Watch(); 
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watchs.add(watch);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return watchs;
	}
	*/
	
	public void deleteById(Connection conn, int watchId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from watch where watchId = ?");
			pstmt.setInt(1, watchId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	/*
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from watch");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	*/
	public List<Watch> selectList(Connection conn,String sorting) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Watch> watchList = null;
		try {
			if(sorting == null){
			pstmt = conn.prepareStatement
					("select * from watch");
			}else if(sorting.equals("lowPrice")){
				pstmt = conn.prepareStatement("select * from watch order by price");
			}else if(sorting.equals("highPrice")){
				pstmt = conn.prepareStatement("select * from watch order by price desc");
			}else if(sorting.equals("new")){
				pstmt = conn.prepareStatement("select * from watch order by watchTime desc");
			}else if(sorting.equals("fav")){
				pstmt = conn.prepareStatement("select * from watch order by watchClick desc");
			}
			rs  = pstmt.executeQuery(); 
			watchList = new ArrayList<Watch>();
			while (rs.next()){
				Watch watch = new Watch();
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchList.add(watch);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return watchList;
	}

	public List<Watch> selectList1(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Watch> watchList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from watch ");			
			rs  = pstmt.executeQuery(); 
			watchList = new ArrayList<Watch>();
			while (rs.next()){
				Watch watch = new Watch();
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchList.add(watch);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return watchList;
	}
	
	public List<Watch> selectListById(Connection conn, int watchId) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Watch> watchList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from watch where watchid = ?");		
			pstmt.setInt(1, watchId);
			rs  = pstmt.executeQuery(); 
			watchList = new ArrayList<Watch>();
			while (rs.next()){
				Watch watch = new Watch();
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchList.add(watch);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return watchList;
	}
	
	public List<Watch> selectListMyWatchStyle(Connection conn,String myWatchStyle) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Watch> watchList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from watch where watchStyle = ? order by watchClick desc limit 3");
			pstmt.setString(1, myWatchStyle);
			rs  = pstmt.executeQuery(); 
			watchList = new ArrayList<Watch>();
			while (rs.next()){
				Watch watch = new Watch();
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchList.add(watch);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return watchList;
	}
	
	public List<Watch> selectListNew(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Watch> watchList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from watch order by watchClick desc limit 3");			
			rs  = pstmt.executeQuery(); 
			watchList = new ArrayList<Watch>();
			while (rs.next()){
				Watch watch = new Watch();
				watch.setWatchId(rs.getInt(1));
				watch.setWatchName(rs.getString(2));
				watch.setBrand(rs.getString(3));
				watch.setPrice(rs.getInt(4));
				watch.setWatchImage(rs.getString(5));
				watch.setMemo(rs.getString(6));
				watch.setWatchTime(rs.getTimestamp(7));
				watch.setWatchClick(rs.getInt(8));
				watch.setWatchStyle(rs.getString(9));
				watch.setWatchAge(rs.getString(10));
				watch.setWatchType(rs.getString(11));
				watch.setWatchImage1(rs.getString(12));
				watch.setWatchImage2(rs.getString(13));
				watch.setWatchImage3(rs.getString(14));
				watchList.add(watch);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return watchList;
	}
}




















