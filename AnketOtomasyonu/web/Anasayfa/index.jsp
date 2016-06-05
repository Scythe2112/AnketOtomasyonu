<%@page import="Beans.Uye"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <%
    Uye  uye=(Uye)session.getAttribute("UyeInfo");
    if(uye!=null)
    {
     response.sendRedirect("../Uye/");
    }
    
    else
    {
    %>  
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ANMMY ANKET</title>
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

    

    <link   href="../css/nivo-slider.css" type="text/css" rel="stylesheet" media="screen" />
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/jquery.nivo.slider.js" type="text/javascript"></script>

   <script type="text/javascript" >
    $(document).ready(function(){
        $('#slider').nivoSlider({
                effect: 'random',
                slices: 15,
                animSpeed: 700,
                pauseTime: 2500,
                startSlide: 0, //Set starting Slide (0 index)
                directionNav: false,
                directionNavHide: false, //Only show on hover
                controlNav: false, //1,2,3...
                controlNavThumbs: false, //Use thumbnails for Control Nav
                pauseOnHover: true, //Stop animation while hovering
                manualAdvance: false, //Force manual transitions
                captionOpacity: 0.6, //Universal caption opacity
                beforeChange: function() {
                },
                afterChange: function() {
                },
                slideshowEnd: function() {
                } //Triggers after all slides have been shown
            });
            
        $("#girisbutton").click(function () {
            kuladi=$("#Eposta1").val();
            sifre=$("#Parola1").val();
            
        $.ajax({
            type: "POST",
            url: '../loginUye.jsp',
            data: "Eposta1="+kuladi+"&Parola1="+sifre,
            success: function (sonuc) {
                
                if (sonuc == 0) {
                     window.location.href="../Uye/"; 
                }else if(sonuc ==1){
                    alert("Email veya Şifre Hatalı");
                }else if(sonuc ==2){
                    alert("Veritabanı Bağlantı Hatası. Sistem Yönetici ile irtibata geçin.");
                }else if(sonuc==3){
                    alert("Kayıt işleminiz Onaylanmamıştır.E-Posta Adresinize Gönderilen Aktivasyon Bilgilerini Kontrol Edin.");
                }else if(sonuc==4){
                    window.location.href="../yonetim.jsp"; 
                }
            }
        });
    });
    
        $("#kayitbutton").click(function () {
            ad=$("#Ad").val();
            soyad=$("#Soyad").val();
            email=$("#Email2").val();
            parola=$("#Parola2").val();
            parola2=$("#ParolaR").val();
            
            if(ad.length<1){alert("Ad boş bırakılamaz");}
            else if(soyad.length<1){alert("Soyad boş bırakılamaz");}
            else if(email.length<1){alert("E-mail boş bırakılamaz");}
            else if(parola.length<6){alert("Parola En Az 6 Karakterden Oluşmalıdır");}
            else if(parola.length>12){alert("Parola En Fazla 12 Karakterden Oluşmalıdır");}
            else if(parola != parola2){alert("Şifre uyuşmazlığı! Lütfen Tekrar Deneyin.");}

            else{
            alert("giriş");
        $.ajax({
            type: "POST",
            url: '../kaydol.jsp',
            data: "Ad="+ad+"&Soyad="+soyad+"&Email2="+email+"&Parola2="+parola,
            success: function (sonuc) {
                alert(sonuc);
                if (sonuc == 0) {
                     alert("Girmiş olduğunuz E-Posta Adresi Sistemde Mevcut! Farklı bir E-Posta Giriniz."); 
                }else if(sonuc ==1){
                    alert("Kayıt Başarı ile Eklendi.Aktivasyon Bilgileri E-Posta Adresinize Gönderilmiştir.");
                    
                }else if(sonuc ==2){
                    alert("Kayıt İşlemi Başarısız oldu Lütfen Yeniden Deneyin.");
                }else if(sonuc ==3){
                    alert("Veritabanı Bağlantı Hatası. Sistem Yönetici ile irtibata geçin.");
                }else{
                      alert("bende bilmiyorum");

                }
                
            $("#Ad").val("");
            $("#Soyad").val("");
            $("#Email2").val("");
            $("#Parola2").val("");
            $("#ParolaR").val("");
            
            }
        });
        }
    });
        
        $("#searchbutton").click(function () {
            targett=$("#searchfield").val();
            $.ajax({
            type: "POST",
            url: '../aramaSonuc.jsp',
            data: "target="+targett,
            success: function (sonuc) {
             document.getElementById("templatemo_content").innerHTML=sonuc;
                                      }
            });
            });
    } );
    
</script>

</head>
<body>
  <%
  String giris=request.getParameter("giris");
  if(giris!=null){
  if(giris.equals("false")){
  %>
      <script language="javascript" type="text/javascript">
          alert("Ankete katılmak için Lütfen Üye Olun!")
    </script>
    
    
    <%
  
  }
  }
  
  %>
    <jsp:include page="../linkkontrol.jsp"></jsp:include>
    <div id="templamteo_body_wrapper">
    <div id="templatemo_wrapper">
    <div id="templatemo_main_top">
        
    </div>
    <div id="templatemo_main">
           
            
             <jsp:include page="../sol.jsp" ></jsp:include>
            <jsp:include page="../sag.jsp"></jsp:include>
            <div class="cleaner"></div>
                
            
    </div>
        
            <jsp:include page="../fouter.jsp"></jsp:include>
</div> 
</div>

</body>
<%
    }
%>
</html>