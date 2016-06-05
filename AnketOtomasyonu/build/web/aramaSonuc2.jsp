
<%-- 
    Document   : aramaSonuc
    Created on : 17.Ara.2013, 15:40:17
    Author     : Lenowo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

    <%
            String search_target=request.getParameter("target");
    %>

            <div class="content_box">
            <div class="w_100" style="width: 560px;">
            <h4><img src="icons/png/32x32/tag_blue.png" width="32" height="32" alt="Arama Sonuçları"/><%= search_target %>&nbsp;Etiketine Ait Arama Sonuçları</h4>
            <ul class="lbe_list_w100">
                
                    <%
                      veritabani.baglanti database = new veritabani.baglanti();
                      String query = "SELECT * FROM anket.anket_anahat WHERE anket_ad LIKE '%"+search_target+"%';";
                      PreparedStatement pstmt = database.sorgu(query);
                      ResultSet result = pstmt.executeQuery();
                      
                      int i=0;
                      while (result.next()) {
                        i++;
                        out.print("<form action='Anket/' method='post' name='formbegeni" + result.getInt("anket_id") + "' >");
                        out.print("<input type='hidden' name='anket_id' value='" + result.getInt("anket_id") + "'>");
                        out.println("<li><a href='javascript:void(0)' onclick='document.formbegeni" + result.getInt("anket_id") + ".submit();'>" + result.getString("anket_ad") + "<span>" + result.getString("tarih") + "</span></a></li>");
                        out.print("</form>");
                      }
                      
                      if(i==0){}

                %>

            </ul>
        </div>
            </div>
              