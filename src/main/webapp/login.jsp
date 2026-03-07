<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="lang.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><%= rb.getString("login.title") %></title>

<link rel="stylesheet" href="one.css">
</head>

<body>

<div class="main">

<div class="box">

<h2><%= rb.getString("login.title") %></h2>
<br>

<form action="login" method="post">

<label><%= rb.getString("login.email") %></label>
<input class="inp" type="email" name="email" required/><br><br>

<label><%= rb.getString("login.password") %></label>
<input class="inp" type="password" name="password" required/><br><br>

<input type="submit" value="<%= rb.getString("login.button") %>">

</form>

<br><br>

<h3><%= rb.getString("login.newuser") %></h3>
<br>

<a href="register.jsp">
<%= rb.getString("login.register") %>
</a>

<br><br>

<%
String msg = request.getParameter("msg");

if(msg != null && msg.equals("invalid")){
%>

<p style="color:red;">
<%= rb.getString("login.invalid") %>
</p>

<%
}
%>

</div>

</div>

</body>
</html>