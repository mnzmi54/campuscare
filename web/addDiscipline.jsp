<%-- CAMPUSCARE 2026 --%>

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
        <title>HEP - Add Discipline Record</title>
    </head>
    <body>
        <h1>Add Discipline Record</h1>
        <form action="DisciplineServlet" method="POST">
            <table border="1" cellspacing="4" cellpadding="4">
                <tbody>
                    <tr>
                        <td>Student ID:</td>
                        <td>
                            <select name="studentID">
                            <%
                                ResultSet rs = (ResultSet) request.getAttribute("students");

                                if (rs != null) {
                                    while (rs.next()) {
                            %>

                            <option value="<%= rs.getInt("userID") %>">
                                <%= rs.getString("fullName") %>
                            </option>
                            <%
                                    }
                                } else {
                            %>
                            <option disabled>No students found</option>
                            <%
                                }
                            %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Offense Type:</td>
                        <td><input type="text" name="offenseType" value="" required/></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><textarea name="description"></textarea></td>
                    </tr>
                    <tr>
                        <td>Date:</td>
                        <td><input type="date" name="offenseDate" value="" required/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Submit" /><br>
                            <a href="DashboardServlet">Back</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
