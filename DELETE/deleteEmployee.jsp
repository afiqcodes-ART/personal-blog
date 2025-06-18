<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="connectionDB.jsp" %> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Delete Employee Form</title> 
        <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
        }
        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h1 {
            margin-bottom: 20px;
        }
        table {
            margin: auto;
            border-collapse: separate;
            border-spacing: 10px;
            width: 100%;
        }
        td {
            text-align: left;
        }
        input[type="text"], input[type="password"], input[type="tel"], select, textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"], input[type="reset"] {
            width: 100px;
            padding: 8px;
            margin: 5px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #0056b3;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    </head> 
    <body> 
        <div class="container">
            <% 
                // Display session 
                String employee_Name = (String) session.getAttribute("employee_Name"); 
                if (employee_Name != null) { 
                    out.println("Clerk Name: " + employee_Name);  
                } 
            %> 
            <h2>Delete Employee</h2> 
            <form name="deleteEmployeeForm" action="deleteEmployee.jsp" method="post"> 
                <div class="form-group">
                    <label for="employeeIC">Employee IC:</label>
                    <input type="text" id="employeeIC" name="employeeIC" size="10" required> 
                </div>
                <div class="form-group">
                    <button type="submit" name="deleteEmployeeIC" 
                            onclick="return confirm('Are you sure you want to delete this employee?')">Delete Employee</button>
                </div>
            </form> 
            <% 
                if (request.getParameter("deleteEmployeeIC") != null) { 
                    String employeeIC = request.getParameter("employeeIC");

                    Connection conn = (Connection) application.getAttribute("connectionDB");
                    PreparedStatement pstmt = null;

                    if (conn != null && employeeIC != null && !employeeIC.isEmpty()) {
                        try {
                            String sql = "DELETE Employee, Login FROM Employee"
                                         + " INNER JOIN Login ON Login.login_loginID = Employee.employee_loginID"
                                         + " WHERE employee_IC = ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, employeeIC);

                            int rowsAffected = pstmt.executeUpdate();
                            if (rowsAffected > 0) {
                                out.println("Employee record deleted successfully.");
                            } else {
                                out.println("No employee found with the provided IC.");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("Error: " + e.getMessage());
                        } finally {
                            try {
                                if (pstmt != null) pstmt.close();
                                // Do not close the connection here, as it is shared across the application
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    } else {
                        out.println("Database connection is not available or employee IC is empty.");
                    }
                } 
            %>
            <br> 
            <a href="clerkMenu.jsp">Back to Menu</a> 
        </div>
    </body> 
</html>