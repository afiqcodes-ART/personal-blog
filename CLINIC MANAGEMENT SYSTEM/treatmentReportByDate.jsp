<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ include file="connectionDB.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Treatment Report By Date</title>
</head>
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
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 1000px;
        }
        h1 {
            margin-bottom: 20px;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        input[type="date"], input[type="submit"] {
            padding: 8px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
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
<body>
    <div class="container">
        <h1>Treatment Report By Date</h1>
        <form method="post" action="treatmentReportByDate.jsp">
            <label for="treatmentDate">Select Date:</label>
            <input type="date" id="treatment_IdTreatment" name="treatment_IdTreatment" required>
            <input type="submit" value="Generate Report">
        </form>

        <% 
            String IdTreatment = request.getParameter("treatment_IdTreatment");
            if (IdTreatment != null && !IdTreatment.isEmpty()) {
                Connection conn = (Connection) application.getAttribute("connectionDB");
                if (conn != null) {
                    String query = "SELECT * FROM Treatment WHERE treatment_Date = ?";
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, IdTreatment);
                        rs = pstmt.executeQuery();
        %>
        <h2>Treatment Report <%= IdTreatment %></h2>
        <table>
            <thead>
                <tr>
                    <th>Treatment ID</th>
                    <th>Patient IC</th>
                    <th>Treatment Date</th>
                    <th>Treatment Time</th>
                    <th>Treatment Illness</th>
                    <th>Treatment Employee IC</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("treatment_IdTreatment") %></td>
                    <td><%= rs.getString("treatment_PatientIC") %></td>
                    <td><%= rs.getString("treatment_Date") %></td>
                    <td><%= rs.getString("treatment_Time") %></td>
                    <td><%= rs.getString("treatment_Illness") %></td>
                    <td><%= rs.getString("treatment_EmployeeIC") %></td>
                    
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
        <%
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Error: " + e.getMessage());
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    out.println("Database connection is not available.");
                }
            }
        %>
        <br>
        <a href="pharmacistMenu.jsp">Return To Pharmacist Menu</a>
    </div>
</body>
</html>