<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Search and List Medications</title> 
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
            a {
                display: inline-block;
                margin-top: 20px;
                text-decoration: none;
                color: #007BFF;
            }
            a:hover {
                text-decoration: underline;
            }
            input[type="text"], input[type="submit"] {
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
    </head> 
    <body> 
        <div class="container">
            <h1>Search Medication by Category</h1>
            <form method="get">
                <input type="text" name="medication_Category" placeholder="Enter Medication Category" required>
                <input type="submit" value="Search">
            </form>

            <%@include file="connectionDB.jsp" %> 
            <%  
            String medication_Category = request.getParameter("medication_Category");

            if (medication_Category != null && !medication_Category.trim().isEmpty()) {
                try { 
                    //declaration to create MySQL statement 
                    Statement statementSQL = connection.createStatement(); 
                    
                    String querySelectMedication = "SELECT * FROM Medication WHERE medication_Category = '" + medication_Category + "'"; 
                        
                    ResultSet rowMedication = statementSQL.executeQuery(querySelectMedication); 
                    
                    if (!rowMedication.isBeforeFirst()) { 
                        out.println("<br>No medications found in the category: " + medication_Category); 
                    } else {  
                        out.println("<h1>List of Medications in Category: " + medication_Category + "</h1>"); 
                        out.println("<table>"); 
                        out.println("<tr>" 
                                        + "<th>Medication Code</th>"
                                        + "<th>Medication Name</th>"
                                        + "<th>Medication Category</th>"
                                        + "<th>Medication Quantity</th>"
                                + "</tr> "); 
                        
                        //how to display 
                        while(rowMedication.next()) { 
                            String medication_Code = rowMedication.getString("medication_Code");
                            String medication_Name = rowMedication.getString("medication_Name");
                            String medication_CategoryDB = rowMedication.getString("medication_Category");
                            String medication_Quantity = rowMedication.getString("medication_Quantity");
                             
                            out.println("<tr><td>" + medication_Code + "</td>" 
                                    + "<td>" + medication_Name + "</td>" 
                                    + "<td><center>" + medication_CategoryDB + "</center></td>" 
                                    + "<td><center>" + medication_Quantity + "</center></td>"
                                    + "</tr>"); 
                        } // end while 
                        out.println("</table>"); 
                    } //end else 
                } catch(SQLException sqlExp) { 
                    request.setAttribute("error", sqlExp); 
                    out.println(sqlExp); 
                } finally { 
                    if (connection != null) 
                        connection.close(); 
                } 
            }
            %> 
            <br><a href="pharmacistMenu.jsp">Back to Menu</a> 
        </div>
    </body> 
</html>
