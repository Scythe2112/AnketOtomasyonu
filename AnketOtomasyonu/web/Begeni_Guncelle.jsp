<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Methods.*"%>
<%@page import="Beans.*"%>

 <%
 Uye uye=(Uye)session.getAttribute("UyeInfo");
 
 if(uye==null){ 
     response.sendRedirect("/Anasayfa/");
            }
 else{
 
        veritabani.baglanti database=new veritabani.baglanti();
        
        String begeni=request.getParameter("begeni");
        String anket_id=request.getParameter("anket_id");
        
        String query="UPDATE `anket`.`uye_sonuc` "
                + " SET " 
                + " `anket_begeni` = ?"
                + " WHERE uye_id= ? and anket_id=? ;";
        
        PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
        pstmt.setInt(1, Integer.parseInt(begeni));
        pstmt.setInt(2,Integer.parseInt(uye.getId()));
        pstmt.setInt(3,Integer.parseInt(anket_id));
        int sonuc=pstmt.executeUpdate();
 }
 %>
