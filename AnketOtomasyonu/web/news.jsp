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
    <title>En Yeni Anketler</title>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="style.css"/>
    <script language="javascript" type="text/javascript">
        function clearText(field)
        {
            if (field.defaultValue == field.value)
                field.value = '';
            else if (field.value == '')
                field.value = field.defaultValue;
        }
    </script>
    
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.nivo.slider.js" type="text/javascript"></script>


    <script type="text/javascript" >
        $(document).ready(function() {
            $("#searchbutton").click(function () {
            $.ajax({
            type: "POST",
            url: 'aramaSonuc2.jsp',
            data: "target="+$("#searchfield").val(),
            success: function (sonuc) {
             document.getElementById("templatemo_content").innerHTML=sonuc;
                                      }
            });
            });
        });

    </script>
    
    
</head>
<body>

    <%
      Uye  uye=(Uye)session.getAttribute("UyeInfo");
      
      if(uye==null)
      {
      response.sendRedirect("Anasayfa/index.jsp?giris=false");
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
                
                                        <div id="templatemo_menu">
                        <ul>
                            <li><a href="Anasayfa/">Üye Sayfası</a></li>
                            <li><a href="news.jsp" class="current">En Yeni Anketler</a></li>
                            <li><a href="counts.jsp">En Çok Oylanan Anketler</a></li>
                            <li><a href="likes.jsp">En Çok Beğenilen Anketler</a></li>
                            <li><a href="comments.jsp">En Çok Yorumlanan Anketler</a></li>
                            
                        </ul>    	
                                        </div>

                
                <div class="sb_box">
    <h3><img src="icons/png/32x32/search.png" width="32" height="32" alt="Arama"/>Arama</h3>
    
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
            <h4><img src="icons/png/32x32/tag_blue.png" width="32" height="32" alt="Üye Girişi"/>En Yeni Anketler</h4>
            <ul class="lbe_list_w100">
                <%  int dizi[]=new int[15];
                    
                    veritabani.baglanti database = new veritabani.baglanti();
                    String query = "SELECT * FROM anket_anahat where durum=1 Order By anket_id DESC LIMIT 15;";
                    PreparedStatement pstmt = database.sorgu(query);
                    ResultSet result = pstmt.executeQuery();
                    int i=0;
                    while (result.next()) {
                        dizi[i]=result.getInt("anket_id");
                        i++;
                        out.print("<form action='Anket/' method='post' name='formyeni" + result.getInt("anket_id") + "' >");
                        out.print("<input type='hidden' name='anket_id' value='" + result.getInt("anket_id") + "'>");
                        out.println("<li><a href='javascript:void(0)' onclick='document.formyeni" + result.getInt("anket_id") + ".submit();'>" + result.getString("anket_ad") + "<span>" + result.getString("tarih") + "</span></a></li>");
                        out.print("</form>");
                    }

                %>

            </ul>
        </div>
            </div>
                           <div class="content_box">
                               
                       <%       
                    int katilim_sayisi=0;
                    int bayan_sayisi=0;
                    int bay_sayisi=0;
                    int yas_ortalamasi=0;
                    
                   
                    String query2 = "SELECT * FROM anket.uye_sonuc where anket_id=?;";
                    PreparedStatement pstmt2 = database.sorgu(query2);
                    ResultSet result2;
                    
                    String query3 = "SELECT * FROM anket.uye where uye_id=?;";
                    PreparedStatement pstmt3 = database.sorgu(query3);
                    ResultSet result3;
                    String sql="";
                    for(int j=0;j<15;j++){
                    pstmt2.setInt(1,dizi[j]);
                    result2 = pstmt2.executeQuery();
                    while (result2.next()) {
                        sql=sql+","+result2.getInt("uye_id");
                             
                        
                        pstmt3.setInt(1, result2.getInt("uye_id"));
                        result3 = pstmt3.executeQuery();
                            while(result3.next()){
                                           
                                           if(result3.getString("uye_cinsiyet")!="" && result3.getInt("uye_yas")!=0){katilim_sayisi++;}
                                           
                                           if(result3.getString("uye_cinsiyet")!=" "){
                                           if(result3.getString("uye_cinsiyet").equals("Bay")){bay_sayisi++;}
                                           if(result3.getString("uye_cinsiyet").equals("Bayan")){bayan_sayisi++;}}
                                           
                                           if(result3.getInt("uye_yas")!=0){yas_ortalamasi+=result3.getInt("uye_yas");}

                                           }
                            
                    }
                    
                    }
                                        String sehir="";

                    if(sql.length()>1){
                    sql=sql.substring(1,sql.length());
                    
                    String query4 = "select COUNT(uye_sehir) AS toplam, uye_sehir from uye where  uye_id IN ('"+sql+"') GROUP BY uye_sehir  Order By toplam DESC LIMIT 1;";
                    PreparedStatement pstmt4 = database.sorgu(query4);
                    ResultSet result4=pstmt4.executeQuery();
                    if(result4.next()){sehir=result4.getString("uye_sehir");}}
                %>    
                                
                <table id="rounded-corner">
                    <tr>
                        <td>Toplam Katılım</td>
                        <td>Katılım Bayan Sayısı</td>
                        <td>Katılım Bay Sayısı</td>
                        <td>Katılım Yaş Ortalaması</td>
                        <td>En çok katılan Şehir</td>
                    </tr>
                    
                    <tr>
                        <td style="text-align: center;"><%=katilim_sayisi%></td>
                        <td style="text-align: center;"><%=bayan_sayisi%></td>
                        <td style="text-align: center;"><%=bay_sayisi%></td>
                        <td style="text-align: center;"><% if(katilim_sayisi!=0){out.print(yas_ortalamasi/(katilim_sayisi));}else{out.print("0");}%></td>
                        <td style="text-align: center;"><%=sehir%></td>
                    </tr>
                </table>    
                            </div>
                
                </div>
            <div class="cleaner"></div>
        </div>

            <jsp:include page="fouter.jsp"></jsp:include>
    </div> 
</div>
<script type='text/javascript' src='js/logging.js'></script>

</body>
<%
      }
%>
</html>