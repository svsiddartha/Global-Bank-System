package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Account;
import util.DBconnection;

public class AccountDAO {
	
	public boolean createAccount(Account account) {

		try {
			Connection con = DBconnection.getConnection();
			String sql = "insert into accounts(user_id,account_number,balance,account_type)values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, account.getUserId());
			ps.setString(2, account.getAccountNumber());
			ps.setDouble(3, account.getBalance());
			ps.setString(4, account.getAccountType());
			int num =  ps.executeUpdate();
			
			return num>0;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateBalnce(int accoutId,double amount) {
		
		try {
			
				Connection con = DBconnection.getConnection();
				
				String sql = "update accounts set balance = balance+? where account_id = ?";
				
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setDouble(1, amount);
				ps.setInt(2, accoutId);
				
				int num = ps.executeUpdate();
				
				return num>0;		
				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
		
	}
	
	public Account getAccountByUser(int userId) {
		
		try {
			
			Connection con = DBconnection.getConnection();
			String sql = "select * from accounts where user_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				Account account = new Account();
				account.setAccountId(rs.getInt("account_id"));
				account.setUserId(rs.getInt("user_id"));
				account.setAccountNumber(rs.getString("account_number"));
				account.setBalance(rs.getDouble("balance"));
				account.setAccountType(rs.getString("account_type"));
				
				return account;
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean accountExits(int userId) {
		
		try {
			
			Connection con = DBconnection.getConnection();
			String sql = "select * from accounts where user_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
				return true;
			}
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		return false;
	}
	
	public double getBalance(int accountId) {
		
		try {
			
			Connection con = DBconnection.getConnection();
			String sql = "select balance from accounts where account_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, accountId);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getDouble("balance");
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public boolean withDraw(int accountId,double amount) {
		try {
			
			Connection con = DBconnection.getConnection();
			String sql = "update accounts set balance = balance - ? where account_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setDouble(1, amount);
			ps.setInt(2, accountId);
			
			
			int num = ps.executeUpdate();
			
			return num>0;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	public boolean transferMoney(String fromAccount,String toAccount, double amount) {
		
		try {
			
			Connection con = DBconnection.getConnection();
			con.setAutoCommit(false);
			String witdraw = "update accounts set balance = balance-? where account_number=?";
			PreparedStatement ps = con.prepareStatement(witdraw);
			ps.setDouble(1, amount);
			ps.setString(2, fromAccount);
			
			int w = ps.executeUpdate();
			
			String deposit = "update accounts set balance = balance + ? where account_number=?";
			PreparedStatement ps2 = con.prepareStatement(deposit);
			ps2.setDouble(1, amount);
			ps2.setString(2, toAccount);
			
			int d = ps2.executeUpdate();
			
			if(w>0 && d>0) {
				con.commit();
				return true;
			}
			else {
				con.rollback();
				return false;
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public double getBalance(String accountNumber){

	    try{

	        Connection con = DBconnection.getConnection();

	        String sql = "select balance from accounts where account_number=?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setString(1, accountNumber);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){
	            return rs.getDouble("balance");
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return 0;
	}
}
