<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.Account,dao.AccountDAO" %>
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

String status = request.getParameter("status");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><%= rb.getString("transaction.title") %></title>

<link rel="stylesheet" href="dashboard.css">

</head>

<body>

<div class="container">

<h2><%= rb.getString("transaction.status") %></h2>

<br>

<div class="account-box">

<%= rb.getString("account.number") %> :
<%= acc.getAccountNumber() %>

<br><br>

<%= rb.getString("account.balance") %> :
₹ <%= acc.getBalance() %>

</div>

<br>

<%

if("withdraw_success".equals(status)){
%>
<p style="color:green;">
<%= rb.getString("withdraw.success") %>
</p>
<%
}
else if("withdraw_failed".equals(status)){
%>
<p style="color:red;">
<%= rb.getString("withdraw.failed") %>
</p>
<%
}
else if("deposit_success".equals(status)){
%>
<p style="color:green;">
<%= rb.getString("deposit.success") %>
</p>
<%
}
else if("transfer_success".equals(status)){
%>
<p style="color:green;">
<%= rb.getString("transfer.success") %>
</p>
<%
}
else if("transfer_failed".equals(status)){
%>
<p style="color:red;">
<%= rb.getString("transfer.failed") %>
</p>
<%
}
%>

<br><br>

<a href="dashboard.jsp">
<%= rb.getString("home") %>
</a>

</div>

</body>
</html>