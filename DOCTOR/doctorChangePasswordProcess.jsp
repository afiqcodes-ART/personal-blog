<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@include file="connectionDB.jsp" %> 
<%@page import="java.sql.PreparedStatement"%>  
<!DOCTYPE html>  
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>Update Supplier in MySQL Process</title>  
    </head>  
    <body>  
        <%  
             
             
            try{  
                PreparedStatement psUpdatePassword = null;  
                  
                String employeeID = request.getParameter("LoginEmployee");  
                String employeePass = request.getParameter("employeePass"); 
                                   
                String updatepasswordSQL =" UPDATE Login SET login_password = ? "  
                        + "WHERE login_loginID = '" + employeeID  + "'" ;  
                         
                psUpdatePassword = connection.prepareStatement(updatepasswordSQL);  
                psUpdatePassword.setString(1, employeePass);  
                 
                  
                int i = psUpdatePassword.executeUpdate();  
                  
                if (i>=1)  
                    out.println("<script>alert('Password Updated!'); "  
                            + "window.location.href='clerkChangePassword.jsp';</script>");  
                else  
                    out.println("<script>alert('Password cannot be updated'); "  
                            + "window.location.href='clerkChangePassword.jsp';</script>");  
          }  
            catch(SQLException sqlExp)  
            {  
                request.setAttribute("error", sqlExp);  
                out.println(sqlExp);  
            }  
            finally  
            {  
                if (connection !=null)  
                    connection.close();  
            }  
        %>  
        <br>  
    </body>  
</html>