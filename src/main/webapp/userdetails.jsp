<%@page import="org.example.main.Context"%>
<%@page import="org.example.dao.inter.UserDaoInter"%>
<%@page import="org.example.entity.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/user.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <title>Page</title>
    </head>

    <body>
        <%
            User u = (User) request.getAttribute("user");
        %>
        <div>
            <form action="userdetail" method="post">
                <input type="hidden" name="id" value="<%=u.getId()%>"/>
                <label for="name">name: </label>
                <input placeholder="Enter name" type="text" name="name" value="<%=u.getName()%>"/>
                <label for="surname">surname: </label>
                <input placeholder="Enter surname"  type="text" name="surname" value="<%=u.getSurname()%>"/>
                <input type="submit" name="save" value="Save"/>
            </form>
        </div>
    </body>
</html>
