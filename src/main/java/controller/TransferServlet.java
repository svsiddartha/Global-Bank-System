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
 * Servlet implementation class TransferServlet
 */
@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int fromAccountId = Integer.parseInt(request.getParameter("fromAccountId"));
        String fromAccount = request.getParameter("fromAccount");
        String toAccount = request.getParameter("toAccount");
        double amount = Double.parseDouble(request.getParameter("amount"));

        AccountDAO dao = new AccountDAO();
        double balance = dao.getBalance(fromAccount);

        if(balance >= amount){

            boolean status = dao.transferMoney(fromAccount, toAccount, amount);

            if(status){

                Transaction t = new Transaction();
                t.setAccountId(fromAccountId);
                t.setType("transfer");
                t.setAmount(amount);

                TransactionDAO tdao = new TransactionDAO();
                tdao.saveTransaction(t);

                response.sendRedirect("result.jsp?status=transfer_success");
            }
            else{
                response.sendRedirect("result.jsp?status=transfer_failed");
            }

        }else{
            response.sendRedirect("transfer.jsp?msg=insufficient");
        }
    }

}
