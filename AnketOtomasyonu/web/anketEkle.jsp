
<%--
    Created on : 19.Ara.2013, 19:53:04
    Author     : Lenowo
--%>

<%@page import="methods.Aktar"%>
<%@page import="java.sql.*"%>
<%@page import="Beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    response.sendRedirect("Uye/");
                }
    else{
        
    String tarih=request.getParameter("anketTarih");
    String ad=request.getParameter("anketAd");
    String icerik=request.getParameter("anketIcerik");
    
        tarih=  Aktar.Degis(tarih);
        ad=     Aktar.Degis(ad);
        icerik= Aktar.Degis(icerik);
        
    veritabani.baglanti database=new veritabani.baglanti();
     
    String query2="SELECT MAX(anket_id) FROM `anket`.`anket_anahat` ;";
    PreparedStatement pstmt2 = (PreparedStatement) database.sorgu(query2);
    ResultSet result2 = pstmt2.executeQuery();
    int anket_id=0;    
        if(result2.next()){
        anket_id=result2.getInt(1)+3;
        }
        
    String query="INSERT INTO `anket`.`anket_anahat`"
                + " (`anket_id`,`uye_id`,`tarih`,`durum`,`anket_ad`,`anket_aciklama`)"
                + " VALUES(?,?,?,?,?,?);";
    
     PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
     pstmt.setInt(1,anket_id);
     pstmt.setInt(2,Integer.parseInt(uye.getId()));
     pstmt.setString(3,tarih);
     pstmt.setInt(4,2);
     pstmt.setString(5,ad);
     pstmt.setString(6,icerik);

     boolean result = pstmt.execute();
     response.sendRedirect("sorular.jsp?anket_id="+anket_id);
     
    }
        
    
    
    
    
    %>
</body>
</html>
