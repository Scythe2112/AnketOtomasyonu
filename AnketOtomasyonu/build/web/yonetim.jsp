<%-- 
    Document   : yonetim
    Created on : 28.Ara.2013, 17:23:17
    Author     : Lenowo
--%>

<%@page import="java.sql.*"%>
<%@page import="Beans.Uye"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>KİŞİSEL ÜYE SAYFASI</title>
    <link type="text/css" rel="Stylesheet" href="style.css"/>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="jquery.js"></script>
    <script  type="text/javascript" src="jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
        
    <script language="javascript" type="text/javascript">
        function clearText(field)
        {
            if (field.defaultValue == field.value)
                field.value = '';
            else if (field.value == '')
                field.value = field.defaultValue;
        }

  
    </script>


    
    <script type="text/javascript" >
            function mesajAktif(id){
            
            $.ajax({
            type: "POST",
            url: 'Mesaj_Getir.jsp',
            data: "islem=1&yorum_id="+id,
            success: function (sonuc) {
                
                if(sonuc==1){
                        alert("Mesaj Onaylandı");
                    window.location.reload();}
                                      }
            });    
            } 
            
            function mesajSil(id){
            
            $.ajax({
            type: "POST",
            url: 'Mesaj_Getir.jsp',
            data: "islem=2&yorum_id="+id,
            success: function (sonuc) {
                
                if(sonuc==2){
                        alert("Mesaj Silindi");
                    window.location.reload();}
                                      }
            });    
            }    
            
        $(document).ready(function() {
   
         });

    </script>
    
    
</head>


<body>

    <%
        
      Uye  uye=(Uye)session.getAttribute("UyeInfo");
      if(uye==null || uye.getYetki()!=3)
      {
      response.sendRedirect("Anasayfa/");
      }
      else
      {
      String isim=uye.getAd().toString();
      String soyisim=uye.getSoyad().toString();
    %>

    <div id="templamteo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_main_top"></div>
               <div id="templatemo_main">
                  <div id="templatemo_sidebar">
                        <div class="sb_box">
                        <div id="contact_form">
                            <h4>Hoşgeldiniz Sayın:</h4>
                            <h5><% out.print(isim+" "+soyisim); %>&nbsp;&nbsp;&nbsp;<a href="logoutUye.jsp">Çıkış<img src="icons/png/32x32/unlock.png" width="32" height="32" alt="Arama"/></a></h5>
                        </div>
                    </div>  

                <div class="sb_box">
                    <table>
         <tr><td><a href="#"><img src="icons/png/48x48/accept_page.png" width="48" height="48" alt="Mesaj Onaylama"/>Mesaj Onaylama</a></td></tr>
         <tr><td><a href="yonetim2.jsp"><img src="icons/png/48x48/folder_accept.png" width="48" height="48" alt="Güncelleme Onaylama"/>Güncelleme Onaylama</a></td></tr>
         <tr><td><a href="yonetim3.jsp"><img src="icons/png/48x48/tag_green.png" width="48" height="48" alt="Anket Onaylama"/>Anket Onaylama</a></td></tr>
                    </table>
                </div> 
                </div>

            <div id="templatemo_content">
                <%
                       veritabani.baglanti database = new veritabani.baglanti();
                    
       String query = "SELECT * FROM anket.yorum where yorum_durum=?;";
       PreparedStatement pstmt = database.sorgu(query);
       pstmt.setInt(1,0);
       ResultSet result = pstmt.executeQuery();
       
       out.println("<table id='rounded-corner'>");
       out.println("<tr><td>Üye Id</td><td>Anket Id</td><td>Yorum</td><td>Onay</td><td>Red</td></tr>");
       int i=0;
       while(result.next()){
       i++; 
       out.println("<tr>");
       out.println("<td>"+result.getInt("uye_id")+"</td>");
       out.println("<td>"+result.getInt("anket_id")+"</td>");
       out.println("<td>"+result.getString("yorum")+"</td>");
       out.println("<td><a href='javascript:mesajAktif("+result.getString("yorum_id")+")'><img src='icons/png/32x32/accept.png' width='32' height='32'/></a></td>");
       out.println("<td><a href='javascript:mesajSil("+result.getString("yorum_id")+")'><img src='icons/png/32x32/block.png' width='32' height='32'/></a></td>");
       out.println("</tr>");
       }
       if(i==0){out.println("<tr><td colspan='5'>Yorum Mevcut değil</td></tr>");}
       out.println("</table>");
       
                
                
                
                %>

            </div>
            <div class="cleaner"></div>
            </div>


</div> 
</div>
<script type='text/javascript' src='js/logging.js'></script>
</body>
<%
}
%>
</html>