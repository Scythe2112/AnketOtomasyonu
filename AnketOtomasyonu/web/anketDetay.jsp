<%-- 
    Document   : anketDetay
    Created on : 04.Oca.2014, 21:13:14
    Author     : Lenowo
--%>

<%@page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page  import="Beans.*" %>
<!DOCTYPE html>

<html>
<head>
    <meta    http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link    href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <script  src="js/jquery.min.js" type="text/javascript"></script>
    <script  src="js/jquery.js" type="text/javascript"></script>
    <script  src="js/jquery.nivo.slider.js" type="text/javascript"></script>
        
    <link    type="text/css" href="jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
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
    
    <script  type="text/javascript" >
      
    $(document).ready(function(){
                $("#panel").accordion();
                                });  

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
                            <li><a href="Anasayfa/" class="current">Üye Sayfası</a></li>
                            <li><a href="news.jsp">En Yeni Anketler</a></li>
                            <li><a href="counts.jsp">En Çok Oylanan Anketler</a></li>
                            <li><a href="likes.jsp">En Çok Beğenilen Anketler</a></li>
                            <li><a href="comments.jsp">En Çok Yorumlanan Anketler</a></li>
                        </ul>    	
     </div>


     </div>

     <div id="templatemo_content">
     
    <%
     
     String  anket_id=request.getParameter("anket_id");
     if(anket_id==null){}
     else{
    
     String  Anket_Ad=null;
     String  dizi[]=null;
     int     soruSayisi=0;
    
    veritabani.baglanti database=new veritabani.baglanti();
    
    String query="SELECT  * FROM `anket`.`anket_anahat` WHERE anket_id=?";
    PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
    
    String query2="SELECT * FROM `anket`.`anket_icerik` WHERE anket_id=?;";
    PreparedStatement pstmt2 = (PreparedStatement) database.sorgu(query2);
    
    String query1="SELECT COUNT(*) FROM `anket`.`anket_icerik` WHERE anket_id=?;";
    PreparedStatement pstmt1 = (PreparedStatement) database.sorgu(query1);

    pstmt.setString(1, anket_id);
    ResultSet result = pstmt.executeQuery();
    if(result.next()){Anket_Ad=result.getString("Anket_Ad");}
        
    
    pstmt1.setString(1, anket_id);
    ResultSet result1=pstmt1.executeQuery();
    if(result1.next()){soruSayisi=result1.getInt(1);}
            
    
    pstmt2.setString(1, anket_id);
    ResultSet result2=pstmt2.executeQuery();
    
    dizi=new String[soruSayisi];
    
    for(int i=0;result2.next();i++){
         dizi[i]=result2.getString("soru_id");
    }
    out.print("<h6>"+Anket_Ad+"</h6>");
    %>
    <div id="panel">
    <%
    
    String query3="SELECT * FROM `anket`.`soru` WHERE soru_id=?;";
    PreparedStatement pstmt3 = (PreparedStatement) database.sorgu(query3);


    
    for(int i=0;i<soruSayisi;i++){
        
    int cevap_id[]=new int[20];
    String cevap_ad[]=new String[20];
    
    String query4="SELECT * FROM `anket`.`cevap` WHERE soru_id=?;";
    PreparedStatement pstmt4 = (PreparedStatement) database.sorgu(query4);
    pstmt4.setString(1, dizi[i]);
    ResultSet result4 = pstmt4.executeQuery();
    int j=0;
    while(result4.next()){cevap_id[j]=result4.getInt("cevap_id");cevap_ad[j]=result4.getString("cevap");j++;}
        
    pstmt3.setString(1, dizi[i]);
    ResultSet result3 = pstmt3.executeQuery();
        
    out.print("<h3>");
    if(result3.next()){out.print(result3.getString("soru"));} 
    out.print("</h3>"); 
        
    out.print("<div>");
    out.print("<table>");
    for(int k=0;k<j;k++){
     
    String query5="SELECT * FROM `anket`.`uye_cevap` WHERE anket_id=? and soru_id=? and cevap_id=? ;";
    PreparedStatement pstmt5 = (PreparedStatement) database.sorgu(query5);
    pstmt5.setInt(1, Integer.parseInt(anket_id));
    pstmt5.setInt(2, Integer.parseInt(dizi[i]));
    pstmt5.setInt(3, cevap_id[k]);
    ResultSet result5 = pstmt5.executeQuery();
    
    int bayan_sayisi=0;
    int bay_sayisi=0;
    int yas_ortalamasi=0;
    int katilim_sayisi=0;
    String sql="";
    
    while(result5.next()){
    sql=sql+","+result5.getInt("uye_id");
    
    String query6= "SELECT * FROM anket.uye where uye_id=?;";
    PreparedStatement pstmt6 = database.sorgu(query6);
    pstmt6.setInt(1, result5.getInt("uye_id"));
    ResultSet result6 = pstmt6.executeQuery();
    
    while(result6.next()){
                                           
       if(result6.getString("uye_cinsiyet")!="" && result6.getInt("uye_yas")!=0){katilim_sayisi++;}
       if(result6.getString("uye_cinsiyet")!=""){
       if(result6.getString("uye_cinsiyet").equals("Bay")){bay_sayisi++;}
       if(result6.getString("uye_cinsiyet").equals("Bayan")){bayan_sayisi++;}}
       if(result6.getInt("uye_yas")!=0){yas_ortalamasi+=result6.getInt("uye_yas");}
       

    }
    
    }
    String sehir="";
    if(sql.length()>1){sql=sql.substring(1,sql.length());
        String query7 = "select COUNT(uye_sehir) AS toplam, uye_sehir from uye where  uye_id IN ('"+sql+"') GROUP BY uye_sehir  Order By toplam DESC LIMIT 1;";
                    PreparedStatement pstmt7 = database.sorgu(query7);
                    ResultSet result7=pstmt7.executeQuery();
                    if(result7.next()){sehir=result7.getString("uye_sehir");}
    
    }
    

                    
    if(katilim_sayisi==0){katilim_sayisi=1;}
    
        out.print("<tr>");
            out.print("<td>"+cevap_ad[k]+":</td>");
            out.print("<td>Bay Sayısı="+bay_sayisi+"</td>");
            out.print("<td>Bayan Sayısı="+bayan_sayisi+"</td>");
            out.print("<td>Yaş Ortalaması="+yas_ortalamasi/katilim_sayisi+"</td>");
            out.print("<td>Şehir="+sehir+"</td>");

        out.print("</tr>");
    
    
    }
    out.print("</table>");
    out.print("</div>");
        
    }
    }
     
     
    %>
</div>                   
</div>
<div class="cleaner"></div>
</div>
<jsp:include page="fouter.jsp"></jsp:include>
</div> 
</div>
<script type='text/javascript' src='js/logging.js'></script>

<%
}
%>
</body>

</html>