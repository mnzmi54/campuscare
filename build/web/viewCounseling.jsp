<%-- 
CAMPUSCARE 2026
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.UserBean"%>
<%
    UserBean user = (UserBean)session.getAttribute("user");
    if(user == null || !user.getRole().equals("Counselor")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Counseling Sessions</title>
    </head>
    <body>
        <h1>Counseling Sessions</h1>
        <table border="1" cellspacing="4" cellpadding="4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Offense</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <%
                ResultSet rs = (ResultSet)request.getAttribute("sessionList");
                if(rs != null) {
                    while(rs.next()) {
            %>
            <tbody>
                <tr>
                    <td><%= rs.getInt("sessionID") %></td>
                    <td><%= rs.getString("fullName") %></td>
                    <td><%= rs.getString("offenseType") %></td>
                    <td><%= rs.getString("sessionDate") %></td>
                    <td><%= rs.getString("sessionTime") %></td>
                    <td><%= rs.getString("sessionStatus") %></td>
                    <td>
                        <a href="EditCounselingServlet?id=<%=rs.getInt("sessionID")%>">Update</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
            <a href="DashboardServlet">Back</a>
    </body>
</html>
