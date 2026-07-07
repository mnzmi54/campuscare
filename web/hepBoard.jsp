<%-- 
CAMPUSCARE 2026
--%>
<%@page import="bean.UserBean" %>
<%@page import="java.sql.*" %>
<%
    UserBean user = (UserBean) session.getAttribute("user");
    if(user == null || !user.getRole().equals("HEP")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HEP Dashboard</title>
    </head>
    <body>
        <section id="topbar">
            <div class="social-links">
                <a href="LoadDisciplineServlet">Add Discipline Record</a>
            <a href="ViewDisciplineServlet">View All Discipline Record</a>
            <a href='LogoutServlet'>Logout</a>
            </div>
        </section>
        <h1>HEP Dashboard</h1>
        <h3>Welcome, <%=user.getFullName() %></h3>
        <p>Role: <%=user.getRole() %></p>
        <h2>Dashboard Statistics</h2>
        <table border="1" cellspacing="4" cellpadding="4">
            <tbody>
                <tr>
                    <td>Total Discipline Records</td>
                    <td><%=request.getAttribute("totalDiscipline")%></td>
                </tr>
                <tr>
                    <td>Pending Cases</td>
                    <td><%=request.getAttribute("pendingDiscipline")%></td>
                </tr>
                <tr>
                    <td>Total Counseling Sessions</td>
                    <td><%=request.getAttribute("scheduledSession")%></td>
                </tr>
                <tr>
                    <td>Completed Sessions</td>
                <td><%=request.getAttribute("completedSession")%></td>
                </tr>
            </tbody>
        </table>
        <br>
        <h3>Most Common Offense</h3>
        <%
            ResultSet top = (ResultSet)request.getAttribute("topOffense");
            if(top != null && top.next()) {
        %>
        <b><%=top.getString("offenseType")%></b>
        (<%=top.getInt("total")%> cases)
        <%
            }
        %>
    </body>
</html>
