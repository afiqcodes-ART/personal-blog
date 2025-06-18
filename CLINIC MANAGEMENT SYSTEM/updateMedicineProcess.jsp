<%@include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Medication Process</title>
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
        input[type="text"], input[type="password"], input[type="tel"], select, textarea, input[type="date"], input[type="time"] {
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
    <div class="container">
        <h1>Update Medication Process</h1>
        <%
            String medication_Code = request.getParameter("medication_Code");
            String medication_Name = request.getParameter("medication_Name");
            String medication_Category = request.getParameter("medication_Category");
            String medication_Quantity = request.getParameter("medication_Quantity");

            if (medication_Code != null && medication_Name != null && medication_Category != null && medication_Quantity != null) {
                try {
                    String queryUpdateMedication = "UPDATE Medication SET medication_Name = ?, medication_Category = ?, medication_Quantity = ? WHERE medication_Code = ?";
                    PreparedStatement pstmt = connection.prepareStatement(queryUpdateMedication);
                    pstmt.setString(1, medication_Name);
                    pstmt.setString(2, medication_Category);
                    pstmt.setString(3, medication_Quantity);
                    pstmt.setString(4, medication_Code);

                    int rowsUpdated = pstmt.executeUpdate();

                    if (rowsUpdated > 0) {
                        out.println("<div class='container'><h2>Medication details updated successfully.</h2></div>");
                    } else {
                        out.println("<div class='container'><h2>Failed to update medication details. Please try again.</h2></div>");
                    }
                } catch (SQLException sqlExp) {
                    request.setAttribute("error", sqlExp);
                    out.println("<div class='container'><h2>Error: " + sqlExp.getMessage() + "</h2></div>");
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
                out.println("<div class='container'><h2>All fields are required. Please fill in all details.</h2></div>");
            }
        %>
        <a href="pharmacistMenu.jsp">Back to Pharmacist Menu</a>
    </div>
</body>
</html>
