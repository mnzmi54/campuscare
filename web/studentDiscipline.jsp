<%-- CAMPUSCARE 2026 --%>
<%@page import="bean.UserBean"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserBean user = (UserBean) session.getAttribute("user");
    if(user == null || !user.getRole().equals("Student")) {
        response.sendRedirect("login.jsp");
        return;
    }
    ResultSet rs = (ResultSet)request.getAttribute("disciplineList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Discipline Records</title>
    </head>
    <body>
        <h1>My Discipline Records</h1>
        <table border="1" cellspacing="4" cellpadding="4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Offense</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <%
                if(rs != null) {
                    while(rs.next()) {
            %>
            <tbody>
                <tr>
                    <td><%=rs.getInt("disciplineID")%></td>
                    <td><%=rs.getString("offenseType")%></td>
                    <td><%=rs.getString("description")%></td>
                    <td><%=rs.getString("offenseDate")%></td>
                    <td><%=rs.getString("status")%></td>
                </tr>
            </tbody>
            <%
                    }
                }
            %>
        </table>
        <a href="DashboardServlet">Back</a>
    </body>
</html>
