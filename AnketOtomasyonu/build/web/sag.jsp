<%-- 
    Document   : sag.jsp
    Created on : 09.Ara.2013, 21:35:27
    Author     : Tosibah
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<div id="templatemo_content">
    <%
        String yer = request.getRequestURI();
        if (yer.indexOf("/Anket/Uye") < 0) {
    %>

    <div id="slider">
        <a href="#"><img src="../img/slideshow/01.jpg" alt="Image 1" title="Ayrıntılı Anket Sonuçları ile Hedefe Bir Adım Daha Öndesiniz." /></a>
        <a href="#"><img src="../img/slideshow/02.jpg" alt="Image 2" title="Kişiye Özgü Anketler ile Kamuoyu Yoklaması. " /></a>
        <a href="#"><img src="../img/slideshow/03.jpg" alt="Image 3" title="Bölgesel , Mahalli ve Genel Seçim Anketleri." /></a>
        <a href="#"><img src="../img/slideshow/04.png" alt="Image 4" title="Online Anketler ile Sürekli Güncel Sonuçlar. " /></a>
        <a href="#"><img src="../img/slideshow/05.jpg" alt="Image 5" title="Farklı Soru Seçenekleri ile Etkileşimi Arttırma. " /></a>
    </div>
    <div class="content_box">
        <h4>ANMMY ANKET SİTESİNE HOŞGELDİNİZ</h4>
        <em><p>&nbsp;Türkiye'nin en genç ve dinamik kullanıcı kitlesine sahip online anket ve araştırma platformu ANMMY'e hoş geldiniz!
                ANMMY, online anket, veri toplama ve web tabanlı anket çözümleri sunar.
                Hemen üye olabilir anketlere katılabilir,üye aktivasyonu 
                ile aynı gün anket oluşturabilir ve rapor almaya başlayabilirsiniz!</p></em>

    </div>
    <%       }
    %>


    <div class="content_box">
        <div class="w_100" style="width: 560px;">
            <h4><img src="../icons/png/32x32/tag_blue.png" width="32" height="32" alt="Üye Girişi"/>En Yeni Anketler</h4>
            <ul class="lbe_list_w100">
                <%
                    veritabani.baglanti database = new veritabani.baglanti();
                    String query = "SELECT * FROM anket.anket_anahat where durum=1 Order By anket_id DESC LIMIT 5;";
                    PreparedStatement pstmt = database.sorgu(query);
                    ResultSet result = pstmt.executeQuery();
                    while (result.next()) {
                        out.print("<form action='../Anket/' method='post' name='formyeni" + result.getInt("anket_id") + "' >");
                        out.print("<input type='hidden' name='anket_id' value='" + result.getInt("anket_id") + "'>");
                        out.println("<li><a href='javascript:void(0)' onclick='document.formyeni" + result.getInt("anket_id") + ".submit();'>" + result.getString("anket_ad") + "<span>" + result.getString("tarih") + "</span></a></li>");
                        out.print("</form>");
                    }

                %>

            </ul>
        </div>

        <div class="w_100" style="width: 560px;">
            <h4><img src="../icons/png/32x32/tag_blue.png" width="32" height="32" alt="Üye Girişi"/>En Çok Oylanan Anketler</h4>
            <ul class="lbe_list_w100">
                 <%
                    String query2 = "SELECT anket_anahat.tarih,anket_anahat.anket_ad,uye_sonuc.anket_id ,count(uye_sonuc.anket_id) as sayilar FROM anket_anahat inner join uye_sonuc on anket_anahat.anket_id = uye_sonuc.anket_id GROUP BY anket_ad  Order By sayilar DESC  LIMIT 5  ;";
                    PreparedStatement pstmt2 = database.sorgu(query2);
                    ResultSet result2 = pstmt2.executeQuery();
                    while (result2.next()) {
                        out.print("<form action='../Anket/' method='post' name='formoy" + result2.getInt("anket_id") + "' >");
                        out.print("<input type='hidden' name='anket_id' value='" + result2.getInt("anket_id") + "'>");
                        out.println("<li><a href='javascript:void(0)' onclick='document.formoy" + result2.getInt("anket_id") + ".submit();'>" + result2.getString("anket_ad") + "<span>" + result2.getString("tarih") + "</span></a></li>");
                        out.print("</form>");
                    }

                %>
            </ul>
        </div>
        <div class="w_100" style="width: 560px;">
            <h4><img src="../icons/png/32x32/tag_blue.png" width="32" height="32" alt="Üye Girişi"/>En Çok Beğenilen Anketler</h4>
            <ul class="lbe_list_w100">
                <%
                    String query3 = "SELECT anket_anahat.tarih,anket_anahat.anket_ad,uye_sonuc.anket_id ,sum(uye_sonuc.anket_begeni) as sayilar FROM anket_anahat inner join uye_sonuc on anket_anahat.anket_id = uye_sonuc.anket_id GROUP BY anket_ad  Order By sayilar DESC  LIMIT 5  ;";
                    PreparedStatement pstmt3 = database.sorgu(query3);
                    ResultSet result3 = pstmt3.executeQuery();
                    while (result3.next()) {
                        out.print("<form action='../Anket/' method='post' name='formbegeni" + result3.getInt("anket_id") + "' >");
                        out.print("<input type='hidden' name='anket_id' value='" + result3.getInt("anket_id") + "'>");
                        out.println("<li><a href='javascript:void(0)' onclick='document.formbegeni" + result3.getInt("anket_id") + ".submit();'>" + result3.getString("anket_ad") + "<span>" + result3.getString("tarih") + "</span></a></li>");
                        out.print("</form>");
                    }

                %>
            </ul>
        </div>
    </div>

</div> <!-- end of content -->
