<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment Registration Process</title>
</head>
<body>
    <h1>Display Output</h1>
    <%
        Statement stmtSQLpayment = null;
        try {
            stmtSQLpayment = connection.createStatement();
            
            // Declaration of variables
            String payment_IdPayment;
            String payment_IdTreatment;
            String payment_Date;
            String payment_Time;
            String payment_Status;
            String payment_TotalPayment;
            
            // Request parameters from the form and assign to variables
            payment_IdPayment = request.getParameter("payment_IdPayment");
            payment_IdTreatment = request.getParameter("payment_IdTreatment");
            payment_Date = request.getParameter("payment_Date");
            payment_Time = request.getParameter("payment_Time");
            payment_Status = request.getParameter("payment_Status");
            payment_TotalPayment = request.getParameter("payment_TotalPayment");
            
            // SQL query to insert the payment data into the database
            String sqlInsertPayment = "INSERT INTO Payment "
                + "(payment_IdPayment, payment_IdTreatment, payment_Date, "
                + "payment_Time, payment_Status, payment_TotalPayment) "
                + "VALUES ('" + payment_IdPayment + "', '" + payment_IdTreatment
                + "', '" + payment_Date + "', '" + payment_Time + "', '"
                + payment_Status + "', '" + payment_TotalPayment + "')";
            
            int rowPayment = stmtSQLpayment.executeUpdate(sqlInsertPayment);
            
            if (rowPayment > 0) {
                out.println("<br>Payment successfully inserted into table Payment.");
                // Display the entered data on the web page
                out.println("<br>Payment ID: " + payment_IdPayment);
                out.println("<br>Payment ID Treatment: " + payment_IdTreatment);
                out.println("<br>Payment Date: " + payment_Date);
                out.println("<br>Payment Time: " + payment_Time);
                out.println("<br>Payment Status: " + payment_Status);
                out.println("<br>Payment Total: " + payment_TotalPayment);
            } else {
                out.println("<br>Failed to insert payment into table Payment.");
            }
        } catch (SQLException sqlError) {
            request.setAttribute("Error:", sqlError);
            out.println(sqlError);
        } finally {
            if (stmtSQLpayment != null) stmtSQLpayment.close();
            if (connection != null) connection.close();
        }
    %>
    <br><a href="pharmacistMenu.jsp">Return to Pharmacist Menu</a>
</body>
</html>
