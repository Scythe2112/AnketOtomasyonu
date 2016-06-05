package org.apache.jsp.Anasayfa;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Beans.Uye;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("      ");

    Uye  uye=(Uye)session.getAttribute("UyeInfo");
    if(uye!=null)
    {
     response.sendRedirect("../Uye/");
    }
    
    else
    {
    
      out.write("  \r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <title>ANMMY ANKET</title>\r\n");
      out.write("    <link href=\"../css/templatemo_style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("    <script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("        function clearText(field)\r\n");
      out.write("        {\r\n");
      out.write("            if (field.defaultValue == field.value)\r\n");
      out.write("                field.value = '';\r\n");
      out.write("            else if (field.value == '')\r\n");
      out.write("                field.value = field.defaultValue;\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("    <link   href=\"../css/nivo-slider.css\" type=\"text/css\" rel=\"stylesheet\" media=\"screen\" />\r\n");
      out.write("    <script src=\"../js/jquery.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("    <script src=\"../js/jquery.nivo.slider.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("   <script type=\"text/javascript\" >\r\n");
      out.write("    $(document).ready(function(){\r\n");
      out.write("        $('#slider').nivoSlider({\r\n");
      out.write("                effect: 'random',\r\n");
      out.write("                slices: 15,\r\n");
      out.write("                animSpeed: 700,\r\n");
      out.write("                pauseTime: 2500,\r\n");
      out.write("                startSlide: 0, //Set starting Slide (0 index)\r\n");
      out.write("                directionNav: false,\r\n");
      out.write("                directionNavHide: false, //Only show on hover\r\n");
      out.write("                controlNav: false, //1,2,3...\r\n");
      out.write("                controlNavThumbs: false, //Use thumbnails for Control Nav\r\n");
      out.write("                pauseOnHover: true, //Stop animation while hovering\r\n");
      out.write("                manualAdvance: false, //Force manual transitions\r\n");
      out.write("                captionOpacity: 0.6, //Universal caption opacity\r\n");
      out.write("                beforeChange: function() {\r\n");
      out.write("                },\r\n");
      out.write("                afterChange: function() {\r\n");
      out.write("                },\r\n");
      out.write("                slideshowEnd: function() {\r\n");
      out.write("                } //Triggers after all slides have been shown\r\n");
      out.write("            });\r\n");
      out.write("            \r\n");
      out.write("        $(\"#girisbutton\").click(function () {\r\n");
      out.write("            kuladi=$(\"#Eposta1\").val();\r\n");
      out.write("            sifre=$(\"#Parola1\").val();\r\n");
      out.write("            \r\n");
      out.write("        $.ajax({\r\n");
      out.write("            type: \"POST\",\r\n");
      out.write("            url: '../loginUye.jsp',\r\n");
      out.write("            data: \"Eposta1=\"+kuladi+\"&Parola1=\"+sifre,\r\n");
      out.write("            success: function (sonuc) {\r\n");
      out.write("                \r\n");
      out.write("                if (sonuc == 0) {\r\n");
      out.write("                     window.location.href=\"../Uye/\"; \r\n");
      out.write("                }else if(sonuc ==1){\r\n");
      out.write("                    alert(\"Email veya Şifre Hatalı\");\r\n");
      out.write("                }else if(sonuc ==2){\r\n");
      out.write("                    alert(\"Veritabanı Bağlantı Hatası. Sistem Yönetici ile irtibata geçin.\");\r\n");
      out.write("                }else if(sonuc==3){\r\n");
      out.write("                    alert(\"Kayıt işleminiz Onaylanmamıştır.E-Posta Adresinize Gönderilen Aktivasyon Bilgilerini Kontrol Edin.\");\r\n");
      out.write("                }else if(sonuc==4){\r\n");
      out.write("                    window.location.href=\"../yonetim.jsp\"; \r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("    \r\n");
      out.write("        $(\"#kayitbutton\").click(function () {\r\n");
      out.write("            ad=$(\"#Ad\").val();\r\n");
      out.write("            soyad=$(\"#Soyad\").val();\r\n");
      out.write("            email=$(\"#Email2\").val();\r\n");
      out.write("            parola=$(\"#Parola2\").val();\r\n");
      out.write("            parola2=$(\"#ParolaR\").val();\r\n");
      out.write("            \r\n");
      out.write("            if(ad.length<1){alert(\"Ad boş bırakılamaz\");}\r\n");
      out.write("            else if(soyad.length<1){alert(\"Soyad boş bırakılamaz\");}\r\n");
      out.write("            else if(email.length<1){alert(\"E-mail boş bırakılamaz\");}\r\n");
      out.write("            else if(parola.length<6){alert(\"Parola En Az 6 Karakterden Oluşmalıdır\");}\r\n");
      out.write("            else if(parola.length>12){alert(\"Parola En Fazla 12 Karakterden Oluşmalıdır\");}\r\n");
      out.write("            else if(parola != parola2){alert(\"Şifre uyuşmazlığı! Lütfen Tekrar Deneyin.\");}\r\n");
      out.write("\r\n");
      out.write("            else{\r\n");
      out.write("            \r\n");
      out.write("        $.ajax({\r\n");
      out.write("            type: \"POST\",\r\n");
      out.write("            url: '../kaydol.jsp',\r\n");
      out.write("            data: \"Ad=\"+ad+\"&Soyad=\"+soyad+\"&Email2=\"+email+\"&Parola2=\"+parola,\r\n");
      out.write("            success: function (sonuc) {\r\n");
      out.write("                \r\n");
      out.write("                if (sonuc == 0) {\r\n");
      out.write("                     alert(\"Girmiş olduğunuz E-Posta Adresi Sistemde Mevcut! Farklı bir E-Posta Giriniz.\"); \r\n");
      out.write("                }else if(sonuc ==1){\r\n");
      out.write("                    alert(\"Kayıt Başarı ile Eklendi.Aktivasyon Bilgileri E-Posta Adresinize Gönderilmiştir.\");\r\n");
      out.write("                    \r\n");
      out.write("                }else if(sonuc ==2){\r\n");
      out.write("                    alert(\"Kayıt İşlemi Başarısız oldu Lütfen Yeniden Deneyin.\");\r\n");
      out.write("                }else if(sonuc ==3){\r\n");
      out.write("                    alert(\"Veritabanı Bağlantı Hatası. Sistem Yönetici ile irtibata geçin.\");\r\n");
      out.write("                }\r\n");
      out.write("                \r\n");
      out.write("            $(\"#Ad\").val(\"\");\r\n");
      out.write("            $(\"#Soyad\").val(\"\");\r\n");
      out.write("            $(\"#Email2\").val(\"\");\r\n");
      out.write("            $(\"#Parola2\").val(\"\");\r\n");
      out.write("            $(\"#ParolaR\").val(\"\");\r\n");
      out.write("            \r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("        \r\n");
      out.write("        $(\"#searchbutton\").click(function () {\r\n");
      out.write("            targett=$(\"#searchfield\").val();\r\n");
      out.write("            $.ajax({\r\n");
      out.write("            type: \"POST\",\r\n");
      out.write("            url: '../aramaSonuc.jsp',\r\n");
      out.write("            data: \"target=\"+targett,\r\n");
      out.write("            success: function (sonuc) {\r\n");
      out.write("             document.getElementById(\"templatemo_content\").innerHTML=sonuc;\r\n");
      out.write("                                      }\r\n");
      out.write("            });\r\n");
      out.write("            });\r\n");
      out.write("    } );\r\n");
      out.write("    \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("  ");

  String giris=request.getParameter("giris");
  if(giris!=null){
  if(giris.equals("false")){
  
      out.write("\r\n");
      out.write("      <script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("          alert(\"Ankete katılmak için Lütfen Üye Olun!\")\r\n");
      out.write("    </script>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    ");

  
  }
  }
  
  
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../linkkontrol.jsp", out, false);
      out.write("\r\n");
      out.write("    <div id=\"templamteo_body_wrapper\">\r\n");
      out.write("    <div id=\"templatemo_wrapper\">\r\n");
      out.write("    <div id=\"templatemo_main_top\">\r\n");
      out.write("        \r\n");
      out.write("    </div>\r\n");
      out.write("    <div id=\"templatemo_main\">\r\n");
      out.write("           \r\n");
      out.write("            \r\n");
      out.write("             ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../sol.jsp", out, false);
      out.write("\r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../sag.jsp", out, false);
      out.write("\r\n");
      out.write("            <div class=\"cleaner\"></div>\r\n");
      out.write("                \r\n");
      out.write("            \r\n");
      out.write("    </div>\r\n");
      out.write("        \r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../fouter.jsp", out, false);
      out.write("\r\n");
      out.write("</div> \r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");

    }

      out.write("\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
