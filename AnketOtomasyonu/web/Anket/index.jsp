<%-- 
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
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
        function clearText(field)
        {
            if (field.defaultValue == field.value)
                field.value = '';
            else if (field.value == '')
                field.value = field.defaultValue;
        }
    </script>
    
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/jquery.nivo.slider.js" type="text/javascript"></script>
    <%
      Uye  uye=(Uye)session.getAttribute("UyeInfo");
      
      if(uye==null)
      {
      response.sendRedirect("../Anasayfa/index.jsp?giris=false");
      } 
      else
      {
      String anket_id=request.getParameter("anket_id");
      if(anket_id!=null){
      String isim=uye.getAd().toString();
      String soyisim=uye.getSoyad().toString();
    %>

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
            
            $("#gonderbutton").click(function () {
            $.ajax({
            type: "POST",
            url: '../yorumKayit.jsp',
            data: "anket_id="+<%=anket_id%>+"&uye_id="+<%=uye.getId()%>+"&yorum="+$("#MESAJ").val(),
            success: function (sonuc) {
            alert(sonuc);
                                      }
            });
            });
            
            $("#txtAc").click(function () {
            document.location.href="../anketEkran.jsp?anket_id=<%=anket_id%>";
            });
            
            
            
           
            
            
        });
        
        function begen(anket_id){
        
         $.ajax({
            type: "POST",
            url: '../Begeni_Guncelle.jsp',
            data: "begeni="+$("#list_begeni").val()+"&anket_id="+anket_id,
            success: function (sonuc) {
             alert("Beğeni Kaydedildi.");
            
                                      }
            });
            
        }

    </script>
    
    
</head>
<body>


    
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

                                <div class="sb_box">
    <h3><img src="../icons/png/32x32/search.png" width="32" height="32" alt="Arama"/>Arama</h3>
    
    <div id="search">
        <form action="" method="get">
            <input type="text" value="" name="ARAMA" size="10" id="searchfield" title="ARAMA" onfocus="clearText(this)" onblur="clearText(this)" />
            <input type="button" name="ARA" value="ARA" id="searchbutton" title="ARA" />
        </form>
    </div>
