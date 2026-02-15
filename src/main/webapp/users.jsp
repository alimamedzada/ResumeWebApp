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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
        <script src="assets/js/users.js"></script>F
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
                <div class="col-4">
                    <form action="users" method="GET">
                        <div class="form-group">
                            <label for="name">name: </label>
                            <input placeholder="Enter name" class="form-control" type="text" name="name" value="" id="whatIamTyping"/>
                        </div>
                        <div class="control_panel_group">
                            <label for="surname">surname: </label>
                            <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
                        </div>
                        <input class="btn btn-primary" type="submit" value="Search" id ="btnsearch"/>
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
                            <td><%= (u.getBirthPlace() != null) ? u.getBirthPlace().getName() : "Bilinmiyor"%></td>
                            <td><%= (u.getNationality() != null) ? u.getNationality().getNationality() : "Bilinmiyor"%></td>
                            <td style="width: 10px">             
                                <input type="hidden" name="id" value="<%=u.getId()%>" />
                                <input type="hidden" name="action" value="delete" />
                                <button class="btn btn-danger btn-sm" onclick="idForDelete('<%=u.getId()%>')" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    <i class="fa-solid fa-trash"></i>
                                </button>  
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

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure?
                    </div>
                    <div class="modal-footer">
                        <form action="userdetail" method="POST">
                            <input type="hidden" name="id" value="" id="idForDelete"/>   
                            <input type="hidden" value="delete" name="action"/>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <input button type="submit" class="btn btn-danger" value="Delete"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
