<%-- 
CAMPUSCARE 2026
--%>
<%@page import="bean.UserBean" %>
<%
    UserBean user = (UserBean) session.getAttribute("user");
    if(user == null || !user.getRole().equals("Student")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dashboard</title>
    </head>
    <body>
        <h1>Student Dashboard</h1>
        <h3>Welcome, <%=user.getFullName() %></h3>
        <p>Role: <%=user.getRole() %></p>
        <p>
            This is the Student Dashboard.
            Dashboard will show Student Management, Discipline Records, Counseling Sessions, Analytics
        </p>
        <a href="StudentServlet">My Discipline Records</a>
        <a href='LogoutServlet'>Logout</a>
    </body>
</html>