<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("Newpassword");


                try {
                    
                    Class.forName("com.mysql.jdbc.Driver");

                    
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "");
                    PreparedStatement ps = con.prepareStatement("UPDATE student SET Password = ? WHERE email = ?");    
                    
                    ps.setString(1, password); 
                    ps.setString(2, email);   

                    int result = ps.executeUpdate();
                    if (result > 0) {
                        out.println("<p>Password reset successful!</p>");
                    } else {
                        out.println("<p>Error: Email not found or update failed.</p>");
                    }

                } catch (Exception e) {
                    out.println(e);
                }
                finally{
                    out.println("");
            }
        %>
    </body>
</html>
