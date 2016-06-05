<%-- 
    Created on : 27.Eyl.2013, 21:23:26
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.*"%>
<%@page import="Beans.*"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    
<head>
    <meta    http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Anket Ekranı</title>
    <script  type="text/javascript" src="../JS/sinavSoru.js"></script>
    <script  type="text/javascript" src="jquery.js"></script>
    <script  type="text/javascript" src="../JS/sinavEkran.js"></script>
    
    <script  type="text/javascript" src="jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <link    type="text/css" href="jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
    <link    type="text/css" href="css/personel.css" rel="Stylesheet"/>
    <script  language="JavaScript">
   
   <%
       
       Uye uye=(Uye)session.getAttribute("UyeInfo");

 if(uye==null){
     response.sendRedirect("Anasayfa/");
 }else{
     Date date=new Date();
    String anket_id=request.getParameter("anket_id");
    session.setAttribute("sira", 0);
        
    veritabani.baglanti database = new veritabani.baglanti();
                    
    String query ="SELECT * FROM `anket`.`uye_sonuc` WHERE  anket_id=? AND uye_id=?;";
    PreparedStatement pstmt = database.sorgu(query);

    pstmt.setInt(1,Integer.parseInt(anket_id));
    pstmt.setInt(2,Integer.parseInt(uye.getId()));
    ResultSet result = pstmt.executeQuery();
    
    int durum=0;
    if(result.next()){
    durum=1;
    }
    if(durum==1){
    response.sendRedirect("Uye/");
    }else{
        
    String query2 ="INSERT INTO `anket`.`uye_sonuc`"
                + " (`uye_id`,`anket_id`,`giris_zaman`,`giris_ip`)"
                + " VALUES(?,?,?,?);";
    PreparedStatement pstmt2 = database.sorgu(query2);
        
    pstmt2.setInt(1,Integer.parseInt(uye.getId()));
    pstmt2.setInt(2,Integer.parseInt(anket_id));
    pstmt2.setString(3,date.getDay()+"/"+date.getMonth()+"/2013");
    pstmt2.setString(4,request.getRemoteAddr());
    int sonuc2=pstmt2.executeUpdate();
    
    String query3 ="SELECT * FROM `anket`.`anket_icerik` WHERE  anket_id=?;";
    PreparedStatement pstmt3 = database.sorgu(query3);
        
    pstmt3.setInt(1,Integer.parseInt(anket_id));
    ResultSet result3 = pstmt3.executeQuery();
    
    String query4 ="SELECT COUNT(*) FROM `anket`.`anket_icerik` WHERE  anket_id=?;";
    PreparedStatement pstmt4 = database.sorgu(query4);
    
    pstmt4.setInt(1,Integer.parseInt(anket_id));
    ResultSet result4 = pstmt4.executeQuery();
    
    int boyut=0;
    if(result4.next()){boyut=result4.getInt(1);}
        
    int dizi[]=new int[boyut];   
    
    int i=0;
    while(result3.next()){
         dizi[i]=result3.getInt("soru_id");
         i++;
     }
    OzellikArray array=new OzellikArray();
    array.setDizi(dizi);
    session.setAttribute("array", array);
     
    %>
    

    $(document).ready(function(){

    });
    
     function anketBasla() {
    $( "#dialog-confirmm" ).dialog({
      resizable: true,
      height:240,
      width:440,
      modal: true,
      buttons: {
        "Başla": function() {
        $.ajax({
            type: "POST",
            url: 'anketSoru.jsp',
            data: "anket_id="+<%=anket_id%>,
            success: function (sonuc) {
            document.getElementById("soruSayfasi").innerHTML=sonuc;
                                      }
            });
            
          $( this ).dialog( "close" );

        }
      }
    });
  }
function anketBitir() {
    $( "#dialog-confirmmm" ).dialog({
      resizable: true,
      height:240,
      width:440,
      modal: true,
      buttons: {
        "Evet": function() {
            window.location.href="Uye/";
                $( this ).dialog( "close" );
        },
        Hayır: function() {
             
          $( this ).dialog( "close" );
        }
      }
    });
  }
  
  
  var resNesne;
if (navigator.appName.search("Microsoft")>-1) {
    resNesne=new ActiveXObject("MSXML2.XMLHTTP");   
}else {
    resNesne=new XMLHttpRequest();
}
  function SoruKaydet(anket_id,soru_id,cevap_id){
           var anket_id1=anket_id;
           var soru_id1=soru_id;
           var cevap_id1=cevap_id;
           resNesne.open('get','SoruKaydet.jsp?anket_id='+anket_id1+'&soru_id='+soru_id1+'&cevap_id='+cevap_id1,true);
           resNesne.onreadystatechange=handleResponse;
           resNesne.send(null);
           
}

function handleResponse(){
    if (resNesne.readyState == 4) {
        document.getElementById("soruSayfasi").innerHTML=resNesne.responseText;
    } 
}
   
</script>
</head>

<body>
<div id="dialog-confirmm" title="Anket Başlıyor ?" style="display: none;">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Soruları görmeye hazırsanız lütfen Başla'ya tıklayın.!</p>
</div>   

<div id="dialog-confirmmm" title="Sınav Bitiyor ?" style="display: none;">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Anketi bitirmek istediğinize emin misin?!</p>
</div> 

<script language="JavaScript">anketBasla();</script>

<div name="soruSayfasi" style="position:absolute;left:250px;top:250px;">
                
    <form name="fff">
                <table class="CSSTableGenerator" id="soruSayfasi" border="1" cellpadding="1" cellspacing="0" style="width:800px; height: 300px;">
                    
                </table>
    </form>
</div>
 

 <%
 }
 }
 %>
  
</body>
</html>
