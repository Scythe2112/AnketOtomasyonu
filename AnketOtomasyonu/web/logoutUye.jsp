<%-- 
    Document   : logout
    Created on : 06.Kas.2012, 01:32:59
    Author     : Nrttn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
session.setAttribute("UyeInfo", null);
response.sendRedirect("Anasayfa/index.jsp");
%>  