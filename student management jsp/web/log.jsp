<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login User</title>
</head>
<body>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

   
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "");
        
        
        PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE email=? AND Password=?");
        ps.setString(1, email);
        ps.setString(2, password); 
        
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            out.println("successful");
            
           
        } else {
            out.println("<h2>Invalid email or password</h2>");
            out.println("<a href='log.html'>Go Back to Login</a>");
        }
    } catch (Exception e) {
        // )
        System.err.println("Error: " + e.getMessage());
        out.println("<h2>Something went wrong. Please try again later.</h2>");
    }
%>
</body>
</html>
