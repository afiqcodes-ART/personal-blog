<%@include file="connectionDB.jsp" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
        }

        .background-box {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 600px;
            margin-bottom: 20px; /* Add margin bottom to create space for the footer */
        }

        .container {
            text-align: center;
        }

        h1,
        h2 {
            margin-bottom: 20px;
        }

        a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            text-decoration: none;
            color: #007BFF;
            border: 1px solid #007BFF;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        a:hover {
            background-color: #007BFF;
            color: white;
        }

        .footer {
            text-align: center;
            font-size: 0.8em;
            color: #555;
            margin-top: 20px;
        }

        /* Style for form input fields */
        input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type=submit] {
            background-color: #007BFF;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type=submit]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body> 
    <div class="background-box">
        <div class="container"> 
            <h1>Employee Password </h1> 
            <% 
                // Check session attributes 
                String LoginId = (String) session.getAttribute("username"); 

                if (LoginId != null) {  
                    out.println("");   
                } else { 
                    out.println("Employee Name is not set in the session.<br>"); 
                } 
            %>  

            <form name="ChangePassword" action="pharmacistChangePasswordProcess.jsp" method="post"> 
            <%    
                if (LoginId != null) { 
                    try {  
                        Statement statement = connection.createStatement();  
                        String querySelectEmployee = "SELECT * FROM Login WHERE login_loginID = '" + LoginId + "'"; 
                         
                        ResultSet rsEmployee = statement.executeQuery(querySelectEmployee);  

                        if (rsEmployee.next()) {  
                            // Declare and get value from attribute in table Employee  
                            String loginID = rsEmployee.getString("login_loginID");  
                            String Password = rsEmployee.getString("login_password");  
                            String Type = rsEmployee.getString("login_type");  
                             
            %>  
             
                            <input type="hidden" name="LoginEmployee" value="<%= loginID %>">  
                            Employee ID:  <%= loginID %><br>  
                             
                            Employee Password:   
                            <input type="password" name="employeePass" value="<%= Password %>"><br>  
                             
                            <!-- button submit-->  
                            <input type="submit" name="update" value="Update">  
                            </form> 
            <%  
                        } else { 
                            out.println("No employee found with name: " + LoginId + "<br>"); 
                        } 
                    } catch(SQLException sqlExp) {  
                        request.setAttribute("error", sqlExp);  
                        out.println("SQL Exception: " + sqlExp + "<br>");  
                    } finally {  
                        if (connection != null) { 
                            try { 
                                connection.close(); 
                            } catch(SQLException e) { 
                                out.println("Error closing connection: " + e.getMessage() + "<br>"); 
                            } 
                        } 
                    } 
                } else { 
                    out.println("Employee login ID is not set in the session, skipping database query.<br>"); 
                } 
            %>   
            </form>  
            <a href="clerkMenu.jsp">Back to Clerk Menu</a><br> 
        </div>
    </div>
</body> 
</html>
