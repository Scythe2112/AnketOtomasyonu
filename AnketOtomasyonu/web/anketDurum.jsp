<%-- 
    Document   : sinavDurum
    Created on : 19.Tem.2013, 15:14:21
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Methods.*"%>
<%@page import="Beans.*"%>

    <% 
Uye uye=(Uye)session.getAttribute("UyeInfo");

if(uye==null){
    response.sendRedirect("Anasayfa/");
}
else{
        int durum=0;
    
        if(Integer.parseInt(request.getParameter("durum"))==0){
        durum=1;
        }
        if(Integer.parseInt(request.getParameter("durum"))==1){
        durum=0;
        }
        veritabani.baglanti database = new veritabani.baglanti();
        
        String query2= "Select count(anket_id) from anket.anket_icerik where anket_id=?;";
        PreparedStatement pstmt2 = database.sorgu(query2);
        pstmt2.setInt(1,Integer.parseInt(request.getParameter("anket_id")));
        ResultSet result2=pstmt2.executeQuery();
        
        int sayi=0;
        
        if(result2.next()){sayi=result2.getInt(1);}
        
        if(sayi==0){
        out.print("Anket'e Ait Soru olmadığı için anket Aktif Edilemiyor.");
        }else{  
        String query= " UPDATE `anket`.`anket_anahat` "
                + " SET " 
                + " `durum`= ?"
                + " WHERE anket_id= ? ;";
        PreparedStatement pstmt = database.sorgu(query);
        pstmt.setInt(1,durum);
        pstmt.setInt(2,Integer.parseInt(request.getParameter("anket_id")));
        int result=pstmt.executeUpdate();
        out.print("Değişiklik Kaydedildi.");
        
}   }
        %>    

