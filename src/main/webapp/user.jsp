<%@page import="org.example.main.Context"%>
<%@page import="org.example.dao.inter.UserDaoInter"%>
<%@page import="org.example.entity.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Page</title>
</head>
<body>
<%
UserDaoInter userDao = Context.instanceUserDao();
String name= request.getParameter("name");
String surname= request.getParameter("surname");
String nationalityIdStr= request.getParameter("nid");
Integer nationalityId =null;
if(nationalityIdStr!=null && !nationalityIdStr.trim().isBlank()){
 nationalityId= Integer.parseInt(request.getParameter("nid"));
}
List <User> list = userDao.getAll(name,surname,nationalityId);
    %>
    <div>
        <form action="user.jsp" method="GET">
            <label for="name">name: </label>
            <input type="text" name="name" value=""/>
            <input type="hidden" name="id"/>
            <label for="surname">surname: </label>
            <input type="text" name="surname" value=""/>
            <input type="submit" name="search" value="Search"/>
        </form>
    </div>
    <div>
        <table>
            <thead>
            <tr>
                <th>name</th>
                <th>surname</th>
                <th>email</th>
            </tr>
            </thead>
            <tbody>
                <% for(User u: list){ %>
                <tr> <td><%=u.getName()%></td>
                    <td><%=u.getSurname()%></td>
                    <td><%=u.getEmail()%></td>
                </tr> <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
