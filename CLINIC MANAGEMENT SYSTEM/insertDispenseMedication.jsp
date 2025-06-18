<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Dispense Medication</title>
</head>
<body>
    <div class="container">
        <h1>Insert Dispense Medication</h1>
        <%
           
            try {
                connection = (Connection) application.getAttribute("connectionDB");

                String idTreatment = request.getParameter("idTreatment");
                String medicationCode = request.getParameter("medicationCode");
                String usageMethod = request.getParameter("usageMethod");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

                // Validate if treatment_IdTreatment exists in Treatment table
                String validationQuery = "SELECT COUNT(*) FROM Treatment WHERE treatment_IdTreatment = ?";
                PreparedStatement validationStmt = connection.prepareStatement(validationQuery);
                validationStmt.setInt(1, Integer.parseInt(idTreatment));
                ResultSet rs = validationStmt.executeQuery();
                rs.next();
                int count = rs.getInt(1);
                rs.close();
                validationStmt.close();

                if (count > 0) {
                    String query = "INSERT INTO DispenseMedication (dispenseMedication_IdTreatment, dispenseMedication_medicationCode, dispenseMedication_UsageMethod, dispenseMedication_Quantity, dispenseMedication_TotalPrice) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement pstmt = connection.prepareStatement(query);
                    pstmt.setInt(1, Integer.parseInt(idTreatment));
                    pstmt.setString(2, medicationCode);
                    pstmt.setString(3, usageMethod);
                    pstmt.setInt(4, quantity);
                    pstmt.setDouble(5, totalPrice);
                    int result = pstmt.executeUpdate();

                    if (result > 0) {
                        out.println("<p>Record inserted successfully!</p>");
                    } else {
                        out.println("<p>Failed to insert record.</p>");
                    }
                    pstmt.close();
                } else {
                    out.println("<p>Invalid Treatment ID. Please ensure the Treatment ID exists in the Treatment table.</p>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println(e.getMessage());
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
        <a href="treatmentAndDispenceMedication.jsp">Back to Dispense Medication</a>
    </div>
</body>
</html>