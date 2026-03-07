package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import dao.TransactionDAO;
import model.Transaction;

/**
 * Servlet implementation class DepositServlet
 */
@WebServlet("/deposit")
public class DepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepositServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		double amount = Double.parseDouble(request.getParameter("amount"));
		
		AccountDAO accountdao = new AccountDAO();
		TransactionDAO transactiondao = new TransactionDAO();
		
		boolean updated = accountdao.updateBalnce(accountId, amount);
		
		if(updated) {
			Transaction t = new Transaction();
			t.setAccountId(accountId);
			t.setType("deposit");
			t.setAmount(amount);
			
			transactiondao.saveTransaction(t);
			
			response.sendRedirect("result.jsp?msg=deposit_sucsses");
		}
		else {
			response.sendRedirect("dashboard.jsp?msg=deposit_failed");
		}
		
	}

}
