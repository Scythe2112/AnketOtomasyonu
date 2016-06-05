
<%-- 
    Document   : soruEkleme
    Created on : 17.Ara.2013, 14:35:19
    Author     : Lenowo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<%@page import="java.sql.*"%>
<%@page import="methods.Aktar"%>
<%@page  import="com.mysql.jdbc.Driver" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script  type="text/javascript" src="../jquery.js"></script>
    
    <script  type="text/javascript" >
      $(document).ready(function(){
          
      });  
        
    </script>
    
</head>
<body>
    <%
        
    Uye uye=(Uye)session.getAttribute("UyeInfo");

    if(uye==null){
    response.sendRedirect("Anasayfa/");
                  }
    else{
        
        String anket_id=request.getParameter("anket_id");
        String sayac=request.getParameter("sayac");
        String soru=request.getParameter("txtSoru");
        
        anket_id=Aktar.Degis(anket_id);
        sayac=Aktar.Degis(sayac);
        soru=Aktar.Degis(soru);

        int soru_id=0;
        String cevap=null;

        veritabani.baglanti database=new veritabani.baglanti();
        
        String query="SELECT MAX(soru_id) FROM `anket`.`soru` ;";
        PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
        soru_id=result.getInt(1)+3;
        }
        
  
        String query3="INSERT INTO `anket`.`soru`"
                + " (`soru_id`,`soru`,`soru_resim`)"
                + " VALUES(?,?,?);";
        
        PreparedStatement pstmt3 = (PreparedStatement) database.sorgu(query3);
        pstmt3.setInt(1, soru_id);
        pstmt3.setString(2, soru);
        pstmt3.setString(3, "");
        boolean sonuc3=pstmt3.execute();
        
        
                String query5="INSERT INTO `anket`.`anket_icerik`"
                + " (`anket_id`,`soru_id`)"
                + " VALUES(?,?);";
        
        PreparedStatement pstmt5 = (PreparedStatement) database.sorgu(query5);
        pstmt5.setInt(1, Integer.parseInt(anket_id));
        pstmt5.setInt(2, soru_id);
        boolean sonuc5=pstmt5.execute();
        
        
                String query4="INSERT INTO `anket`.`cevap`"
                + " (`soru_id`,`cevap`,`cevap_resim`,`soru_tur`)"
                + " VALUES(?,?,?,?);";
        
        PreparedStatement pstmt4= (PreparedStatement) database.sorgu(query4);
        int i=1;
        while(true){
         
         cevap=request.getParameter("txt"+i);
         if(cevap==null){break;}
         cevap=Aktar.Degis(cevap);
         
        pstmt4.setInt(1, soru_id);
        pstmt4.setString(2, cevap);
        pstmt4.setString(3, "");
        pstmt4.setInt(4, 1);
        boolean sonuc4=pstmt4.execute();
        i++;    
        }
        
         response.sendRedirect("sorular.jsp?anket_id="+anket_id+"&sayac="+sayac);
    
        }
%>
</body>
</html>
