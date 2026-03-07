package service;

import dao.UserDAO;
import model.User;

public class UserServies {
	
	private UserDAO dao = new UserDAO();
	
	public boolean register(User user) {
		return dao.userRegistration(user);
	}
	public User login(String email,String password) {
		return dao.userLogin(email, password);
	}
}
