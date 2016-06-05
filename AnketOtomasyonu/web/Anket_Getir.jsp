<%@page import="java.sql.*"%>
<%@page import="Beans.Uye"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
        
      Uye  uye=(Uye)session.getAttribute("UyeInfo");
      if(uye==null || uye.getYetki()!=3)
      {
      response.sendRedirect("Anasayfa/");
      }
      else
      {
       String islem=request.getParameter("islem");
       String anket_id=request.getParameter("anket_id");
       
       veritabani.baglanti database = new veritabani.baglanti();
        
       if(islem.equals("1")){
           
       String query = " UPDATE `anket`.`anket_anahat` "
                + " SET "
                + " `durum` = ?"
                + " WHERE anket_id= ? ;";
       PreparedStatement pstmt = database.sorgu(query);
       pstmt.setInt(1,1);
       pstmt.setInt(2,Integer.parseInt(anket_id));
       int result = pstmt.executeUpdate();
       out.print("1");
       }else if(islem.equals("2")){
           
       String query ="DELETE FROM `anket`.`anket_anahat`"
         + "WHERE anket_id=?;";
       PreparedStatement pstmt = database.sorgu(query);
       pstmt.setInt(1,Integer.parseInt(anket_id));
       int result = pstmt.executeUpdate();
       out.print("2");
       }
       }
    %>

