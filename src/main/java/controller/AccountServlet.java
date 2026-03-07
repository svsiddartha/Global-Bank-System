package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.User;
import service.AccountServies;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/account")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		HttpSession session = request.getSession();
		User user =(User)session.getAttribute("loggedUser");
		if(user == null) {
			response.sendRedirect("login.jsp");
		}
		Random rand = new Random();
		String acc = "GB"+(1000000+rand.nextInt(9000000));
		
		 Account account = new Account();
		 
		 account.setUserId(user.getId());
		 account.setAccountNumber(acc);
		 account.setBalance(0);
		 account.setAccountType(request.getParameter("type"));
		 
		 AccountServies servies = new AccountServies();
		 boolean check = servies.checkUser(user.getId());
		 if(check) {
			 response.sendRedirect("dashboard.jsp?account=exists");
			 return;
		 }
		 boolean status = servies.createAccount(account);
		 if(status) {
			 response.sendRedirect("dashboard.jsp?account=created");
		 } else {
			 response.sendRedirect("login.jsp?error=1");
		 }
		
		
		
	}

}
