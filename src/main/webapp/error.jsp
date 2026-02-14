<%-- 
    Document   : error
    Created on : Feb 12, 2026, 9:18:57 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Why are you here?</title>
    </head>
    <body>
        <%
            String msg = request.getParameter("msg");
        %>
        <%= msg%>
    </body>
</html>
