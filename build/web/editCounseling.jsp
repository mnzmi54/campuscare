<%-- 
CAMPUSCARE 2026
--%>
<%@page import="java.sql.*"%>
<%@page import="bean.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserBean user = (UserBean)session.getAttribute("user");
    if(user == null || !user.getRole().equals("Counselor")) {
        response.sendRedirect("login.jsp");
        return;
    }
    ResultSet rs = (ResultSet)request.getAttribute("session");
    rs.next();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Counseling Session</title>
    </head>
    <body>
        <h1>Edit Counseling Session</h1>
        <form action="UpdateCounselingServlet" method="POST">
            <input type="hidden" name="sessionID" value="<%=rs.getInt("sessionID")%>" />
            <table border="1" cellspacing="4" cellpadding="4">
                <tbody>
                    <tr>
                        <td>Status:</td>
                        <td><select name="status">
                                <option>Scheduled</option>
                                <option>Completed</option>
                                <option>Missed</option>
                                <option>Cancelled</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Notes:</td>
                        <td><textarea name="notes" rows="5" cols="30"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Update" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
