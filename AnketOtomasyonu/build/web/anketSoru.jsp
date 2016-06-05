  <%-- 
    Document   : sinavSoru
    Created on : 29.Eyl.2013, 19:39:45
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="methods.*"%>
<%@page import="Beans.*"%>

    <%
 Uye uye=(Uye)session.getAttribute("UyeInfo");

 if(uye==null){
     response.sendRedirect("Anasayfa/");
 }
 else{
        String anket_id=request.getParameter("anket_id");
        veritabani.baglanti database = new veritabani.baglanti();
        
        int diziOzellik[];
        OzellikArray array=new OzellikArray();
        array=(OzellikArray)session.getAttribute("array");
        diziOzellik=array.getDizi();
        
        int boyut=diziOzellik.length;
        int sira=0;
        
        if((Integer)session.getAttribute("sira")==0){
        sira=0;
        }else{
        sira=(Integer)session.getAttribute("sira");
        }
        
        if(sira>=diziOzellik.length){
            sira=diziOzellik.length-1;
            out.print("<tr><td colspan='2' ><b style='color:red;'>Tüm soruları cevapladınız Anketi sonlandırabilirsiniz</b></td></tr>");
            }

        session.setAttribute("sira",sira);
        
        int Ozellik_ID=diziOzellik[sira];
        
        
        String query = "Select * From `anket`.`soru` WHERE soru_id=?;";
        PreparedStatement pstmt = database.sorgu(query);
        pstmt.setInt(1,Ozellik_ID);
        
        String query2 = "Select * From `anket`.`cevap` WHERE soru_id=?;";
        PreparedStatement pstmt2 = database.sorgu(query2);

        //String query3 ="Select * From `anket`.`anket_icerik` WHERE anket_id=? AND soru_id=?;";
        //PreparedStatement pstmt3 = database.sorgu(query3);
         
        ResultSet result=pstmt.executeQuery();
        
        String Soru="";
        
        if(result.next()){
        Soru=result.getString("soru");
        }
     
 %>
<tr><td colspan='2'><span><%=Soru%></span></td></tr>
         
     
     <%
 
        String query3 = "Select * From `anket`.`uye_cevap` WHERE anket_id=? and uye_id=? and soru_id=?;";
        PreparedStatement pstmt3 = database.sorgu(query3);
        
             
     pstmt2.setInt(1,Ozellik_ID);
     ResultSet result2=pstmt2.executeQuery();
     
     String Cevap="";
     int cevap_id=0;
     int i=0;
     while(result2.next()){
         
     Cevap=result2.getString("cevap");
     cevap_id=result2.getInt("cevap_id");
     
     pstmt3.setInt(1,Integer.parseInt(anket_id));
     pstmt3.setInt(2,Integer.parseInt(uye.getId()));
     pstmt3.setInt(3,Ozellik_ID);
     ResultSet result3=pstmt3.executeQuery();
     int uye_cevap_id=0;
     
     if(result3.next()){
     uye_cevap_id=result3.getInt("cevap_id");
     }

     
     out.println("<tr>");
     if(cevap_id==uye_cevap_id){
     out.println("<td><input  checked='checked' onClick='SoruKaydet("+anket_id+","+Ozellik_ID+","+cevap_id+");' type = 'radio' name ='rd' id='rd"+(i+1)+"'/></td><td width='%80'> "+Cevap+"</td>");
     }
     else{
     out.println("<td><input  onClick='SoruKaydet("+anket_id+","+Ozellik_ID+","+cevap_id+");' type = 'radio' name ='rd' id='rd"+(i+1)+"'/></td><td width='%80'> "+Cevap+"</td>");
     }
     out.println("</tr>");
     
     i++;
     }
 
     %>
     <tr><td><h2><b>Soru :<%=sira+1%> /<%=boyut%><b></h2></td><td><img onclick="anketBitir();" src="icons/png/48x48/clock.png" width="48" height="48" alt="clock"/>ANKET BİTİR</td></tr>
                     
 <%
 }
 %>

