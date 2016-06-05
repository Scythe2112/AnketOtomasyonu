<%-- 
    Document   : soruSil
    Created on : 06.Oca.2014, 11:47:01
    Author     : Lenowo
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
        response.sendRedirect("Anasayfa/");
            
    }else{
    
        String soru_id=request.getParameter("soru_id");
        String anket_id=request.getParameter("anket_id");
        String sayac=request.getParameter("sayac");
       
    veritabani.baglanti database=new veritabani.baglanti();
    
    String query=" DELETE FROM `anket`.`anket_icerik` WHERE anket_id=? and soru_id=?;";
         
    PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
    pstmt.setInt(1, Integer.parseInt(anket_id));
    pstmt.setInt(2, Integer.parseInt(soru_id));
    int resultSet1=pstmt.executeUpdate();
    
    String query2=" DELETE FROM `anket`.`soru` WHERE soru_id=?;";
         
    PreparedStatement pstmt2 = (PreparedStatement) database.sorgu(query2);
    pstmt2.setInt(1, Integer.parseInt(soru_id));
    int resultSet2=pstmt2.executeUpdate();
    
    String query3=" DELETE FROM `anket`.`cevap` WHERE  soru_id=?;";
         
    PreparedStatement pstmt3 = (PreparedStatement) database.sorgu(query3);          
    pstmt3.setInt(1, Integer.parseInt(soru_id));
    int resultSet3=pstmt3.executeUpdate();
    
    response.sendRedirect("sorular.jsp?anket_id="+anket_id+"&sayac="+sayac);

    }
    
    
    
    %>
</body>
</html>
