<%@include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Medicine</title>
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
        <h1>Search Medicine Code</h1>
        <form action="updateMedicine.jsp" method="get">
            <label for="medicationCode">Medicine Code:</label>
            <input type="text" id="medicationCode" name="medication_Code" required>
            <input type="submit" value="Search">
        </form>
    </div>

    <%
        String medication_Code = request.getParameter("medication_Code");

        if (medication_Code != null && !medication_Code.trim().isEmpty()) {
            try {
                Statement statement = connection.createStatement();
                String querySelectMedication = "SELECT * FROM Medication WHERE medication_Code = '" + medication_Code + "'";
                ResultSet rsMedication = statement.executeQuery(querySelectMedication);

                if (rsMedication.next()) {
                    String medicationCode = rsMedication.getString("medication_Code");
                    String medication_Name = rsMedication.getString("medication_Name");
                    String medication_Category = rsMedication.getString("medication_Category");
                    String medication_Quantity = rsMedication.getString("medication_Quantity");
                    
    %>
                    <div class="container">
                        <h2>Update Medication</h2>
                        <form name="updateMedicine" action="updateMedicineProcess.jsp" method="post">
                            <label for="medicationCode">Medication Code:</label>
                            <input type="text" id="medicationCode" name="medication_Code" value="<%= medicationCode %>" readonly>

                            <label for="medicationName">Medication Name:</label>
                            <input type="text" id="medicationName" name="medication_Name" value="<%= medication_Name %>">

                            <label for="medicationCategory">Medication Category:</label>
                            <input type="text" id="medicationCategory" name="medication_Category" value="<%= medication_Category %>">

                            <label for="medicationQuantity">Medication_Quantity:</label>
                            <input type="date" id="medicationQuantity" name="medication_Quantity" value="<%= medication_Quantity %>">

           

                            <input type="submit" name="updateMedicine" value="Update">
                        </form>
                    </div>
    <%
                } else {
                    out.println("<div class='container'><h2>No Medicine found with the given Code.</h2></div>");
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
        }
    %>
    <a href="pharmacistMenu.jsp">Back to Pharmacist Menu</a>
</body>
</html>