</div>
            </div>

            <div id="templatemo_content">
                    
            <div class="content_box">
            <div class="w_100" style="width: 560px;">
            <h4><img src="../icons/png/32x32/info.png" width="32" height="32" alt="Üye Girişi"/>Anket Bilgiler</h4>
            <ul class="lbe_list_w100">
                <%
                    veritabani.baglanti database = new veritabani.baglanti();
                    
                    String query2 = "SELECT * FROM anket.anket_anahat where anket_id=?;";
                    PreparedStatement pstmt2 = database.sorgu(query2);
                    pstmt2.setInt(1,Integer.parseInt(anket_id));
                    ResultSet result2 = pstmt2.executeQuery();
                    
                    String  Tarih="";
                    String  Anket_Ad="";
                    String  Anket_Aciklama="";
                    int uye_id=0;
                    
                    if(result2.next()) {
                    Tarih=result2.getString("tarih");
                    Anket_Ad=result2.getString("anket_ad");
                    Anket_Aciklama=result2.getString("anket_aciklama");
                    uye_id=result2.getInt("uye_id");
                    }
                    
                    String query = "SELECT * FROM anket.uye where uye_id=?;";
                    PreparedStatement pstmt = database.sorgu(query);
                    pstmt.setInt(1, uye_id);
                    ResultSet result = pstmt.executeQuery();
                    
                    String Ad="";
                    String Soyad="";
                    
                    if(result.next()){
                    Ad=result.getString("uye_ad");
                    Soyad=result.getString("uye_soyad");
                    }
                    
                    
                    String query3 = "SELECT count(anket_id) from anket.uye_sonuc where anket_id=?;";
                    PreparedStatement pstmt3 = database.sorgu(query3);
                    pstmt3.setInt(1, Integer.parseInt(anket_id));
                    ResultSet result3 = pstmt3.executeQuery();
                    int katilimSayisi=1;
                    
                    if(result3.next()){
                    katilimSayisi=result3.getInt(1);
                    if(katilimSayisi==0){katilimSayisi=1;}
                    }
                    
                    String query4 = "SELECT sum(anket_begeni) from anket.uye_sonuc where anket_id=?;";
                    PreparedStatement pstmt4 = database.sorgu(query4);
                    pstmt4.setInt(1, Integer.parseInt(anket_id));
                    ResultSet result4 = pstmt4.executeQuery();
                    int begeniToplami=0;
                    
                    if(result4.next()){
                    begeniToplami=result4.getInt(1);
                    }
                    
                    String query5 = "SELECT * FROM anket.uye_sonuc where anket_id=? and uye_id=?;";
                    PreparedStatement pstmt5 = database.sorgu(query5);
                    pstmt5.setInt(1, Integer.parseInt(anket_id));
                    pstmt5.setInt(2, Integer.parseInt(uye.getId()));
                    ResultSet result5 = pstmt5.executeQuery();
                    Boolean durum=false;
                    int begeni=0;
                    
                    if(result5.next()){
                    durum=true;
                    begeni=result5.getInt("anket_begeni");
                    }
                    
                    out.print("<table class='anketbilgi'>");
                    out.print("<tr>");
                    out.print("<td>Anket Sahibi:</td>");
                    out.print("<td>"+Ad+" "+Soyad+"</td>");
                    out.print("</tr>");
                    out.print("<tr>");
                    out.print("<td>Anket Ad:</td>");
                    out.print("<td>"+Anket_Ad+"</td>");
                    out.print("</tr>");
                    out.print("<tr>");
                    out.print("<td>Oluşturulma Tarihi:</td>");
                    out.print("<td>"+Tarih+"</td>");
                    out.print("</tr>");
                    out.print("<tr>");
                    out.print("<td>Açıklama:</td>");
                    out.print("<td>"+Anket_Aciklama+"</td>");
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    out.print("<td>Katılım Sayısı:</td>");
                    out.print("<td>"+katilimSayisi+"</td>");
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    out.print("<td>Beğeni:</td>");
                    out.print("<td>"+(begeniToplami/katilimSayisi)+"/10</td>");
                    out.print("</tr>");
                    out.print("</table>");
                     
                     if(!durum){
                     out.print("<input  type = 'button' value = 'ANKETE KATIL' name = 'txtAc' id='txtAc' />");
                     }else{
                         
                     out.print("<table>");    
                     out.print("<tr>");
                     out.print("<td><h6 style='color:red;'>ANKETE KATILDINIZ..LÜTFEN ANKETE PUAN VERİN</h6></td>");
                    %>
                    <td>
                        <select name="list_begeni" id="list_begeni" onchange="begen(<%=anket_id%>);">
                            <option><%=begeni%></option>
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                        </select>   
                        
                        
                    </td>
                
                
                     <%
                     out.print("</tr>");
                     out.print("</table>");
                         
                    String query6 = "SELECT * FROM anket.yorum where anket_id=? and yorum_durum=?;";
                    PreparedStatement pstmt6 = database.sorgu(query6);
                    pstmt6.setInt(1, Integer.parseInt(anket_id));
                    pstmt6.setInt(2, 1);
                    ResultSet result6 = pstmt6.executeQuery();
                    String ad;
                    String soyad;
                    String yorum;
                    int j=0;
                    out.print("<table><th colspan='3'><td><b>YORUMLAR</b></td></th>");
                    while(result6.next()){
                    j++;
                    yorum=result6.getString("yorum");
                    pstmt.setInt(1, result6.getInt("uye_id"));
                    result = pstmt.executeQuery();
                    while(result.next()){
                    ad=result.getString("uye_ad");
                    soyad=result.getString("uye_soyad");
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(ad+" ");
                    out.print(soyad+" :");
                    out.print("</td>");
                    out.print("<td>");
                    out.print(yorum);
                    out.print("</td>");
                    out.print("</tr>");
                    }}
                    
                    if(j==0){out.print("<tr><td>Bu Anket İçin Henüz Yorum Yapılmamıştır.</td></tr>");}
                    out.print("</table>");
                     
                    
                    %>
                
        <div class="sb_box">
        <div id="contact_form">
        <h4><img src="../icons/png/48x48/comments.png" width="48" height="48" alt="YORUM YAZ"/>YORUM YAZ</h4>
      
      <form action="" method="post">
      <label for="MESAJ">MESAJ:</label> 
      <textarea id="MESAJ" name="MESAJ" class="input_field" ></textarea>
      <input type="button" name="gonderbutton" value="GÖNDER" id="gonderbutton" title="GÖNDER" />
      </form> 
      
        </div>
        </div>     
                         
                         
                         
                         <%
                     }
                     
                    ///yorumlar
                    /// beğen
                    /// anket bitince bu ankete katıldınız diyecek ve oylayın diyecek
                    
                %>

            </ul>
            </div>
            </div>
                
                
                </div>
            <div class="cleaner"></div>
        </div>

   <jsp:include page="../fouter.jsp"></jsp:include>
    </div> 
</div>
<script type='text/javascript' src='js/logging.js'></script>

</body>
<%
      }else{
      response.sendRedirect("../Anasayfa/");
      }}
%>
</html>
