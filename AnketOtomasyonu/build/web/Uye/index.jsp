<%-- 
    Document   : index
    Created on : 13.Ara.2013, 11:47:44
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
    <link type="text/css" rel="Stylesheet" href="../style.css"/>
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="../jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <script  type="text/javascript" src="../jquery.js"></script>
    <script  type="text/javascript" src="../jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
        
    <script language="javascript" type="text/javascript">
        function clearText(field)
        {
            if (field.defaultValue == field.value)
                field.value = '';
            else if (field.value == '')
                field.value = field.defaultValue;
        }
        
    function sil(id) {
    $("#dialog-confirm").dialog({
      resizable: true,
      height:240,
      width:440,
      modal: true,
      buttons: {
        "Evet": function() {
          window.location.href="../anketSil.jsp?anket_id="+id;
        },
        Hayır: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  }
  
  function degistir(durum,anket_id){
            $.ajax({
            type: "POST",
            url: '../anketDurum.jsp',
            data: "durum="+durum+"&anket_id="+anket_id,
            success: function (sonuc) {
            alert(sonuc);
            $.ajax({
            type: "POST",
            url: '../anketler.jsp',
            data: "",
            success: function (sonuc) {
             document.getElementById("templatemo_content").innerHTML=sonuc;
                                      }
            });
                                      }
            });
  }
  
  
  
    </script>


    
    <script type="text/javascript" >
        $(document).ready(function() {
            
            $("#iki").click(function () {
            $.ajax({
            type: "POST",
            url: '../anketOlustur.jsp',
            data: "",
            success: function (sonuc) {
             document.getElementById("templatemo_content").innerHTML=sonuc;
                                      }
            });
            });
            
            $("#searchbutton").click(function () {
            $.ajax({
            type: "POST",
            url: '../aramaSonuc.jsp',
            data: "target="+$("#searchfield").val(),
            success: function (sonuc) {
             document.getElementById("templatemo_content").innerHTML=sonuc;
                                      }
            });
            });
            
            $("#bir").click(function () {
            $.ajax({
            type: "POST",
            url: '../anketler.jsp',
            data: "",
            success: function (sonuc) {
             document.getElementById("templatemo_content").innerHTML=sonuc;
                                      }
            });
            });
            
            $("#dort").click(function () {
            $.ajax({
            type: "POST",
            url: '../Kayit_Guncelleme.jsp',
            data: "",
            success: function (sonuc) {
             document.getElementById("templatemo_content").innerHTML=sonuc;
                                      }
            });
            });
            
            
            

           
        });
            function guncelle(){
            $.ajax({
            type: "POST",
            url: '../Guncelleme_Getir.jsp',
            data: "selectSehir="+$("#selectSehir").val()+"&selectYas="+$("#selectYas").val()+"&cinsiyet="+ff.elements["cinsiyet"].value+"&checkYetki="+$('#checkYetki').val(),
            success: function (sonuc) {
             alert(sonuc);
                                      }
            });  
            
        }
        

    </script>
    
    
</head>


<body>

    <%
      Uye  uye=(Uye)session.getAttribute("UyeInfo");
      
      if(uye==null)
      {
      response.sendRedirect("../Anasayfa");
      }
      else
      {
      String isim=uye.getAd().toString();
      String soyisim=uye.getSoyad().toString();
    %>
      <div id="dialog-confirm" title="Emin misin?" style="display: none;">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Sınavı silerseniz bu sınava ait tüm kayıtlar silinecektir.Devam etmek istiyor musun?</p>
  </div>
    <jsp:include page="../linkkontrol.jsp"></jsp:include>
    
    <div id="templamteo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_main_top"></div>
               <div id="templatemo_main">
                  <div id="templatemo_sidebar">

                    <div class="sb_box">
                        <div id="contact_form">
                            <h4>Hoşgeldiniz Sayın:</h4>
                            <h5><% out.print(isim+" "+soyisim); %>&nbsp;&nbsp;&nbsp;<a href="../logoutUye.jsp">Çıkış<img src="../icons/png/32x32/unlock.png" width="32" height="32" alt="Arama"/></a></h5>
                        </div>
                    </div>  
                
                    <div id="templatemo_menu">
                        <ul>
                            <li><a href="../Anasayfa/" class="current">Üye Sayfası</a></li>
                            <li><a href="../news.jsp">En Yeni Anketler</a></li>
                            <li><a href="../counts.jsp">En Çok Oylanan Anketler</a></li>
                            <li><a href="../likes.jsp">En Çok Beğenilen Anketler</a></li>
                            <li><a href="../comments.jsp">En Çok Yorumlanan Anketler</a></li>
                            
                        </ul>    	
                    </div>

                <jsp:include page="../arama.jsp"></jsp:include>
                <div class="sb_box">
                    <table>
         <tr><td><a id="bir"><img src="../icons/png/48x48/chart.png" width="48" height="48" alt="Anket Analizi Al"/>Anketlerim</a></td></tr>
         <%
                            
                    veritabani.baglanti database = new veritabani.baglanti();
                    String query = "SELECT * from anket.uye where uye_id=? and uye_yetki=2;";
                    PreparedStatement pstmt = database.sorgu(query);
                    pstmt.setInt(1,Integer.parseInt(uye.getId()));
                    ResultSet result = pstmt.executeQuery();
                    
                    
                    if(result.next()){
                    %>
          <tr><td><a id="iki"><img src="../icons/png/48x48/add_page.png" width="48" height="48" alt="Anket Oluştur"/>Anket Oluştur</a></td></tr>
                    <%
                    }
                    %>
         
          <tr><td><a id="dort"><img src="../icons/png/48x48/refresh.png" width="48" height="48" alt="Bilgileri Güncelle"/>Bilgileri Güncelle</a></td></tr>
                    </table>
            </div> 
            </div>

            <jsp:include page="../sag.jsp"></jsp:include>
            <div class="cleaner"></div>
        </div>

   <jsp:include page="../fouter.jsp"></jsp:include>
    </div> 
</div>
<script type='text/javascript' src='js/logging.js'></script>

</body>
<%
      }
%>
</html>