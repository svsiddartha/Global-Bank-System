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

if(acc == null){
%>

<p style="color:red;"><%= rb.getString("account.notfound") %></p>
<a href="dashboard.jsp"><%= rb.getString("home") %></a>

<%
return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><%= rb.getString("transfer.title") %></title>

<link rel="stylesheet" href="dashboard.css">

</head>

<body>

<div class="container">

<div class="header">

<h2><%= rb.getString("transfer.title") %></h2>

<a class="logout" href="dashboard.jsp">
<%= rb.getString("home") %>
</a>

</div>

<%
if("success".equals(msg)){
%>
<p style="color:green;">
<%= rb.getString("transfer.success") %>
</p>
<%
}else if("failed".equals(msg)){
%>
<p style="color:red;">
<%= rb.getString("transfer.failed") %>
</p>
<%
}else if("invalid".equals(msg)){
%>
<p style="color:red;">
<%= rb.getString("transfer.invalid") %>
</p>
<%
}else if("insufficient".equals(msg)){
%>
<p style="color:red;">
<%= rb.getString("transfer.insufficient") %>
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


<h3><%= rb.getString("transfer.details") %></h3>

<br>

<form action="transfer" method="post">

<input type="hidden" name="fromAccountId" value="<%= acc.getAccountId() %>">

<h4><%= rb.getString("transfer.from") %></h4>

<br>

<input class="inp" type="text" name="fromAccount" value="<%= acc.getAccountNumber() %>" readonly>

<br><br>

<h4><%= rb.getString("transfer.to") %></h4>

<br>

<input class="inp" type="text" name="toAccount" required>

<br><br>

<h4><%= rb.getString("amount") %></h4>

<br>

<input class="inp" type="text" name="amount" required>

<br><br>

<input type="submit" value="<%= rb.getString("transfer.button") %>">

</form>

<br><br>

</div>

</body>
</html>