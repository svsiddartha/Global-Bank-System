package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Transaction;
import util.DBconnection;

public class TransactionDAO {
	
	public boolean saveTransaction(Transaction t) {
		
		try {
			
			Connection con = DBconnection.getConnection();
			
			String sql = "insert into transactions(account_id,type,amount) values(?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, t.getAccountId());
			ps.setString(2, t.getType());
			ps.setDouble(3, t.getAmount());
			
			int num = ps.executeUpdate();
			return num>0;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
			
	}
	
	public List<Transaction> getTransactions(int accountId){

	    List<Transaction> list = new ArrayList<>();

	    try{

	        Connection con = DBconnection.getConnection();

	        String sql =
	        "select * from transactions where account_id=? order by transaction_id desc";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, accountId);

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()){

	            Transaction t = new Transaction();

	            t.setTransactionId(rs.getInt("transaction_id"));
	            t.setAccountId(rs.getInt("account_id"));
	            t.setType(rs.getString("type"));
	            t.setAmount(rs.getDouble("amount"));

	            list.add(t);
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return list;
	}

	
}
