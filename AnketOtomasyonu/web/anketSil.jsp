
<%-- 
    Document   : sinavSil
    Created on : 27.Tem.2013, 23:09:10
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="methods.*"%>
<%@page import="Beans.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
        <% 
Uye uye=(Uye)session.getAttribute("UyeInfo");

if(uye==null){
    response.sendRedirect("/Anasayfa/");
}
else{
    
        veritabani.baglanti database = new veritabani.baglanti();
        String anket_id=request.getParameter("anket_id");
        String query="DELETE FROM `anket`.`anket_anahat`"
         + "WHERE anket_id=?;";
        PreparedStatement pstmt = database.sorgu(query);
        pstmt.setInt(1, Integer.parseInt(anket_id));
        int resultSet1=pstmt.executeUpdate();
        response.sendRedirect("Uye/");
        
    
       %>
       
       <%
}
       %>
</body>
</html>
