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
            List<User> list = (List<User>) request.getAttribute("foundUsers");
        %>
        <div class="container mycontainer">
            <div class="row">
                <div class="col-sm-6">
                    <form action="users" method="GET">
                        <div class="form-group">
                            <label for="name">name: </label>
                            <input placeholder="Enter name" class="form-control" type="text" name="name" value=""/>
                        </div>
                        <div class="control_panel_group">
                            <label for="surname">surname: </label>
                            <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
                        </div>
                        <input class="btn btn-primary"type="submit" value="Search"/>
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
                            <th>phone</th>         
                            <th>birth date</th>         
                            <th>birthplace</th>      
                            <th>nationality</th>   
                            <!--<th>skills</th>-->         



                            <th></th>         
                            <th></th>         
                        </tr>
                    </thead>
                    <tbody>
                        <% for (User u : list) {%>
                        <tr> 
                            <td><%=u.getName()%></td>
                            <td><%=u.getSurname()%></td>
                            <td><%=u.getEmail()%></td>      
                            <td><%=u.getPhone()%></td>  
                            <td><%=u.getBirthDate()%></td>    
                            <td><%=u.getBirthPlace().getName()%></td>  
                            <td><%=u.getNationality().getNationality()%></td>   
                   <!--//          <td><%=u.getSkills()%></td>-->     


                            <td style="width: 10px">             
                                <form action="userdetail" method="Post">
                                    <input type="hidden" name="id" value="<%=u.getId()%>" />
                                    <input type="hidden" name="action" value="delete" />
                                    <button class="btn btn-danger btn-sm">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>  
                                </form>
                            </td>    
                            <td style="width: 10px">          
                                <form action="userdetail" method="GET">
                                    <input type="hidden" name="id" value="<%=u.getId()%>" />
                                    <input type="hidden" name="action" value="update" />
                                    <button  class="btn btn-secondary btn-sm">
                                        <i class="fa-solid fa-pencil"></i>
                                    </button>
                                </form>
                            </td>
                        </tr> <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
