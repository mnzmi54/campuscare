<%-- 
CAMPUSCARE 2026 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            ResultSet rs = (ResultSet)request.getAttribute("discipline");
            if(rs == null) {
                out.println("No record found.");
                return;
            }
            rs.next();
        %>
        <form action="UpdateServlet" method="POST">
            <input type="hidden" name="id" value="<%=rs.getInt("disciplineID")%>" />
            <table border="1" cellspacing="4" cellpadding="4">
                <tbody>
                    <tr>
                        <td>Student:</td>
                        <td><%=rs.getString("fullName")%></td>
                    </tr>
                    <tr>
                        <td>Offense:</td>
                        <td><%=rs.getString("offenseType")%></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><%=rs.getString("description")%></td>
                    </tr>
                    <tr>
                        <td>Date:</td>
                        <td><%=rs.getString("offenseDate")%></td>
                    </tr>
                    <tr>
                        <td>Status:</td>
                        <td>
                            <select name="status">
                                <option>Pending</option>
                                <option>Counseling Scheduled</option>
                                <option>Completed</option>
                            </select>
                        </td>
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
