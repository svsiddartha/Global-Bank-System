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
 * Servlet implementation class WithDraw
 */
@WebServlet("/withdraw")
public class WithDrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WithDrawServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		double amount = Double.parseDouble(request.getParameter("amount"));
		
		AccountDAO dao = new AccountDAO();
		double balance = dao.getBalance(accountId);
		
		if(balance>=amount) {
			boolean status = dao.withDraw(accountId, amount);
			if(status) {
				
				Transaction t = new Transaction();

				t.setAccountId(accountId);
				t.setType("withdraw");
				t.setAmount(amount);

				TransactionDAO tdao = new TransactionDAO();
				tdao.saveTransaction(t);
				
				response.sendRedirect("result.jsp?msg=sucsses");
			}
			else {
				response.sendRedirect("result.jsp?msg=failed");
			}
		}
		else {
			response.sendRedirect("dashboard.jsp?err=lowbalance");
		}
		
	}

}