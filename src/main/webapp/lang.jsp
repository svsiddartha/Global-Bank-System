<%@ page import="java.util.*" %>

<%
String lang = (String)session.getAttribute("lang");

if(lang == null){
    lang = "en";
    session.setAttribute("lang", lang);
}

Locale locale = new Locale(lang);

ResourceBundle rb = ResourceBundle.getBundle("messages", locale);

request.setAttribute("rb", rb);
%>