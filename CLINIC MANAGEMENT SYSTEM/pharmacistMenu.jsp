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
            <h1>Welcome To Pharmacist Menu</h1>
            
            <h2>Pharmacist Profile</h2>
            <a href="pharmacistProfileUpdate.jsp">Update Pharmacy Profile</a>
            <a href="pharmacistChangePassword.jsp">Change Password</a>
            
            <h2>Medicine Menu</h2>
            <a href="medicineRegisterForm.jsp">Add Medicine</a>
            <a href="updateMedicine.jsp">Update Medicine</a>
            <a href="deleteMedicine.jsp">Delete Medicine</a>
            
            <h2>Payment Menu</h2>
            <a href="treatmentReportByDate.jsp">List Of Treatments(Today)</a>
            <a href="addPayment.jsp">Add New Payment</a>

            <a href="displayDetailTreatmentAndPayment.jsp">Display Detail Treatment And Payment-Update</a>
            
            
            <h2>Report Menu</h2>
            <a href="medicineReport.jsp">All Medicine Report</a>
            <a href="medicineReportByCategory.jsp">Medicine Report By Medicine Category</a>
   
            <a href="paymentReportByDate.jsp">Payment Report by Date(From Date to Date)</a>
            
        </div>
    </div>
    <div class="footer">
        &copy; Afiq Fauzan 2024. All rights reserved.
    </div>
    <!-- Include any necessary JavaScript -->
</body>
</html>
