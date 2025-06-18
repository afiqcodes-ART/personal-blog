<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dispense Medication</title>
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
        <h1>Dispense Medication</h1>

        <!-- Display Existing Entries -->
        <h2>Existing Entries</h2>
        <table border="1">
            <tr>
                <th>Id Treatment</th>
                <th>Medication Code</th>
                <th>Usage Method</th>
                <th>Quantity</th>
                <th>Total Price</th>
            </tr>
            <%
                Connection conn = (Connection) application.getAttribute("connectionDB");
                if (conn != null) {
                    try {
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM DispenseMedication");
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getInt("dispenseMedication_IdTreatment") + "</td>");
                            out.print("<td>" + rs.getString("dispenseMedication_medicationCode") + "</td>");
                            out.print("<td>" + rs.getString("dispenseMedication_UsageMethod") + "</td>");
                            out.print("<td>" + rs.getInt("dispenseMedication_Quantity") + "</td>");
                            out.print("<td>" + rs.getDouble("dispenseMedication_TotalPrice") + "</td>");
                            out.print("</tr>");
                        }
                        rs.close();
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println(e.getMessage());
                    }
                }
            %>
        </table>
        
        <h2>Treatment Records</h2>
        <table border="1">
            <tr>
                <th>Treatment ID</th>
                <th>Patient IC</th>
                <th>Date</th>
                <th>Time</th>
                <th>Illness</th>
                <th>Employee IC</th>
            </tr>
            <%
                if (conn != null) {
                    try {
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM Treatment");
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getInt("treatment_IdTreatment") + "</td>");
                            out.print("<td>" + rs.getString("treatment_PatientIC") + "</td>");
                            out.print("<td>" + rs.getDate("treatment_Date") + "</td>");
                            out.print("<td>" + rs.getTime("treatment_Time") + "</td>");
                            out.print("<td>" + rs.getString("treatment_Illness") + "</td>");
                            out.print("<td>" + rs.getString("treatment_EmployeeIC") + "</td>");
                            out.print("</tr>");
                        }
                        rs.close();
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println(e.getMessage());
                    }
                }
            %>
        </table>
        
        <h2>Patient Records</h2>
        <table border="1">
            <tr>
                <th>Patient IC</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Allergy</th>
            </tr>
            <%
                if (conn != null) {
                    try {
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM Patient");
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getString("patient_IC") + "</td>");
                            out.print("<td>" + rs.getString("patient_Name") + "</td>");
                            out.print("<td>" + rs.getString("patient_Gender") + "</td>");
                            out.print("<td>" + rs.getString("patient_Allergy") + "</td>");
                            out.print("</tr>");
                        }
                        rs.close();
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println(e.getMessage());
                    }
                }
            %>
        </table>

        <!-- Insert New Entry -->
        <h2>Insert New Entry</h2>
        <form action="insertDispenseMedication.jsp" method="post">
            <label for="idTreatment">Id Treatment:</label>
            <input type="text" id="idTreatment" name="idTreatment" required><br>

            <label for="medicationCode">Medication Code:</label>
            <input type="text" id="medicationCode" name="medicationCode" required><br>

            <label for="usageMethod">Usage Method:</label>
            <input type="text" id="usageMethod" name="usageMethod" required><br>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required><br>

            <label for="totalPrice">Total Price:</label>
            <input type="number" step="0.01" id="totalPrice" name="totalPrice" required><br>

            <input type="submit" value="Insert">
        </form>
    </div>
        <a href="doctorMenu.jsp">Back to Doctor Menu</a>
</body>
</html>