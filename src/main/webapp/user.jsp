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
            UserDaoInter userDao = Context.instanceUserDao();
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String nationalityIdStr = request.getParameter("nid");
            Integer nationalityId = null;
            if (nationalityIdStr != null && !nationalityIdStr.trim().isBlank()) {
                nationalityId = Integer.parseInt(request.getParameter("nid"));
            }
            List<User> list = userDao.getAll(name, surname, nationalityId);
        %>
        <div class="container mycontainer">
            <div class="row">
                <div class="col-sm-6">
                    <form action="user.jsp" method="GET">
                        <div class="form-group">
                            <label for="name">name: </label>
                            <input placeholder="Enter name" class="form-control" type="text" name="name" value=""/>
                            <input  type="hidden" name="id"/>
                        </div>
                        <div class="control_panel_group">
                            <label for="surname">surname: </label>
                            <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
                        </div>
                        <input class="btn btn-primary"type="submit" name="search" value="Search"/>
                    </form>
                </div>
                <div class="col-sm-6">
                    <form action="user.jsp" method="GET">
                        <div class="form-group">
                            <label for="name">name: </label>
                            <input  placeholder="Enter name" class="form-control" type="text" name="name" value=""/>
                            <input  type="hidden" name="id"/>
                        </div>
                        <div class="control_panel_group">
                            <label for="surname">surname: </label>
                            <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
                        </div>
                        <input class="btn btn-primary"type="submit" name="search" value="Search"/>
                    </form>
                </div>
                <div class="col-sm-6">
                    <form action="user.jsp" method="GET">
                        <div class="form-group">
                            <label for="name">name: </label>
                            <input  placeholder="Enter name" class="form-control" type="text" name="name" value=""/>
                            <input  type="hidden" name="id"/>
                        </div>
                        <div class="control_panel_group">
                            <label for="surname">surname: </label>
                            <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
                        </div>
                        <input class="btn btn-primary"type="submit" name="search" value="Search"/>
                    </form>
                </div>
                <div class="col-sm-6">
                    <form action="user.jsp" method="GET">
                        <div class="form-group">
                            <label for="name">name: </label>
                            <input placeholder="Enter name" class="form-control" type="text" name="name" value=""/>
                            <input  type="hidden" name="id"/>
                        </div>
                        <div class="control_panel_group">
                            <label for="surname">surname: </label>
                            <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
                        </div>
                        <input class="btn btn-primary"type="submit" name="search" value="Search"/>
                    </form>
                </div>
            </div>
            <div>
                <hr/>
                <table class="table">
                    <thead>
                        <tr>
                            <th>name</th>
                            <th>surname</th>
                            <th>email</th>         
                        </tr>
                    </thead>
                    <tbody>
                        <% for (User u : list) {%>
                        <tr> 
                            <td><%=u.getName()%></td>
                            <td><%=u.getSurname()%></td>
                            <td><%=u.getEmail()%></td>                      
                            <td>
                                <button class="btn btn-danger btn-sm">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                                <button  class="btn btn-secondary btn-sm">
                                    <i class="fa-solid fa-pencil"></i>
                                </button>
                            </td>
                        </tr> <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
