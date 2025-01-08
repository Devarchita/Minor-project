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
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gend = request.getParameter("gender");
            String date = request.getParameter("date");

          
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "");
                   PreparedStatement  ps = con.prepareStatement("INSERT INTO student  VALUES (?,?,?,?,?)");
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, password);
                    ps.setString(4, gend);
                     ps.setString(5, date);
                    int i = ps.executeUpdate();

                    if(i > 0) {
                        out.println("User registered successfully!");
                    }
                } 
                catch(Exception e) {
                   out.println("Error: " + e.getMessage());
                }
                       %>
    </body>
</html>
