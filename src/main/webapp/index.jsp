<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Global Bank System</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(to right,#1e3c72,#2a5298);
}

.container{
    width:400px;
    background:white;
    padding:40px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.3);
}

h1{
    color:#1e3c72;
    margin-bottom:20px;
}

p{
    color:#555;
    margin-bottom:30px;
}

.btn{
    display:block;
    width:100%;
    padding:12px;
    margin:15px 0;
    text-decoration:none;
    color:white;
    font-size:18px;
    border-radius:8px;
    transition:0.3s;
}

.login{
    background:#28a745;
}

.login:hover{
    background:#218838;
}

.register{
    background:#007bff;
}

.register:hover{
    background:#0056b3;
}

.footer{
    margin-top:20px;
    color:#777;
    font-size:14px;
}

</style>

</head>
<body>

<div class="container">

    <h1>Global Bank System</h1>

    <p>Secure Online Banking Application</p>

    <a href="login.jsp" class="btn login">User Login</a>

    <a href="register.jsp" class="btn register">User Registration</a>

    <div class="footer">
        © 2026 Global Bank System
    </div>

</div>

</body>
</html>
