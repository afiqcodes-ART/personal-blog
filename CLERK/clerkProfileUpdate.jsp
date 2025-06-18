<%@include file="connectionDB.jsp" %> 
<!DOCTYPE html> 
<html> 
<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>Clerk Update Profile</title>
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
    <body> 
        <%
            String employee_Name = (String) session.getAttribute("employee_Name");
            if (employee_Name != null) {
                out.println("<h1>Clerk Name: " + employee_Name + "</h1>");
            }

            if (connection == null) {
                out.println("<h1>Error: Database connection is not established.</h1>");
                return;
            }

            try {
                Statement statement = connection.createStatement();
                String querySelectEmployee = "SELECT * FROM Employee WHERE employee_Name = '" + employee_Name + "'";
                ResultSet rsEmployee = statement.executeQuery(querySelectEmployee);
                
                if (rsEmployee.next()) {
                    String employee_IC = rsEmployee.getString("employee_IC");
                    String employeeName = rsEmployee.getString("employee_Name");
                    String employee_Gender = rsEmployee.getString("employee_Gender");
                    String employee_PhoneNumber = rsEmployee.getString("employee_PhoneNumber");
                    String employee_DateOfBirth = rsEmployee.getString("employee_DateOfBirth");
                    String employee_Address = rsEmployee.getString("employee_Address");
                    String employee_Position = rsEmployee.getString("employee_Position");
                    String employee_loginID = rsEmployee.getString("employee_loginID");
        %>
                    <h2>Update Clerk Profile</h2>
                    <form name="clerkProfileUpdate" action="clerkProfileUpdateProcess.jsp" method="post">
                        <div class="info">Employee IC: <%= employee_IC %></div>
                        <input type="hidden" id="employeeIC" name="employee_IC" value="<%= employee_IC %>">
                        
                        <div class="info">Employee Name: <%= employeeName %></div>
                        <input type="hidden" id="employeeName" name="employee_Name" value="<%= employeeName %>">

                        <div class="info">Employee Gender: <%= employee_Gender %></div>
                        <input type="hidden" id="employeeGender" name="employee_Gender" value="<%= employee_Gender %>">

                        <div class="info">Employee Date of Birth: <%= employee_DateOfBirth %></div>
                        <input type="hidden" id="employeeDateOfBirth" name="employee_DateOfBirth" value="<%= employee_DateOfBirth %>">

                        <div class="info">Employee Position: <%= employee_Position %></div>
                        <input type="hidden" id="employeePosition" name="employee_Position" value="<%= employee_Position %>">

                        <div class="info">Employee Login ID: <%= employee_loginID %></div>
                        <input type="hidden" id="employeeLoginID" name="employee_loginID" value="<%= employee_loginID %>">

                        <label for="employeePhoneNumber">Employee Phone Number:</label>
                        <input type="text" id="employeePhoneNumber" name="employee_PhoneNumber" value="<%= employee_PhoneNumber %>">

                        <label for="employeeAddress">Employee Address:</label>
                        <input type="text" id="employeeAddress" name="employee_Address" value="<%= employee_Address %>">

                        <input type="submit" name="updateEmployee" value="Update">
                    </form>
        <%
                } else {
                    out.println("<h1>Error: No employee found with the given login ID.</h1>");
                }
            } catch (SQLException sqlExp) {
                request.setAttribute("error", sqlExp);
                out.println(sqlExp);
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
        <a href="clerkMenu.jsp">Back to Clerk Menu</a><br>
    </body> 
</html>