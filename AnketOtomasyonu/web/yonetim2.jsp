<%-- 
    Document   : Kayit_Getir
    Created on : 28.Ara.2013, 18:06:41
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
            function uyeAktif(id){
            
            $.ajax({
            type: "POST",
            url: 'Kayit_Getir.jsp',
            data: "islem=1&uye_id="+id,
            success: function (sonuc) {

                if(sonuc==1){
                        alert("Kayıt Onaylandı.");

                        window.location.reload();
                    }
                                      }
            });    
            } 
            
            function uyeSil(id){
            
            $.ajax({
            type: "POST",
            url: 'Kayit_Getir.jsp',
            data: "islem=2&uye_id="+id,
            success: function (sonuc) {
 
                if(sonuc==2){
                        alert("Kayıt Reddedildi.");
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
         <tr><td><a href="yonetim.jsp"><img src="icons/png/48x48/accept_page.png" width="48" height="48" alt="Mesaj Onaylama"/>Mesaj Onaylama</a></td></tr>
         <tr><td><a href="#"><img src="icons/png/48x48/folder_accept.png" width="48" height="48" alt="Güncelleme Onaylama"/>Güncelleme Onaylama</a></td></tr>
         <tr><td><a href="yonetim3.jsp"><img src="icons/png/48x48/tag_green.png" width="48" height="48" alt="Anket Onaylama"/>Anket Onaylama</a></td></tr>
                    </table>
                </div> 
                </div>

            <div id="templatemo_content">
                <%
                       veritabani.baglanti database = new veritabani.baglanti();
                    
       String query = "SELECT * FROM anket.uye where uye_yetki=?;";
       PreparedStatement pstmt = database.sorgu(query);
       pstmt.setInt(1,4);
       ResultSet result = pstmt.executeQuery();
       
       out.println("<table id='rounded-corner'>");
       out.println("<tr><td>Üye Ad</td><td>Üye Soyad</td><td>Yaş</td><td>Cinsiyet</td><td>Şehir</td><td>Onay</td><td>Red</td></tr>");
       int i=0;
       while(result.next()){
       i++; 
       out.println("<tr>");
       out.println("<td>"+result.getString("uye_ad")+"</td>");
       out.println("<td>"+result.getString("uye_soyad")+"</td>");
       out.println("<td>"+result.getInt("uye_yas")+"</td>");
       out.println("<td>"+result.getString("uye_cinsiyet")+"</td>");
       out.println("<td>"+result.getString("uye_sehir")+"</td>");
       out.println("<td><a href='javascript:uyeAktif("+result.getString("uye_id")+")'><img src='icons/png/32x32/accept.png' width='32' height='32'/></a></td>");
       out.println("<td><a href='javascript:uyeSil("+result.getString("uye_id")+")'><img src='icons/png/32x32/block.png' width='32' height='32'/></a></td>");
       out.println("</tr>");
       }
       if(i==0){out.println("<tr><td colspan='7'>Üye Bilgileri Mevcut Değil</td></tr>");}
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
