<%-- 
    Created on : 23.Tem.2013, 23:05:16
    Author     : Nuri
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Beans.*"%>
<%@page import="methods.*"%>
  <%
  Uye uye=(Uye)session.getAttribute("UyeInfo");
  
  if(uye==null){
      response.sendRedirect("/ANASAYFA/.jsp");
  }else{
  
                veritabani.baglanti database = new veritabani.baglanti();

                 
                methods.Aktar aktar=new methods.Aktar();
                
                String anket_id=request.getParameter("anket_id");
                String uye_id=request.getParameter("uye_id");
                String yorum=request.getParameter("yorum");
                      
                      anket_id=aktar.Degis(anket_id);
                      uye_id=aktar.Degis(uye_id);
                      yorum=aktar.Degis(yorum);

   
        
                String query="INSERT INTO `anket`.`yorum`( "
               + "`anket_id`,"
               + "`uye_id`,"
               + "`yorum`,"
               + "`yorum_durum`)"
               + "VALUES(?,?,?,?);";               
                    
                PreparedStatement pstmt = database.sorgu(query);   
 
                pstmt.setInt(1, Integer.parseInt(anket_id));
                pstmt.setInt(2, Integer.parseInt(uye_id));
                pstmt.setString(3,yorum);
                pstmt.setInt(4,0);
                boolean sonuc=pstmt.execute();
                out.print("Mesajınız Başarıyla Kaydedildi..Yönetici Onayı Beklemektedir.");
    
  }   
           
      %>

    
