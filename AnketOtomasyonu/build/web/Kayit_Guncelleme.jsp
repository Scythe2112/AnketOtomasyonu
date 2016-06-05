<%-- 
    Document   : Kayit_Guncelleme
    Created on : 28.Ara.2013, 23:48:33
    Author     : Lenowo
--%>

<%@page import="Beans.Uye"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
</head>
<body>
          <%
    Uye  uye=(Uye)session.getAttribute("UyeInfo");

    %> 
    <form name="ff">
    <table id="rounded-corner">
        <tr><td colspan="2" style="color: #e47100;text-align: center;">BİLGİLERİNİ GÜNCELLE</td></tr>
        <tr>
            <td>Şehir:</td>
            <td><select name="selectSehir" id="selectSehir">
<%
String Sehir=uye.getSehir();
if(Sehir.length()<3){Sehir=" ";}
out.println("<option value='"+Sehir+"'>"+Sehir+"</option>");
%>

<option value="Mardin">Mardin</option>
<option value="İstanbul Anadolu">İstanbul Anadolu</option>
<option value="İstanbul Avrupa">İstanbul Avrupa</option>
<option value="Adana">Adana</option>
<option value="Adıyaman">Adıyaman</option>
<option value="Afyon">Afyon</option>
<option value="Ağrı">Ağrı</option>
<option value="Aksaray">Aksaray</option>
<option value="Amasya">Amasya</option>
<option value="Ankara">Ankara</option>
<option value="Antalya">Antalya</option>
<option value="Ardahan">Ardahan</option>
<option value="Artvin">Artvin</option>
<option value="Aydın">Aydın</option>
<option value="Balıkesir">Balıkesir</option>
<option value="Bartın">Bartın</option>
<option value="Batman">Batman</option>
<option value="Bayburt">Bayburt</option>
<option value="Bilecik">Bilecik</option>
<option value="Bingöl">Bingöl</option>
<option value="Bitlis">Bitlis</option>
<option value="Bolu">Bolu</option>
<option value="Burdur">Burdur</option>
<option value="Bursa">Bursa</option>
<option value="Çanakkale">Çanakkale</option>
<option value="Çankırı">Çankırı</option>
<option value="Çorum">Çorum</option>
<option value="Denizli">Denizli</option>
<option value="Diyarbakır">Diyarbakır</option>
<option value="Düzce">Düzce</option>
<option value="Edirne">Edirne</option>
<option value="Elazığ">Elazığ</option>
<option value="Erzincan">Erzincan</option>
<option value="Erzurum">Erzurum</option>
<option value="Eskişehir">Eskişehir</option>
<option value="Gaziantep">Gaziantep</option>
<option value="Giresun">Giresun</option>
<option value="Gümüşhane">Gümüşhane</option>
<option value="Hakkari">Hakkari</option>
<option value="Hatay">Hatay</option>
<option value="Iğdır">Iğdır</option>
<option value="Isparta">Isparta</option>
<option value="İçel/Mersin">İçel/Mersin</option>
<option value="İzmir">İzmir</option>
<option value="K.Maraş">K.Maraş</option>
<option value="Karabük">Karabük</option>
<option value="Karaman">Karaman</option>
<option value="Kars">Kars</option>
<option value="Kastamonu">Kastamonu</option>
<option value="Kayseri">Kayseri</option>
<option value="Kırıkkale">Kırıkkale</option>
<option value="Kırklareli">Kırklareli</option>
<option value="Kırşehir">Kırşehir</option>
<option value="Kilis">Kilis</option>
<option value="Kocaeli">Kocaeli</option>
<option value="Konya">Konya</option>
<option value="Kütahya">Kütahya</option>
<option value="Malatya">Malatya</option>
<option value="Manisa">Manisa</option>
<option value="Muğla">Muğla</option>
<option value="Muş">Muş</option>
<option value="Nevşehir">Nevşehir</option>
<option value="Niğde">Niğde</option>
<option value="Ordu">Ordu</option>
<option value="Osmaniye">Osmaniye</option>
<option value="Rize">Rize</option>
<option value="Sakarya">Sakarya</option>
<option value="Samsun">Samsun</option>
<option value="Şanlıurfa">Şanlıurfa</option>
<option value="Siirt">Siirt</option>
<option value="Sinop">Sinop</option>
<option value="Sivas">Sivas</option>
<option value="Şırnak">Şırnak</option>
<option value="Tekirdağ">Tekirdağ</option>
<option value="Tokat">Tokat</option>
<option value="Trabzon">Trabzon</option>
<option value="Tunceli">Tunceli</option>
<option value="Uşak">Uşak</option>
<option value="Van">Van</option>
<option value="Yalova">Yalova</option>
<option value="Yozgat">Yozgat</option>
<option value="Zonguldak">Zonguldak</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Yaş:</td>
            <td><select name="selectYas" id="selectYas">
                    <%
int Yas=uye.getYas();
if(Yas<16){Yas=0;}
out.println("<option value='"+Yas+"'>"+Yas+"</option>");
%>

                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                    <option>20</option>
                    <option>21</option>
                    <option>22</option>
                    <option>23</option>                    
                    <option>24</option>
                    <option>25</option>                    
                    <option>26</option>
                    <option>27</option>
                    <option>28</option>
                    <option>29</option>
                    <option>30</option>
                    <option>31</option>                    
                    <option>32</option>
                    <option>33</option>                    
                    <option>34</option>
                    <option>35</option>                    
                    <option>36</option>
                    <option>37</option>
                    <option>38</option>
                    <option>39</option>
                    <option>40</option>
                    <option>41</option>                    
                    <option>42</option>
                    <option>43</option>                    
                    <option>44</option>
                    <option>45</option>                    
                    <option>45+</option>    
                    </select></td>
        </tr>
         <tr>
            <td>Cinsiyet:</td>
            <%
String Cinsiyet=uye.getCinsiyet();
if(Cinsiyet.equals("Bay")){
%>
         
            <td>Bay<input type="radio" name="cinsiyet"  value="Bay" checked="checked"/>
                Bayan<input type="radio" name="cinsiyet"  value="Bayan" />
            </td>           
            
            
            <%
}else if (Cinsiyet.equals("Bayan")){
%>
            <td>Bay<input type="radio" name="cinsiyet"  value="Bay" />
                Bayan<input type="radio" name="cinsiyet"  value="Bayan" checked="checked"/>
            </td>   

<%
}else{

%>
            <td>Bay<input type="radio" name="cinsiyet"  value="Bay" />
                Bayan<input type="radio" name="cinsiyet"  value="Bayan" />
            </td>   
<%
}
%>
        </tr>
         <%
                 
                    veritabani.baglanti database = new veritabani.baglanti();
                    String query = "SELECT * from anket.uye where uye_id=? and uye_yetki=1;";
                    PreparedStatement pstmt = database.sorgu(query);
                    pstmt.setInt(1,Integer.parseInt(uye.getId()));
                    ResultSet result = pstmt.executeQuery();
                    
                    
                    if(result.next()){
                    %>
        <tr>
            <td>Anket oluşturma yetkisi İstiyorum.</td>
            <td><select name="checkYetki" id="checkYetki">
                    <option value=""></option>
                    <option value="1">Evet</option>
                    <option value="0">Hayır</option>
                </select></td>
        </tr>
        <%
         }
        %>
        <tr>
            <td></td>
            <td><input type="button" value="Güncelle" id="Guncelleme"  name="Guncelleme" onclick="guncelle();"/></td>
        </tr>
    </table>
</form>
</body>
</html>
