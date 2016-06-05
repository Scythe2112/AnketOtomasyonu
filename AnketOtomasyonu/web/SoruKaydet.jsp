
<%-- 
    Document   : SoruKaydet
    Created on : 29.Eyl.2013, 22:44:25
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="methods.*"%>
<%@page import="Beans.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
</head>
<body>
       <%
 Uye uye=(Uye)session.getAttribute("UyeInfo");

 if(uye==null){
     response.sendRedirect("Anasayfa/");
 }
 else{
     
     int sira=(Integer)session.getAttribute("sira");
     String anket_id=request.getParameter("anket_id");
     String soru_id=request.getParameter("soru_id");
     String cevap_id=request.getParameter("cevap_id");
        
    veritabani.baglanti database = new veritabani.baglanti();
                    
   String query ="SELECT * FROM `anket`.`uye_cevap` WHERE  anket_id=? AND uye_id=? AND soru_id=?;";
   PreparedStatement pstmt = database.sorgu(query);

   pstmt.setInt(1,Integer.parseInt(anket_id));
   pstmt.setInt(2,Integer.parseInt(uye.getId()));
   pstmt.setInt(3,Integer.parseInt(soru_id));
   ResultSet result = pstmt.executeQuery();
    
   if(result.next()){
   String query33="UPDATE `anket`.`uye_cevap` SET `cevap_id` = ?"
                + " WHERE anket_id=? AND soru_id=? AND uye_id=?;"; 
        PreparedStatement pstmt33 = database.sorgu(query33);       
                pstmt33.setInt(1,Integer.parseInt(cevap_id));
                pstmt33.setInt(2,Integer.parseInt(anket_id));
                pstmt33.setInt(3,Integer.parseInt(soru_id));
                pstmt33.setInt(4,Integer.parseInt(uye.getId()));
                int sonuc2=pstmt33.executeUpdate();

        
    }else{
    
String query3 ="INSERT INTO `anket`.`uye_cevap`"
         + "(`uye_id`,"
         + "`anket_id`,"
         + "`soru_id`,"
         + "`soru_tur`,"
         + "`cevap_id`)"
         + "VALUES"
         + "(?,?,?,?,?);";
PreparedStatement pstmt3 = database.sorgu(query3);

pstmt3.setInt(1,Integer.parseInt(uye.getId()));
pstmt3.setInt(2,Integer.parseInt(anket_id));
pstmt3.setInt(3,Integer.parseInt(soru_id));
pstmt3.setInt(4,1);
pstmt3.setInt(5,Integer.parseInt(cevap_id));

boolean result3=pstmt3.execute();
    
    
    }
        Date date=new Date();
String query22 ="SELECT * FROM `anket`.`anket_icerik` WHERE  anket_id=?;";
PreparedStatement pstmt22 = database.sorgu(query22);
pstmt22.setInt(1, Integer.parseInt(anket_id));
ResultSet result22=pstmt22.executeQuery();
               
               int toplam=0;
               while(result22.next()){
                toplam=toplam+1;
               }
   
String query6 =" UPDATE `anket`.`uye_sonuc` "
                + " SET " 
                + " `giris_zaman` = ?,"    
                + " `giris_ip` = ?"
                + " WHERE anket_id=? AND uye_id=?;";
PreparedStatement pstmt6 = database.sorgu(query6);

pstmt6.setString(1,date.getDay()+"/"+date.getMonth()+"/"+date.getYear());
pstmt6.setString(2,request.getRemoteAddr());
pstmt6.setInt(3,Integer.parseInt(uye.getId()));
pstmt6.setInt(4,Integer.parseInt(anket_id));
int sonuc6=pstmt6.executeUpdate();

                        
    
     %>
     
     <%
    sira++;
    session.setAttribute("sira", sira);
 }
     %>
    <jsp:include page="anketSoru.jsp"></jsp:include>
</body>
</html>
