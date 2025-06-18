<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clerk Menu</title>
    <link rel="stylesheet" href="style.css">
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

        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 600px;
            margin-bottom: 20px; /* Add margin bottom to create space for the footer */
        }

        .menu h1, .menu h2 {
            margin-bottom: 20px;
        }

        .menu a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            text-decoration: none;
            color: #007BFF;
            border: 1px solid #007BFF;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .menu a:hover {
            background-color: #007BFF;
            color: white;
        }

        .footer {
            text-align: center;
            font-size: 0.8em;
            color: #555;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
        String employee_Name = (String) session.getAttribute("employee_Name");
        if (employee_Name != null){
            out.println("<h1>Clerk Name: " + employee_Name + "</h1>");
        }
        %>
        <div class="menu">
            <h1>Welcome To Doctor Menu</h1>
            
            <h2>Doctor Profile</h2>
            <a href="doctorProfileUpdate.jsp">Update Doctor Profile</a>
            <a href="doctorChangePassword.jsp">Change Password</a>
            
            <h2>Transactions And Prescription Menu</h2>
            <a href="treatmentAndDispenceMedication.jsp">Treatment And Dispencing Medicine</a>
            
            <h2>Report Menu</h2>
            <a href="treatmentReportByPatient.jsp">Treatment Report By Patient</a>
            <a href="medicineDispensingReportByPatient.jsp">Medicine Dispensing Report By Patient</a>
            
        </div>
    </div>
    <div class="footer">
        &copy; Afiq Fauzan 2024. All rights reserved.
    </div>
    <!-- Include any necessary JavaScript -->
</body>
</html>
