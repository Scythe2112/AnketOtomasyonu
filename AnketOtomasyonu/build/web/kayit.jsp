<%-- 
    Document   : kayit
    Created on : 09.Ara.2013, 22:36:02
    Author     : Tosibah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sb_box"  style="margin-top: 50px;">
    <h5><img src="../icons/png/32x32/users.png" width="32" height="32" alt="user"/> ÜYE OL ANKETE KATIL </h5>
       
    <div id="contact_form">
        <form action="" method="post">
            <label for="Ad">AD:</label> 
            <input type="text" id="Ad" name="Ad" class="required input_field" />

            <label for="Soyad">SOYAD:</label>
            <input type="text" id="Soyad" name="Soyad" class="required input_field" />
            
            <label for="Email2">EMAIL:</label> 
            <input type="text" id="Email2" name="Email2" class="validate-email required input_field" />
            
            <label for="Parola2">PAROLA:</label> 
            <input type="password" id="Parola2" name="Parola2" class="required input_field" />
            
            <label for="ParolaR">RAPOLA(TEKRAR):</label> 
            <input type="password" id="ParolaR" name="ParolaR" class="required input_field" />
            
            <input type="button" name="kayitbutton" value="KAYDOL" id="kayitbutton" title="KAYDOL" />
            
        </form>
    </div>
</div>