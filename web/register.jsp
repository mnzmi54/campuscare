<%-- 
CAMPUSCARE 2026
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register Page</h1>
        <p>This is the register page for Counselor</p>
        <form action="RegisterServlet" method="POST">
            <table border="1" cellspacing="4" cellpadding="4">
                <tbody>
                    <tr>
                        <td>Full Name:</td>
                        <td><input type="text" name="fullName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Role:</td>
                        <td><select name="role">
                                <option value="">== Select Role ==</option>
                                <option value="Student">Student</option>
                                <option value="HEP">HEP Officer</option>
                                <option vlaue="Counselor">Counselor</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Register" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
        <a href="index.html">Back to Main Menu</a>
    </body>
</html>
