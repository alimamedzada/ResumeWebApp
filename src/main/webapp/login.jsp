<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 28.07.2023
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/users.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body class="login_background">
<form action="login" method="POST">
    <div class="col-4 container login_fix_">
        <center>
            <h1>Login:</h1>
        </center>
        <div class="form_group">
            <label>Email address: </label>
            <input class="form-control" type="email" name="email"/>
        </div>
        <div class="form-group">
            <label>Password: </label>
            <input class="form-control" type="password" name="password"/>
        </div>
        <button type="submit" class="btn btn-primary" name="login">Login</button>
    </div>
</form>

</body>
</html>
