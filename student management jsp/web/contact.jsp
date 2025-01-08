<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User</title>
    </head>
    <body>
        <h1>User Registration</h1>
     
        <%
             String name = request.getParameter("name");
             String email = request.getParameter("email");
             String subject = request.getParameter("subject");
             String message = request.getParameter("message");

          
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "");
                   PreparedStatement  ps = con.prepareStatement("INSERT INTO contact  VALUES (?,?,?,?)");
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, subject);
                    ps.setString(4, message);
                    int i = ps.executeUpdate();

                    if(i > 0) {
                        out.println("Thank You For Your Message.!");
                    }
                } 
                catch(Exception e) {
                   out.println("Error: " + e.getMessage());
                }
//                finally{
//                    out.println("");
//           }
        %>
    </body>
</html>
