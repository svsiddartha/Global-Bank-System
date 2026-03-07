<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="lang.jsp" %>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">

<title><%= rb.getString("register.title") %></title>

<link rel="stylesheet" href="one.css">
</head>

<body>

<div class="main">

<div class="box">

<!-- Language selector -->
<div class="language">

<form action="setLang.jsp" method="post">

<select name="lang" onchange="this.form.submit()">
<option value="en" <%= "en".equals(session.getAttribute("lang")) ? "selected" : "" %>>English</option>
<option value="hi" <%= "hi".equals(session.getAttribute("lang")) ? "selected" : "" %>>Hindi</option>
<option value="te" <%= "te".equals(session.getAttribute("lang")) ? "selected" : "" %>>Telugu</option>
</select>

</form>

</div>
<br>

<h2><%= rb.getString("register.title") %></h2>
<br>

<form action="register" method="post">

<label><%= rb.getString("register.name") %></label>
<input class="inp" type="text" name="fullname" required/><br><br>

<label><%= rb.getString("register.email") %></label>
<input class="inp" type="email" name="email" required/><br><br>

<label><%= rb.getString("register.password") %></label>
<input class="inp" type="password" name="password" required/><br><br>

<label><%= rb.getString("register.phone") %></label>
<input class="inp" type="text" name="phone" required/><br><br>

<input type="submit" value="<%= rb.getString("register.button") %>"/>

</form>

<br>

<h3><%= rb.getString("register.haveaccount") %></h3>

<a href="login.jsp">
<%= rb.getString("login.title") %>
</a>

<br><br>

<%
String msg = request.getParameter("msg");

if(msg != null && msg.equals("created")){
%>

<p style="color: green;">
<%= rb.getString("register.success") %>
</p>

<%
}else if(msg != null && msg.equals("failed")){
%>

<p style="color: red;">
<%= rb.getString("register.failed") %>
</p>

<%
}
%>

</div>

</div>

</body>
</html>