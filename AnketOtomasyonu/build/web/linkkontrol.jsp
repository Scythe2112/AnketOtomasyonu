<%
    String yer = request.getRequestURI();
    if (yer.indexOf("index.jsp") > 0) {
        String yer1 = yer.replace("index.jsp", " ");
        %>
        <meta http-equiv="refresh" content="0;URL=<%=yer1%>">
        <%
      }
%>