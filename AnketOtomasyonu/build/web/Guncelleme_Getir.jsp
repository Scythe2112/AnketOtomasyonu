<%@page import="Beans.Uye"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Uye uye=(Uye)session.getAttribute("UyeInfo");
        veritabani.baglanti database=new veritabani.baglanti();
        
        String Sehir=request.getParameter("selectSehir");
        String Yas=request.getParameter("selectYas");
        String Cinsiyet=request.getParameter("cinsiyet");
        String Yetki=request.getParameter("checkYetki");
        
        if(Yetki.equals("1")){
        String query="UPDATE `anket`.`uye` "
                + " SET " 
                + " `uye_yetki` = ?"
                + " WHERE uye_id= ? ;";
        
        PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
        pstmt.setInt(1, 4);
        pstmt.setInt(2, Integer.parseInt(uye.getId()));
        int result=pstmt.executeUpdate();
        out.println("İsteğiniz alınmıştır.Onay verildikten Sonra Anket Oluşturabileceksiniz");
        
        }
        
        if(Sehir.length()>2 && Integer.parseInt(Yas)>0 && Cinsiyet.length()>2){
            
        String query="UPDATE `anket`.`uye` "
                + " SET " 
                + " `uye_sehir` = ?,"
                + " `uye_yas` = ?,"
                + " `uye_cinsiyet` = ?"
                + " WHERE uye_id= ? ;";
        
        PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
        pstmt.setString(1, Sehir);
        pstmt.setInt(2, Integer.parseInt(Yas));
        pstmt.setString(3, Cinsiyet);
        pstmt.setInt(4,Integer.parseInt(uye.getId()));
        int result=pstmt.executeUpdate();
        out.println("Bilgiler Başarı ile Güncellendi");
        }else{
        out.println("Güncelleme Yapılamadı Lütfen Girişlerinizi kontrol edin");
        }

%>
