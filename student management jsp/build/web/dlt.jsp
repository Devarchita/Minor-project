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
            

          
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "");
                   PreparedStatement ps=con.prepareStatement("DELETE FROM student WHERE email = ?");                   
                    ps.setString(1, email);
                   
                    

                    int i = ps.executeUpdate();

                    if(i > 0) {
                        out.println("Deleted Account successfully!");
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
