<%-- 
    Document   : sinavEkle
    Created on : 26.Tem.2013, 10:53:10
    Author     : Nuri
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<center>
<div class="sb_box">
    <div id="contact_form">
      <h4><img src="../icons/png/48x48/add_page.png" width="48" height="48" alt="Anket Oluştur"/>Anket Oluştur</h4>
      
      <form action="../anketEkle.jsp" method="POST">
      <label for="anketTarih">Anket Tarihi:</label>
      <input type="text" id="anketTarih" name="anketTarih" class="validate-email required input_field" />
      <label for="anketAd">Anket Adı:</label> 
      <input type="text" id="anketAd" name="anketAd" class="input_field" />
      <label for="anketIcerik">Anket İçerik:</label> 
      <textarea id="anketIcerik" name="anketIcerik" class="input_field" ></textarea>
      <input type="submit" name="kayitbutton" value="KAYDET" id="kayitbutton" title="KAYDET" />
      </form> 
      
    </div>
    </div>
</center>
