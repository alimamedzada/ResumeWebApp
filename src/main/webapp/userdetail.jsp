<%@ page import="com.mycompany.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 27.07.2023
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

<%
    User u = (User) request.getAttribute("user");
%>
<div class="container table">
    <div class="row">
        <div class="col-sm-4">
            <form action="userdetail" method="POST">
                <div class="form-group">
                    <input type="hidden" name="id" value="<%=u.getId()%>"/>
                    <label for="name">name: </label>
                    <input class="form-control" type="text" name="name" value="<%=u.getName()%>"/>
                </div>
                <div class="form-group">
                    <label for="surname">surname: </label>
                    <input class="form-control" type="text" name="surname" value="<%=u.getSurname()%>"/>
                </div>
                <div class="form-group">
                    <label for="email">email: </label>
                    <input class="form-control" type="email" name="email" value="<%=u.getEmail()%>"/>
                </div>
                <div class="form-group">
                    <label for="phone">phone: </label>
                    <input class="form-control" type="tel" name="phone" value="<%=u.getPhone()%>"/>
                </div>
                <div class="form-group">
                    <label for="birthdate">birthdate: </label>
                    <input class="form-control" type="date" name="birthdate" value="<%=u.getBirthDate()%>"/>
                </div>
                <input type="hidden" name="action" value="update"/>
                <input class="btn btn-warning" type="submit" name="save" value="update"/>
            </form>
        </div>
    </div>
</div>
</body>
</html>
