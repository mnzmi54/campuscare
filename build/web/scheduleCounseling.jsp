<%-- 
CAMPUSCARE 2026 
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.UserBean"%>
<%
    UserBean user = (UserBean) session.getAttribute("user");
    if(user == null || !user.getRole().equals("Counselor")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Counselor - Schedule Counseling</title>
    </head>
    <body>
        <h1>Schedule Counseling</h1>
        <form action="ScheduleCounselingServlet" method="POST">
            <table border="1" cellspacing="4" cellpadding="4">
                <tbody>
                    <tr>
                        <td>Discipline Record</td>
                        <td>
                            <select name="disciplineID">
                            <%
                                ResultSet rs = (ResultSet) request.getAttribute("disciplineList");

                                if (rs != null) {
                                    while (rs.next()) {
                            %>

                            <option value="<%= rs.getInt("disciplineID") %>">
                                <%= rs.getInt("disciplineID") %>
                                <%= rs.getString("fullName") %>
                                ( <%= rs.getString("offenseType") %>)
                            </option>
                            <%
                                    }
                                } else {
                            %>
                            <option disabled>No discipline records found</option>
                            <%
                                }
                            %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Date:</td>
                        <td><input type="date" name="sessionDate" value="" required/></td>
                    </tr>
                    <tr>
                        <td>Time:</td>
                        <td><input type="time" name="sessionTime" value="" required/></td>
                    </tr>
                    <tr>
                        <td>Notes:</td>
                        <td><textarea name="notes" rows="4" cols="30"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Schedule Session" /><br>
                            <a href="DashboardServlet">Back</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
