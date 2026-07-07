<%-- 
CAMPUSCARE 2026
--%>
<%@page import="bean.UserBean" %>
<%
    UserBean user = (UserBean) session.getAttribute("user");
    if(user == null || !user.getRole().equals("Counselor")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Counselor Dashboard</title>
    </head>
    <body>
        <h1>Staff Dashboard</h1>
        <h3>Welcome, <%=user.getFullName() %></h3>
        <p>Role: <%=user.getRole() %></p>
        <p>
            This is the Staff Dashboard.
            Dashboard will show staff's assigned/pending counseling session(?)
        </p>
        <a href="ScheduleCounselingServlet">Schedule</a>
        <a href="ViewCounselingServlet">View Schedule Record</a>
        <a href='LogoutServlet'>Logout</a>
    </body>
</html>
