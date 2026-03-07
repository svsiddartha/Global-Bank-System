package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBconnection;

public class UserDAO {

	
	 public boolean userRegistration(User user){
		
		 try {
			 
			 Connection con = DBconnection.getConnection();
			 
			 String sql = "insert into userss(full_name,email,password,phone) values(?,?,?,?)";
			 
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1, user.getFullname());
			 ps.setString(2, user.getEmail());
			 ps.setString(3, user.getPassword());
			 ps.setString(4, user.getPhone());
			 
			 
			 int num = ps.executeUpdate();
			 
			 	return num>0;
			 
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
	 
		 return false;
	 }
	 public User userLogin(String email,String password) {
		 
		 try {
			 
			 Connection con = DBconnection.getConnection();
			 String sql = "select * from userss where email=? and password=?";
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1, email);
			 ps.setString(2, password);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				User user = new User();
				 user.setId(rs.getInt("id"));
				 user.setFullname(rs.getString("full_name"));
				 user.setEmail(rs.getString("email"));
				 user.setPhone(rs.getString("phone"));
				 
				 return user;
			 }	 
			 
		} catch(Exception e) {
			 
			e.printStackTrace();
		 }
		 return null;
	 }
}
