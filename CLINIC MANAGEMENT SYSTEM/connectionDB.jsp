<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connection DB</title>
    </head>
    <body>
        <% 
            Connection connection=null;
            try{
                //declaration and connection to database MySQL
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost/sql_afiqfauzan";
                String username ="sql_afiqfauzan";
                String passwordMySQL ="zRAzrLBTRfRLkfdH";
                connection = DriverManager.getConnection(url,username,passwordMySQL);
                application.setAttribute("connectionDB", connection);
            }
            catch (Exception e){
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                //System.out.println(e.getMessage()); //Digunakan untuk keluarkan output pada IDE masing2.
                e.printStackTrace();
                out.println(e.getMessage()); //Digunakan untuk keluarkan output pada web browser.
            }
     %>
    </body>
</html>
