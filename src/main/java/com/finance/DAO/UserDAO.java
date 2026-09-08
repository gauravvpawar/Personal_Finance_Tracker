package com.finance.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.finance.config.DBConnection;
import com.finance.model.User;

public class UserDAO {

	static Connection con = null;
	static PreparedStatement psmtnt = null;
	static ResultSet rs = null;
//	=================== for user register
	public boolean registerUser(User user) 
	{

        String sql = "INSERT INTO users "
                   + "(name, email, password, cnfPassword) "
                   + "VALUES (?, ?, ?, ?)";

        try {
             con = DBConnection.getConnection();
             psmtnt = con.prepareStatement(sql);
        

            psmtnt.setString(1, user.getName());
            psmtnt.setString(2, user.getEmail());
            psmtnt.setString(3, user.getPassword());
            psmtnt.setString(4, user.getCnfPassword());

            int rows = psmtnt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
        finally
        {
        	DBConnection.closeConnection(con , psmtnt);
        }
    }
	
	// ======== for the login user
	public User loginUser(String email , String password)
	{
		try {
			con = DBConnection.getConnection();
			psmtnt = con.prepareStatement("select * from users where email = ? and password = ?");
			psmtnt.setString(1, email);
			psmtnt.setString(2, password);
			
			rs = psmtnt.executeQuery();
			
			  if (rs.next()) {

	                User user = new User();

	                user.setUid(rs.getInt("uid"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	                user.setCnfPassword(rs.getString("cnfPassword"));

	                return user;
	            }
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			DBConnection.closeConnection(con, psmtnt);
		}
		
		return null;
	}
	
	// === to fetch the single user details 
	public User getUserByEmail(String email) {

	    String sql = "SELECT uid, name, email "
	               + "FROM users "
	               + "WHERE email = ?";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql)
	    ) {

	        ps.setString(1, email);

	        try (ResultSet rs = ps.executeQuery()) {

	            if (rs.next()) {

	                User user = new User();

	                user.setUid(rs.getInt("uid"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));

	                return user;
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return null;
	}
	
	public User getUserById(int uid) {

	    String sql = "SELECT uid, name, email, password, cnfPassword, dob, gender "
	               + "FROM users WHERE uid = ?";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql)
	    ) {

	        ps.setInt(1, uid);

	        try (ResultSet rs = ps.executeQuery()) {

	            if (rs.next()) {

	                User user = new User();

	                user.setUid(rs.getInt("uid"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	                user.setCnfPassword(rs.getString("cnfPassword"));
	                user.setDob(rs.getDate("dob"));
	                user.setGender(rs.getString("gender"));

	                return user;
	            }
	        }

	    } catch (SQLException e) {

	        e.printStackTrace();
	    }

	    return null;
	}
	
	public boolean updatePassword(
	        String email,
	        String password) {

	    String sql =
	        "UPDATE users SET password = ?, cnfPassword = ? "
	      + "WHERE email = ?";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql)
	    ) {

	        ps.setString(1, password);
	        ps.setString(2, password);
	        ps.setString(3, email);

	        int rows = ps.executeUpdate();

	        return rows > 0;

	    } catch (SQLException e) {

	        e.printStackTrace();

	    }

	    return false;
	}
	
	// == update profile
	public boolean updateProfile(
	        int uid,
	        String name,
	        String password,
	        String cnfPassword,
	        String dob,
	        String gender) {

	    String sql =
	        "UPDATE users SET "
	        + "name = ?, "
	        + "password = ?, "
	        + "cnfPassword = ?, "
	        + "dob = ?, "
	        + "gender = ? "
	        + "WHERE uid = ?";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps =
	            con.prepareStatement(sql)
	    ) {

	        ps.setString(1, name);
	        ps.setString(2, password);
	        ps.setString(3, cnfPassword);

	        if (dob == null || dob.isEmpty()) {
	            ps.setDate(4, null);
	        } else {
	            ps.setDate(
	                4,
	                java.sql.Date.valueOf(dob)
	            );
	        }

	        ps.setString(5, gender);
	        ps.setInt(6, uid);

	        return ps.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}
}
