<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patient Treatment Registration Process</title>
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
        <h1>Patient Treatment Registration Process</h1>
        <%
            String treatment_IdTreatment = request.getParameter("treatment_IdTreatment");
            String treatment_PatientIC = request.getParameter("treatment_PatientIC");
            String treatment_Date = request.getParameter("treatment_Date");
            String treatment_Time = request.getParameter("treatment_Time");
            String treatment_Illness = request.getParameter("treatment_Illness");
            String treatment_EmployeeIC = request.getParameter("treatment_EmployeeIC");

            if (treatment_IdTreatment != null && treatment_PatientIC != null && treatment_Date != null &&
                treatment_Time != null && treatment_Illness != null && treatment_EmployeeIC != null) {
                
                try {
                    Statement statement = connection.createStatement();
                    String queryInsertTreatment = "INSERT INTO Treatment (treatment_IdTreatment, treatment_PatientIC, treatment_Date, treatment_Time, treatment_Illness, treatment_EmployeeIC) VALUES ('" 
                        + treatment_IdTreatment + "', '" 
                        + treatment_PatientIC + "', '" 
                        + treatment_Date + "', '" 
                        + treatment_Time + "', '" 
                        + treatment_Illness + "', '" 
                        + treatment_EmployeeIC + "')";
                    int result = statement.executeUpdate(queryInsertTreatment);
                    
                    if (result > 0) {
                        out.println("<h2>Patient treatment registered successfully!</h2>");
                    } else {
                        out.println("<h2>Failed to register patient treatment. Please try again.</h2>");
                    }
                } catch (SQLException sqlExp) {
                    out.println("<h2>Error: " + sqlExp.getMessage() + "</h2>");
                } finally {
                    if (connection != null) {
                        try {
                            connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                out.println("<h2>All fields are required!</h2>");
            }
        %>
       
    </div>
</body>
</html>
