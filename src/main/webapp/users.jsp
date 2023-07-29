<%@ page import="com.mycompany.entity.User" %>
<%@ page import="com.mycompany.dao.inter.UserDaoInter" %>
<%@ page import="com.mycompany.main.Context" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 27.07.2023
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="assets/css/users.css">
<link rel="stylesheet" href="fontawesome/css/all.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="js/users.js"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("loggedInUser");
%>
<%
    UserDaoInter userDao = Context.instanceUserDao();

    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String nationalityIdStr = request.getParameter("nid");
    Integer nationalityId = null;

    if (nationalityIdStr != null && !nationalityIdStr.trim().isEmpty()) {
        nationalityId = Integer.parseInt(nationalityIdStr);
    }

    List<User> list = userDao.getAll(name, surname, nationalityId);
%>

<div class="container-fluid mycontainer">
    <div class="row">
        <div class="col-sm-4">
            <form action="users" method="GET">
                <div class="form-group">
                    <label for="name">name: </label>
                    <input class="form-control" type="text" name="name" value=""/>
                </div>
                <div class="form-group">
                    <label for="surname">surname: </label>
                    <input class="form-control" type="text" name="surname" value=""/>
                </div>
                <input class="btn btn-primary" type="submit" name="search" value="Search" id="btnsearch"/>
                <input visible="true" class="btn btn-primary" name="search" type="button" onclick="showHide()"
                       value="Show Hide"/>
            </form>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th> Surname</th>
            <th> Nationality</th>
        </tr>
        </thead>
        <tbody>
        <%for (User u : list) {%>
        <tr>
            <td>
                <%=u.getName()%>
            </td>
            <td>
                <%=u.getSurname()%>
            </td>
            <td>
                <%=u.getNationality().getName() == null ? "N/A" : u.getNationality().getName()%>
            </td>
            <td style="width: 5px">
                <input type="hidden" name="id" value="<%=u.getId()%>"/>
                <input type="hidden" name="action" value="delete"/>
                <button class="btn btn-danger" type="submit" value="delete" data-toggle="modal"
                        onclick="idForDelete(<%=u.getId()%>)"
                        data-target="#exampleModal">
                    <i class="fa-solid fa-trash"></i>
                </button>
            </td>
            <td style="width: 5px">
                <form action="userdetail" method="GET">
                    <input type="hidden" name="id" value="<%=u.getId()%>"/>
                    <input type="hidden" value="update" name="action"/>
                    <button class="btn btn-secondary" type="submit" value="update">
                        <i class="fa-solid fa-pen"></i>
                    </button>
                </form>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<form action="logout" method="POST">
    <button type="button" class="btn btn-primary" name="logout">
        Logout
    </button>
</form>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure?
            </div>
            <div class="modal-footer">
                <form action="userdetail" method="POST">
                    <input type="hidden" name="id" value="" id="idForDelete"/>
                    <input type="hidden" name="action" value="delete"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" value="Delete" class="btn btn-danger"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
