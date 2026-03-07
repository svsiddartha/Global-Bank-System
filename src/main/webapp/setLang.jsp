<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String lang = request.getParameter("lang");

if(lang != null){
    session.setAttribute("lang", lang);
}

String referer = request.getHeader("referer");

if(referer != null){
    response.sendRedirect(referer);
}else{
    response.sendRedirect("dashboard.jsp");
}

%>