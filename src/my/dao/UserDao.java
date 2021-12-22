package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.User;
import my.util.JdbcUtil;

public class UserDao {
	
	public void insert(Connection conn, User user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			if(user!=null){
			pstmt = conn.prepareStatement
			("insert into user (userId, pwd, userName, userBirth, address, phone)"
					+ " values(?,?,?,?,?,?)");
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserBirth());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getPhone());
			pstmt.executeUpdate();
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	

	public User selectById(Connection conn, String userId) //userId를 가져옴
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from user where userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				user = new User(); 
				user.setUserId(rs.getString(1));
				user.setPwd(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserBirth(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setPhone(rs.getString(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
	}
	
	
	public boolean checkPassword(Connection conn, String userId, String pwd) //패스워드 체크, 리턴값을 boolean
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		String dbpassword = null;//데이터베이스에서 가져오는 비밀번호
		try {
			pstmt = conn.prepareStatement
			("select * from user where userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				dbpassword = rs.getString(2);//두번째 칼럼에 있는 것이기때문에 getString(2)임!
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		if(pwd.equals(dbpassword))//사용자가 입력한 pw와 db에 있는 pw가 같으면 true리턴함, 틀리면 false리턴
			return true;
		else
			return false;
	}

	protected User setUserResult(ResultSet rs) throws SQLException {
		User user = new User();

		user.setUserId(rs.getString("userId"));
		user.setPwd(rs.getString("pwd"));
		user.setUserName(rs.getString("username"));
		user.setUserBirth(rs.getString("userBirth"));
		user.setAddress(rs.getString("address"));
		user.setPhone(rs.getString("phone"));
		
		return user;
	}
	
	public User select(Connection conn, String userName, String userbirth, String phone) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from user where username = ? and userbirth= ? and phone = ?");
			pstmt.setString(1, userName);
			pstmt.setString(2, userbirth);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return setUserResult(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public User select2(Connection conn, String userId, String userName, String userbirth) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from user where userId =? and userName = ? and userbirth=? ");
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userbirth);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return setUserResult(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	
	public List<User> selectLike(Connection conn, String target, String keyword) //유사검색 메소드 target과 keyword(찾을 내용)를 받음 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		List<User> users = new ArrayList<User>();
		try {
			if(target == null){//target이 null인 경우 전체 목록 보이게
				pstmt = conn.prepareStatement("select * from user");
			}else{
				pstmt = conn.prepareStatement
						("select * from user where " +target +" like ?");//like키워드를 사용하여 어떤 문장중에 키워드가 포함되어있는건 다 찾아라 물음표에 해당하는 부분이 밑에 행
						pstmt.setString(1, "%"+keyword+"%");//키워드를 포함한걸 다 찾자
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()){
				user = new User(); 
				user.setUserId(rs.getString(1));
				user.setPwd(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserBirth(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setPhone(rs.getString(6));
				user.setVip(rs.getInt(7));
				users.add(user);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return users;
	}
	
	//vip
			public void updateVip(Connection conn, String userId, int inc) //movie객체 받을 필요 x, movieId를 매개변수로 받음, 몇씩 증가할건지 inc변수도 만듦
					throws SQLException {
				PreparedStatement pstmt=null; 
				try {
					pstmt = conn.prepareStatement
					("update user set vip = vip+"+ inc +" where userId=?");//fav에 inc를 더해서 지정한 수 만큼 증가하게 만듦
					pstmt.setString(1, userId);//매개변수를 db movieId에 맵핑
					pstmt.executeUpdate(); 
				} catch (SQLException e){
					e.printStackTrace();
				} finally {
					//JdbcUtil.close(conn);
					JdbcUtil.close(pstmt);
				}
			}
	
	
	public void update(Connection conn, User user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update user set pwd=?,userName=?,userBirth=?,address=?, phone=? "
					+ "   where userId=?");
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserBirth());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getUserId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, String userId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from user where userId = ?");
			pstmt.setString(1, userId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	public List<User> selectListOrderByVip(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<User> userList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from user order by vip desc");			
			rs  = pstmt.executeQuery(); 
			userList = new ArrayList<User>();
			while (rs.next()){
				User user = new User();
				user.setUserId(rs.getString(1));
				user.setPwd(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserBirth(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setPhone(rs.getString(6));
				user.setVip(rs.getInt(7));
				userList.add(user);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return userList;
	}
}