<%-- 
    Document   : sol.jsp
    Created on : 09.Ara.2013, 21:35:16
    Author     : Tosibah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="templatemo_sidebar">
    
    <div class="sb_box">
    <div id="contact_form">
      <h4><img src="../icons/png/48x48/user.png" width="48" height="48" alt="Üye Girişi"/>ÜYE GİRİŞİ</h4>
      
      <form action="" method="post">
      <label for="Eposta1">Email:</label>
      <input type="text" id="Eposta1" name="Eposta1" class="validate-email required input_field" />
      <label for="Parola1">Parola:</label> 
      <input type="password" id="Parola1" name="Parola1" class="input_field" />
      <input type="button" name="girisbutton" value="GİRİŞ" id="girisbutton" title="GİRİŞ" />
      </form> 
      
    </div>
    </div>   
    
    <div id="templatemo_menu">
        <ul>
            <li><a href="#" class="current">Anasayfa</a></li>
            <li><a href="../news.jsp">En Yeni Anketler</a></li>
            <li><a href="../counts.jsp">En Çok Oylanan Anketler</a></li>
            <li><a href="../likes.jsp">En Çok Beğenilen Anketler</a></li>
            <li><a href="../comments.jsp">En Çok Yorumlanan Anketler</a></li>
        </ul>    	
    </div>

    <jsp:include page="arama.jsp"></jsp:include>
    <jsp:include page="kayit.jsp"></jsp:include>

    <div class="cleaner"></div>
</div> <!-- end of sidebar -->
