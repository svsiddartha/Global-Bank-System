<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*,dao.TransactionDAO,model.Transaction" %>
<%@ page import="model.User,dao.AccountDAO,model.Account" %>

<%@ include file="lang.jsp" %>

<%

Object obj = session.getAttribute("loggedUser");

if(obj == null){
    response.sendRedirect("login.jsp");
    return;
}

User user = (User)obj;

AccountDAO adao = new AccountDAO();
Account acc = adao.getAccountByUser(user.getId());

if(acc == null){
%>
<p style="color:red;"><%= rb.getString("account.notfound") %></p>
<a href="dashboard.jsp"><%= rb.getString("home") %></a>
<%
return;
}

TransactionDAO dao = new TransactionDAO();
List<Transaction> list = dao.getTransactions(acc.getAccountId());

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><%= rb.getString("history.title") %></title>

<link rel="stylesheet" href="dashboard.css">

<style>

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

th{
background:#1877f2;
color:white;
padding:10px;
}

td{
padding:10px;
border-bottom:1px solid #ddd;
text-align:center;
}

tr:hover{
background:#f5f5f5;
}

</style>

</head>

<body>

<div class="container">

<h2><%= rb.getString("history.title") %></h2>

<br>

<div class="account-box">

<%= rb.getString("account.number") %> :
<%= acc.getAccountNumber() %>

<br><br>

<%= rb.getString("account.type") %> :
<%= acc.getAccountType() %>

<br><br>

<%= rb.getString("account.balance") %> :
₹ <%= acc.getBalance() %>

</div>

<table>

<tr>
<th><%= rb.getString("history.id") %></th>
<th><%= rb.getString("history.type") %></th>
<th><%= rb.getString("history.amount") %></th>
</tr>

<%

if(list.isEmpty()){
%>

<tr>
<td colspan="3"><%= rb.getString("history.notfound") %></td>
</tr>

<%
}

for(Transaction t : list){
%>

<tr>

<td><%= t.getTransactionId() %></td>

<td><%= t.getType() %></td>

<td>₹ <%= t.getAmount() %></td>

</tr>

<%
}
%>

</table>

<br><br>

<a href="dashboard.jsp">
<%= rb.getString("home") %>
</a>

</div>

</body>
</html>