

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page  import="com.mysql.jdbc.Driver" %>
<%@page  import="Beans.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
        
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
 
                 $("#tabs").tabs();
                 $("#ekle").button();
                 $("#kaydet").button();
                 
                 sira=1;
                 sayi=$("#girdiSayisi").val();
                      
                 $("#kaydet").click(function(){
                document.ekleme.submit(); 
                            });
                 $("#butonGuncelle").click(function(){
                 document.icerik.submit(); 
                            });
                 $("#ekle").click(function(){
                 sira++;
                 $("#soruTable").append("<tr><td><input type=\"text\" name=\"txt"+sira+"\" id=\"txt"+sira
                 +"\"value=\"\""+"size=\"42\"/></td></tr>"); 
                                    });
                 $("#butonEkle").click(function(){
                sayi++;
                $("#duzenleTable").append("<tr><<td><input type=\"text\" name=\"txt"+sayi
                     +"\" value=\"\""+"size=\"48\"/></td></tr>"); 
                     document.duzenle.girdiSayisi.value(sayi);
                                    });
                 $("#butonGit").click(function(){
          var deger=$("#txtSayac").val();
          if(deger.length<1){alert("Soru numarasını giriniz!!")}
          else{
              $("#sayac").val(deger-1);
              document.yon.submit();
          }
          
                    });
                                
                                
                                
                                });  
      
                 function herhangi(deger){
                  
                  if(deger===0){
                      $("#sayac").val(($("#sayac").val())-1);
                      document.yon.submit();
                      }
                  else{
                      $("#sayac").val(parseInt(($("#sayac").val()))+1);
                      document.yon.submit();
                    }
              }; 
  
    
    </script>
    
    <style>
        .ui-menu { width: 250px; }
    </style>
    
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
        
            if(anket_id==null){
    
            }else{
    
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

    
    %>

<div id="tabs" >
    <ul>
        <li><a href="#tabs-1">SORU DETAY</a></li>
        <li><a href="#tabs-2">SORU EKLE</a></li>
        <li>Anket Adı: <%=Anket_Ad%><br><p>Anket Soru Sayısı:<%=soruSayisi%></li>
    </ul>
    
    <div id="tabs-1" >
        
        <% 
        if(soruSayisi!=0){
        %>
         
        <form action="sorular.jsp?anket_id=<%=anket_id%>" name="yon" method="POST" style="float: left;">
            
            <%
            String sayac=request.getParameter("sayac");
            int sayacInt=0;
            int a=0;
            
                if(sayac!=null){
                sayacInt=Integer.parseInt(sayac);
                if(sayacInt<0){sayacInt=0;}
                else if(sayacInt>soruSayisi-1){sayacInt=soruSayisi-1;}
                else{}
            %>
            <input type="hidden" name="sayac" id="sayac" value="<%=sayacInt%>" />
            <%
            }else{
            %>
            <input type="hidden" name="sayac" id="sayac" value="<%=a%>" />
            <%
            
            }

            %>
            
            
        <table>
            <%
            
            %>
            
               <tr>
                  <td>Soru:<%=sayacInt+1%><button type="button" id="butonAzalt" name="butonAzalt" onClick="herhangi(0);" > <img  width="32" height="15" src="img/sol.png"/></button></td>
                  <td><button type="button" id="butonArttir" name="butonArttir" onClick="herhangi(1);" ><img  width="32" height="15" src="img/sag.png"/> </button></td>
               </tr>
    
         </table>
        
        </form> 
                 
                 
                   
                   <table>
                       
                   <tr>
                   <td><button id="butonGuncelle" onClick="guncelle(<%=sayac%>);" type="button" >GÜNCELLE</button></td>
                   <td><a      href="soruSil.jsp?soru_id=<%=dizi[sayacInt%soruSayisi]%>&anket_id=<%=anket_id%>&sayac=<%=sayacInt%>"> <button name="butonSil" id="butonSil">SİL</button></a></td>
                   <td><button type="button" id="butonEkle">SORUYA ŞIK EKLE</button></td>
                   <td><input  type="text" name="txtSayac" id="txtSayac" value="" size="5" /><button type="button" name="butonGit" id="butonGit" >GİT</button></td>
                   </tr>
               
                   </table>
                    
    
                 
                 
    <form name="icerik" action="soruDuzenle.jsp?soru_id=<%=dizi[sayacInt%soruSayisi]%>&anket_id=<%=anket_id%>&sayac=<%=sayacInt+""%>" method="POST">
    <table id="duzenleTable" name="duzenleTable" >
                           <%   
         
        String query3="SELECT * FROM `anket`.`soru` WHERE soru_id=?;";
        PreparedStatement pstmt3 = (PreparedStatement) database.sorgu(query3);
        
        String query4="SELECT * FROM `anket`.`cevap` WHERE soru_id=?;";
        PreparedStatement pstmt4 = (PreparedStatement) database.sorgu(query4);
        
               
                int  girdisayisi=0;
                int  gelen=0;
                
                pstmt3.setString(1,dizi[sayacInt%soruSayisi]);
                ResultSet result3=pstmt3.executeQuery();
                
                while(result3.next()){
                out.println("<tr>");
                out.print("<td><textarea name=\"txtSoru\" style=\"width:300px;height:120px;\">"+result3.getString("soru")+"</textarea></td>");
                out.println("</tr>");
                }
                pstmt4.setString(1,dizi[sayacInt%soruSayisi]);
                ResultSet result4=pstmt4.executeQuery();
                
                while(result4.next()){
                girdisayisi++;     
                out.println("<tr>");
                out.println("<td width=\"30%\"><input type=\"text\" name=\"txt"+girdisayisi+"\" value=\""+result4.getString("cevap")+"\" size=\"48\"/></td>");
                out.println("</tr>");
                }      
                %>
                
                <input type="hidden" name="girdiSayisi" id="girdiSayisi" value="<%=girdisayisi%>"/>
               
                <%
                 }else{
                 out.println("Bu Ankete Ait Soru Eklenmemiştir..");
                 }
                %>                   
                         
                     </table>
                   
                   </form>
                   
                
    </div>

                
        <div id="tabs-2" >
        <form name="ekleme" action="soruEkleme.jsp?anket_id=<%=anket_id%>&sayac=<%=soruSayisi+""%>" method="POST">
        <table id="soruTable" name="soruTable" >
        <tr>
            <td><textarea name="txtSoru" rows="6" cols="40"></textarea></td>
            <td></td>
        </tr>
        <tr colspan="2">
            <td><input type="text" name="txt1" id="txt1" value="" size="42" /></td>
        </tr>
        
    </table>
        
        <table>
            <tr>
            <td><input type="button" value="Soruyu Kaydet" id="kaydet" name="kaydet"/></td>
            <td><input type="button" value="Şık Ekle" id="ekle" name="ekle"/></td>
        </tr>
        </table>
            
            </form>
  </div>
</div>
    <%
        }
    %>
                    
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