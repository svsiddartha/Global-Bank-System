<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.Account, dao.AccountDAO" %>
<%@ page import="model.User" %>

<%@ include file="lang.jsp" %>

<%

Object obj = session.getAttribute("loggedUser");

if(obj == null){
    response.sendRedirect("login.jsp");
    return;
}

User user = (User) obj;

AccountDAO dao = new AccountDAO();
Account acc = dao.getAccountByUser(user.getId());

String msg = request.getParameter("msg");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><%= rb.getString("deposit.title") %></title>

<link rel="stylesheet" href="dashboard.css">

</head>

<body>

<div class="container">

<div class="header">

<h2><%= rb.getString("deposit.title") %></h2>

<a class="logout" href="dashboard.jsp">
<%= rb.getString("home") %>
</a>

</div>

<%
if(msg != null && msg.equals("success")){
%>
<p style="color:green;">
<%= rb.getString("deposit.success") %>
</p>
<%
}
else if(msg != null && msg.equals("failed")){
%>
<p style="color:red;">
<%= rb.getString("deposit.failed") %>
</p>
<%
}
%>

<div class="account-box">

<h3><%= rb.getString("account.details") %></h3>

<br>

<%= rb.getString("account.number") %> :
<%= acc.getAccountNumber() %>

<br><br>

<%= rb.getString("account.type") %> :
<%= acc.getAccountType() %>

<br><br>

<%= rb.getString("account.balance") %> :
₹ <%= acc.getBalance() %>

</div>

<h3><%= rb.getString("deposit.amount") %></h3>

<form action="deposit" method="post">

<input type="hidden" name="accountId" value="<%= acc.getAccountId() %>">

<br>

<%= rb.getString("amount") %> :

<br><br>

<input class="inp" type="text" name="amount" required>

<br><br>

<input class="inp" type="submit" 
value="<%= rb.getString("deposit.button") %>">

</form>

</div>

</body>
</html>