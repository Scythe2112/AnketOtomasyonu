<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="veritabani.baglanti"%>
<%@page import="nurettin.MailGonder" %>

      <%
        veritabani.baglanti database=new veritabani.baglanti();
        
        String Ad=request.getParameter("Ad");
        String Soyad=request.getParameter("Soyad");
        String Parola=request.getParameter("Parola2");
        String Email=request.getParameter("Email2");
        String gecici_sifre="";
        Random r=new Random();
        
        Ad      =methods.Aktar.Degis(Ad);
        Soyad   =methods.Aktar.Degis(Soyad);
        Parola  =methods.Aktar.Degis(Parola);
        Email   =methods.Aktar.Degis(Email);
        


        String query="SELECT * FROM `anket`.`uye` WHERE uye_eposta=?;";
        PreparedStatement pstmt = (PreparedStatement) database.sorgu(query);
        
        if(pstmt!=null){
            
        pstmt.setString(1,Email);
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()){
        out.print(0);
        }
        else{
            
                    String dizi[]={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"};
        
        for(int i=0;i<6;i++){
        gecici_sifre+=dizi[r.nextInt(15)];
        }
        
        MailGonder.getinstance().setEmailSubjectTxt("ANNMY ANKET");

        MailGonder.getinstance().setSendTo(Email);

        MailGonder.getinstance().setEmailMsgTxt("ANNMY ANKET 'e Hosgeldiniz.\n Geçici Parola ve E-mail Adresiniz ile Sisteme Giris Yapabilirsiniz." +

        "\n Geçici Parolaniz="+gecici_sifre);

        MailGonder.getinstance().sendSSLMessage();
        
            String query2="INSERT INTO `anket`.`uye`"
                + " (`uye_ad`,`uye_soyad`,`uye_sifre`,`uye_eposta`,`uye_yetki`,`uye_sehir`,`uye_yas`,`uye_cinsiyet`)"
                + " VALUES(?,?,?,?,?,?,?,?);";
        
        PreparedStatement pstmt2=(PreparedStatement)database.sorgu(query2);
        pstmt2.setString(1,Ad);
        pstmt2.setString(2,Soyad);
        pstmt2.setString(3,Parola);
        pstmt2.setString(4,Email);
        pstmt2.setInt(5,0);
        pstmt2.setString(6," ");
        pstmt2.setInt(7,0);
        pstmt2.setString(8," ");
        boolean sonuc=pstmt2.execute();
        
        String query3="INSERT INTO `anket`.`uye_aktif`"
                + " (`uye_email`,`uye_sifre`)"
                + " VALUES(?,?);";
        
        PreparedStatement pstmt3=(PreparedStatement)database.sorgu(query3);
        pstmt3.setString(1,Email);
        pstmt3.setString(2,gecici_sifre);
        boolean sonuc3=pstmt3.execute();
        
        if(sonuc==false){out.print(1);}
        else           {out.print(2);}
        
        
        }
        
        }else
        {
        out.print(3);
        }
        
        
        %>

