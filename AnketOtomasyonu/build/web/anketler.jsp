
<%-- 
    Document   : sinavlar
    Created on : 19.Tem.2013, 14:02:03
    Author     : Nuri
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
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
    response.sendRedirect("/ANASAYFA/");
}
else{
       %>
       


<div>
    <table border="1" cellpadding="10" cellspacing="2" id="rounded-corner" style="width: 550px;">
        <thead>
            <tr>
                <td colspan="13">MEVCUT ANKETLER</td>
                
            </tr>
        </thead>
        <tbody>
        <tr>
            <td>Anket Ad</td>
            <td>Tarih</td>
           
            <td>Anket Sil</td>
            <td>Soruları Gör</td>
            <td>Anket Düzenle</td>
            <td>Sonuçları Gör</td>
        </tr>
        
        <%
        veritabani.baglanti database = new veritabani.baglanti();
        String query="SELECT * FROM `anket`.`anket_anahat` WHERE  uye_id=? and durum!=2;";
        PreparedStatement pstmt = database.sorgu(query);
        
        pstmt.setInt(1, Integer.parseInt(uye.getId()));
        ResultSet result = pstmt.executeQuery();
    
        String resim=null;
  
    
    while(result.next()){
        if(result.getInt("durum")==0){
        resim="../img/minus.png";
        }if(result.getInt("durum")==1){
        resim="../img/play.png";
        }
 
    out.println("<tr>");
    out.println("<td>"+result.getString("anket_ad")+"</td>");
    out.println("<td>"+result.getString("tarih")+"</td>");
    
    out.println("<td><a href=\"javascript:sil("
            +result.getString("anket_id")+")\"><img src=\"../img/close.png\"/></a></td>");
    
        out.println("<td><a href=\"../soruGor.jsp?anket_id="
            +result.getString("anket_id")+"\"><img src=\"../img/gor.png\"/></a></td>");
        
    out.println("<td><a href=\"../sorular.jsp?anket_id="
            +result.getString("anket_id")+"\"><img src=\"../img/duzenle.png\"/></a></td>");
    
    out.println("<td><a href=\"../anketDetay.jsp?anket_id="
            +result.getString("anket_id")+"\"><img src=\"../img/forward.png\"/></a></td>");
    out.println("</tr>");

    
        
    }}
        %>
        </tbody>
    </table>
</div> 
</body>
</html>
