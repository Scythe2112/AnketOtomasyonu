
<%@page import="Beans.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    
    String Eposta = request.getParameter("Eposta1");
    String Sifre = request.getParameter("Parola1");

    veritabani.baglanti database = new veritabani.baglanti();
    String query = "SELECT * FROM `anket`.`uye` WHERE uye_eposta= ? and uye_sifre= ?;";
    PreparedStatement pstmt = database.sorgu(query);
    
    String query2 = "SELECT * FROM `anket`.`uye_aktif` WHERE uye_email= ? and uye_sifre= ?;";
    PreparedStatement pstmt2 = database.sorgu(query2);
    
    String query5 = "SELECT * FROM `anket`.`uye` WHERE uye_eposta= ?;";
    PreparedStatement pstmt5 = database.sorgu(query5);

    if (pstmt != null) {

        try {
            
            
            pstmt2.setString(1, Eposta);
            pstmt2.setString(2, Sifre);
            ResultSet result2 = pstmt2.executeQuery();
            
            if(result2.next()){
            
            String query3="DELETE FROM `anket`.`uye_aktif` WHERE uye_email=?;";
            PreparedStatement pstmt3 = database.sorgu(query3);
            pstmt3.setString(1, Eposta);
            int resultSet3=pstmt3.executeUpdate();
            
            String query4="UPDATE `anket`.`uye` "
                + " SET " 
                + " `uye_yetki` = ?"
                + " WHERE uye_eposta= ? ;";
        
        PreparedStatement pstmt4 = (PreparedStatement) database.sorgu(query4);
        pstmt4.setInt(1, 1);
        pstmt4.setString(2, Eposta);
        int result4=pstmt4.executeUpdate();
        
        pstmt5.setString(1, Eposta);
        ResultSet result5=pstmt5.executeQuery();
        
        if(result5.next()){Sifre=result5.getString("uye_sifre");}
            
            }
            
            pstmt.setString(1, Eposta);
            pstmt.setString(2, Sifre);
            ResultSet result = pstmt.executeQuery();

            if (result.next()) {
                Uye uye = new Uye();
                uye.setAd(result.getString("uye_ad"));
                uye.setSoyad(result.getString("uye_Soyad"));
                uye.setEmail(result.getString("uye_eposta"));
                uye.setSehir(result.getString("uye_sehir"));
                uye.setYas(result.getInt("uye_yas"));
                uye.setCinsiyet(result.getString("uye_cinsiyet"));
                uye.setId(result.getInt("uye_id")+"");
                uye.setYetki(result.getInt("uye_yetki"));
                session.setAttribute("UyeInfo", uye);

                if(result.getInt("uye_yetki")==0)
                {
                out.print(3);
                result.close();
                pstmt.close();
                }else if(result.getInt("uye_yetki")==3){
                out.print(4);
                result.close();
                pstmt.close();
                }
                else{
                out.print(0);
                result.close();
                pstmt.close();
                }
            } else {
                result.close();
                pstmt.close();
                out.print(1);
            }

        } catch (Exception e) {
        }

    } else {
        out.print(2);
    }
%>