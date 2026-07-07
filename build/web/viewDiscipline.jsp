<%-- 
CAMPUSCARE 2026 
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.UserBean"%>
<%
    UserBean user = (UserBean) session.getAttribute("user");
    if(user == null || !user.getRole().equals("HEP")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discipline Records</title>
    </head>
    <body>
        <h1>Discipline Records</h1>
        <table border="1" cellspacing="4" cellpadding="4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Offense</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
        <%
        ResultSet rs = (ResultSet) request.getAttribute("disciplineList");

        if (rs != null) {
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("disciplineID") %></td>
            <td><%= rs.getString("fullName") %></td>
            <td><%= rs.getString("offenseType") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getString("offenseDate") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <a href="EditDisciplineServlet?id=<%=rs.getInt("disciplineID")%>">Edit</a> |
                <a href="DeleteDisciplineServlet?id=<%=rs.getInt("disciplineID")%>">Delete</a>
            </td>
        </tr>
        <%
            }
        }
        %>
            </tbody>
        </table>
        <br>
        <a href="DashboardServlet">Back</a>
    </body>
</html>
