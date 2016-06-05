<%-- 
    Document   : soruGetir
    Created on : 21.Tem.2013, 17:09:07
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="methods.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="Stylesheet" href="style.css"/>

</head>
<body>
    <div   id="sc" style="float: left; width: 15px;"><a href="Uye/"><img src="img/left.png"/></a></div>
<%
   
    Uye uye=(Uye)session.getAttribute("UyeInfo");
    if(uye==null){ response.sendRedirect("Anasayfa/");}
    else{
            
        String anket_id=request.getParameter("anket_id");
        veritabani.baglanti database = new veritabani.baglanti();

        
                if(anket_id!=null){
        String query="SELECT * FROM `anket`.`anket_icerik` WHERE anket_id=?;";
        PreparedStatement pstmt = database.sorgu(query);
        pstmt.setInt(1,Integer.parseInt(anket_id));
        ResultSet result=pstmt.executeQuery();
       
        String query2="SELECT * FROM `anket`.`soru` WHERE soru_id=?;";
        PreparedStatement pstmt2 = database.sorgu(query2);
        pstmt2.setInt(1,Integer.parseInt(anket_id));
        
        
        String query3="SELECT * FROM `anket`.`cevap` WHERE soru_id=?;";
        PreparedStatement pstmt3 = database.sorgu(query3);
        pstmt3.setInt(1,Integer.parseInt(anket_id));
  
                
                ResultSet result2;
                ResultSet result3;
                int i=1;
                int j=0;
               while(result.next()){
                out.println(" <center><div id='"+result.getInt("soru_id")+"div'><table style=' width:500px; height:60px; float:left;' id='rounded-corner'>");
                   
                pstmt2.setInt(1,result.getInt("soru_id"));
                result2=pstmt2.executeQuery();
                if(result2.next()){
                    out.println("<tr><td>Soru:"+i+"<br>");
                    out.println(result2.getString("soru"));
                    out.println("</td></tr>");
                }
                
                 pstmt3.setInt(1,result.getInt("soru_id"));
                 result3=pstmt3.executeQuery();
                 
                 while(result3.next()){
                    out.println("<tr><td>");
                    out.println(result3.getString("cevap"));
                    out.println("</td></tr>");
                 }
     
                out.println("</table></div></center>");
               i++; 
               j++;
               }
                
               if(j==0){out.print("<center><h5>Ankete Henüz Soru Eklenmemiş.</h5></center>");}
                
         }           
                    
    }
%>
</body>
</html>

