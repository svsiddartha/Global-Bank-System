package service;

import dao.AccountDAO;
import model.Account;

public class AccountServies {
	
	private AccountDAO dao = new AccountDAO();
	
	public boolean createAccount(Account account) {
		return dao.createAccount(account);
	}
	public boolean checkUser(int userId) {
		return dao.accountExits(userId);
	}
	
	

}
