<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ include file="connectionDB.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment Report By Date</title>
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
</head>
<body>
    <div class="container">
        <h1>Payment Report By Date</h1>
        <form method="post" action="paymentReportByDate.jsp">
            <label for="paymentDate">Select Date:</label>
            <input type="date" id="paymentDate" name="payment_Date" required>
            <input type="submit" value="Generate Report">
        </form>

        <%
            String paymentDate = request.getParameter("payment_Date");
            if (paymentDate != null && !paymentDate.isEmpty()) {
                Connection conn = (Connection) application.getAttribute("connectionDB");
                if (conn != null) {
                    String query = "SELECT * FROM Payment WHERE payment_Date = ?";
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, paymentDate);
                        rs = pstmt.executeQuery();
        %>
        <h2>Payment Report for <%= paymentDate %></h2>
        <table>
            <thead>
                <tr>
                    <th>Payment ID</th>
                    <th>Treatment ID</th>
                    <th>Payment Date</th>
                    <th>Payment Time</th>
                    <th>Payment Status</th>
                    <th>Total Payment</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("payment_IdPayment") %></td>
                    <td><%= rs.getString("payment_IdTreatment") %></td>
                    <td><%= rs.getString("payment_Date") %></td>
                    <td><%= rs.getString("payment_Time") %></td>
                    <td><%= rs.getString("payment_Status") %></td>
                    <td><%= rs.getString("payment_TotalPayment") %></td>
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
