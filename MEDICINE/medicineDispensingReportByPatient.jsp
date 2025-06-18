<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medication Report</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
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
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 1000px;
        margin-top: 20px;
    }

    h1 {
        margin-bottom: 20px;
    }

    table {
        margin: auto;
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        border: 1px solid #ddd;
    }

    th {
        background-color: #007BFF;
        color: white;
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

    input[type="text"], input[type="number"], input[type="submit"] {
        padding: 8px;
        margin: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
<body>
    <div class="container">
        <h1>Medicine Dispensing By Patient</h1>

        <!-- Search Form -->
        <form action="medicineDispensingReportByPatient.jsp" method="post">
            <label for="patientIC">Patient IC:</label>
            <input type="text" id="patientIC" name="patient_IC" required>
            <input type="submit" value="Search">
        </form>

        <!-- Display Search Results -->
        <%
            String patientIC = request.getParameter("patient_IC");
            if (patientIC != null && !patientIC.isEmpty()) {
                Connection conn = (Connection) application.getAttribute("connectionDB");
                if (conn != null) {
                    try {
                        // Query to fetch dispense medication records for the given patient IC
                        String query = "SELECT dm.*, t.treatment_Date, t.treatment_Time " +
                                       "FROM DispenseMedication dm " +
                                       "JOIN Treatment t ON dm.dispenseMedication_IdTreatment = t.treatment_IdTreatment " +
                                       "WHERE t.treatment_PatientIC = ?";
                        PreparedStatement pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, patientIC);
                        ResultSet rs = pstmt.executeQuery();
        %>
                        <h2>Medicine Dispensing for Patient IC: <%= patientIC %></h2>
                        <table border="1">
                            <tr>
                                <th>Treatment ID</th>
                                <th>Medication Code</th>
                                <th>Usage Method</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th>Date</th>
                                <th>Time</th>
                            </tr>
        <%                  
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getInt("dispenseMedication_IdTreatment") + "</td>");
                            out.print("<td>" + rs.getString("dispenseMedication_medicationCode") + "</td>");
                            out.print("<td>" + rs.getString("dispenseMedication_UsageMethod") + "</td>");
                            out.print("<td>" + rs.getInt("dispenseMedication_Quantity") + "</td>");
                            out.print("<td>" + rs.getDouble("dispenseMedication_TotalPrice") + "</td>");
                            out.print("<td>" + rs.getDate("treatment_Date") + "</td>");
                            out.print("<td>" + rs.getTime("treatment_Time") + "</td>");
                            out.print("</tr>");
                        }
                        rs.close();
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println(e.getMessage());
                    }
                }
            }
        %>
        </table>
        <a href="doctorMenu.jsp">Back to Doctor Menu</a>
    </div>
</body>
</html>
