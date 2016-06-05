<%-- 
    Created on : 18.Tem.2013, 10:45:39
    Author     : Nuri
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="methods.*"%>
<%@page import="Beans.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
 <%
 Uye uye=(Uye)session.getAttribute("UyeInfo");
 
 if(uye==null){ 
     response.sendRedirect("/Anasayfa/");
            }
 else{
 
        veritabani.baglanti database=new veritabani.baglanti();
        
        String anket_id=request.getParameter("anket_id");
        String soru_id=request.getParameter("soru_id");
        String sayac=request.getParameter("sayac");

        String query="UPDATE `anket`.`soru` "
                + " SET " 
                + " `soru` = ?"
                + " WHERE soru_id= ? ;";
        
        PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
        pstmt.setString(1, Aktar.Degis(request.getParameter("txtSoru")));
        pstmt.setInt(2,Integer.parseInt(soru_id));
        int sonuc=pstmt.executeUpdate();
    
        String query2="SELECT * FROM `anket`.`cevap` WHERE soru_id=?;";
        PreparedStatement pstmt2 = (PreparedStatement) database.sorgu(query2);
        pstmt2.setInt(1,Integer.parseInt(soru_id));
        ResultSet result2=pstmt2.executeQuery();

        String query3=" UPDATE `anket`.`cevap` "
                + " SET "
                + " `cevap` = ?"
                + " WHERE cevap_id= ? ;";
        
        PreparedStatement pstmt3 = (PreparedStatement) database.sorgu(query3);
        
int i=1;
while(result2.next()){
                pstmt3.setString(1, Aktar.Degis(request.getParameter("txt"+i)));
                pstmt3.setInt(2, result2.getInt("cevap_id"));
                int sonuc3=pstmt3.executeUpdate();
                i++;  
                    }

        String query4="INSERT INTO `anket`.`cevap`"
         + "(`soru_id`,"
         + "`cevap`,"
         + "`cevap_resim`,"
         + "`soru_tur`)"
         + "VALUES"
         + "(?,?,?,?);";
        
        PreparedStatement pstmt4 = (PreparedStatement) database.sorgu(query4);

        int j=i;
        while(request.getParameter("txt"+j)!=null){
            pstmt4.setInt(1,Integer.parseInt(soru_id));
            pstmt4.setString(2,Aktar.Degis(request.getParameter("txt"+j)));
            pstmt4.setString(3,"");
            pstmt4.setInt(4,1);
            boolean sonuc4=pstmt4.execute();
        j++;
    
}


response.sendRedirect("sorular.jsp?anket_id="+anket_id+"&sayac="+sayac);

}
 
 
 
 
 
 
 
 
 
 %>
    
    
</body>
</html>
