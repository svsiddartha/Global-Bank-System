<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.User" %>
<%@ page import="dao.AccountDAO,model.Account" %>
<%@ include file="lang.jsp" %>

<%


String account = request.getParameter("account");
String error = request.getParameter("error");

Object obj = session.getAttribute("loggedUser");

if(obj == null){
    response.sendRedirect("login.jsp");
    return;
}

User user = (User) obj;

AccountDAO dao = new AccountDAO();
Account acc = dao.getAccountByUser(user.getId());

boolean ex = (acc != null);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link rel="stylesheet" href="dashboard.css">

</head>

<body>

<div class="container">

<div class="header">

<div class="language">

<form action="setLang.jsp" method="post">

<select name="lang" onchange="this.form.submit()">
<option value="en" <%= "en".equals(session.getAttribute("lang")) ? "selected" : "" %>>English</option>
<option value="hi" <%= "hi".equals(session.getAttribute("lang")) ? "selected" : "" %>>Hindi</option>
<option value="te" <%= "te".equals(session.getAttribute("lang")) ? "selected" : "" %>>Telugu</option>
</select>

</form>

</div>

<h2>
<%= rb.getString("dashboard.welcome") %> 
<%= user.getFullname() %>
</h2>

<a class="logout" href="logout.jsp">
<%= rb.getString("logout") %>
</a>

</div>

<%
if(account != null && account.equals("exists")){
%>

<p style="color:green;">
<%= rb.getString("account.exists") %>
</p>

<%
}
else if(account != null && account.equals("created")){
%>

<p style="color:green;">
<%= rb.getString("account.created") %>
</p>

<%
}
else if("1".equals(error)){
%>

<p style="color:red;">
<%= rb.getString("account.failed") %>
</p>

<%
}
%>


<%
if(!ex){
%>

<h3><%= rb.getString("account.create") %></h3>

<form action="account" method="post">

<select name="type">

<option value="Saving"><%= rb.getString("account.saving") %></option>
<option value="Current"><%= rb.getString("account.current") %></option>

</select>

<br><br>

<input type="submit" value="<%= rb.getString("account.create") %>">

</form>

<%
}
%>


<%
if(ex){
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

<%= rb.getString("account.balance") %> : ₹ 
<%= acc.getBalance() %>

</div>


<div class="actions">

<a href="deposit.jsp">
<%= rb.getString("deposit.title") %>
</a>

<a href="withdraw.jsp">
<%= rb.getString("withdraw.title") %>
</a>

<a href="transfer.jsp">
<%= rb.getString("transfer.title") %>
</a>

<a href="history.jsp">
<%= rb.getString("history.title") %>
</a>

</div>

<%
}
%>

</div>

</body>
</html>