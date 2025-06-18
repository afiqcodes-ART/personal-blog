<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>List of Treatment And Payment</title> 
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
                width: 80%;
                max-width: 1000px;
            }
            h1 {
                margin-bottom: 20px;
            }
            table {
                margin: auto;
                border-collapse: collapse;
                width: 100%;
                margin-bottom: 30px;
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
        </style>
    </head> 
    <body> 
        <div class="container">
            <%
            String employee_Name = (String) session.getAttribute("employee_Name");
            if (employee_Name != null){
                out.println("<h1>Pharmacist Name: " + employee_Name + "</h1>");
            }
            %>
            <%@include file="connectionDB.jsp" %> 
            <%  
            try { 
                // Declarations to create MySQL statements 
                Statement statementSQL1 = connection.createStatement(); 
                Statement statementSQL2 = connection.createStatement(); 
                Statement statementSQL3 = connection.createStatement(); 
                Statement statementSQL4 = connection.createStatement(); 
                  
                String querySelectCountTreatment = "SELECT COUNT(*) AS countTreatment FROM Treatment"; 
                String querySelectCountPayment = "SELECT COUNT(*) AS countPayment FROM Payment"; 
                     
                ResultSet rsTreatmentCount = statementSQL1.executeQuery(querySelectCountTreatment); 
                rsTreatmentCount.next(); 
                int countTreatment =  rsTreatmentCount.getInt("countTreatment"); 
                
                ResultSet rsPaymentCount = statementSQL2.executeQuery(querySelectCountPayment); 
                rsPaymentCount.next(); 
                int countPayment =  rsPaymentCount.getInt("countPayment"); 
                     
                if (countTreatment == 0) { 
                    out.println("<br>Sorry, no registered Treatment yet! No record in Treatment Table"); 
                }  
                
                if (countPayment == 0) { 
                    out.println("<br>Sorry, no registered Payment yet! No record in Payment Table"); 
                }  
                
                if (countTreatment > 0) {  
                    String querySelectTreatment = "SELECT * FROM Treatment"; 
                    ResultSet rowTreatment = statementSQL3.executeQuery(querySelectTreatment); 
     
                    out.println("<h1>List of Treatment</h1>"); 
                    out.println("<table border=\"1\" align=\"center\" style=\"border-collapse:collapse;\">"); 
                    out.println("<tr>" 
                                    + "<th>Treatment ID</th>"
                                    + "<th>Patient IC</th>"
                                    + "<th>Date</th>"
                                    + "<th>Time</th>"
                                    + "<th>Illness</th>"
                                    + "<th>Employee IC</th>"
                            + "</tr> "); 
                            
                    // How to display 
                    while(rowTreatment.next()) { 
                        String treatment_IdTreatment = rowTreatment.getString("treatment_IdTreatment");
                        String treatment_PatientIC = rowTreatment.getString("treatment_PatientIC");
                        String treatment_Date = rowTreatment.getString("treatment_Date");
                        String treatment_Time = rowTreatment.getString("treatment_Time");
                        String treatment_Illness = rowTreatment.getString("treatment_Illness");
                        String treatment_EmployeeIC = rowTreatment.getString("treatment_EmployeeIC");
                         
                        out.println("<tr><td>"+treatment_IdTreatment + "</td>" 
                                + "<td>" + treatment_PatientIC +"</td>" 
                                + "<td><center>"+ treatment_Date+"</center></td>" 
                                + "<td><center>"+ treatment_Time+"</center></td>"
                                + "<td><center>"+ treatment_Illness+"</center></td>"
                                + "<td><center>"+ treatment_EmployeeIC+"</center></td>"
                                + "</tr>"); 
                    } // End while 
                    out.println("</table>"); 
                } // End if countTreatment 
                
                if (countPayment > 0) {  
                    String querySelectPayment = "SELECT * FROM Payment"; 
                    ResultSet rowPayment = statementSQL4.executeQuery(querySelectPayment); 
     
                    out.println("<h1>List of Payment</h1>"); 
                    out.println("<table border=\"1\" align=\"center\" style=\"border-collapse:collapse;\">"); 
                    out.println("<tr>" 
                                    + "<th>Payment ID</th>"
                                    + "<th>Treatment ID</th>"
                                    + "<th>Date</th>"
                                    + "<th>Time</th>"
                                    + "<th>Status</th>"
                                    + "<th>Total Payment</th>"
                            + "</tr> "); 
                     
                    // How to display 
                    while(rowPayment.next()) { 
                        String payment_IdPayment = rowPayment.getString("payment_IdPayment");
                        String payment_IdTreatment = rowPayment.getString("payment_IdTreatment");
                        String payment_Date = rowPayment.getString("payment_Date");
                        String payment_Time = rowPayment.getString("payment_Time");
                        String payment_Status = rowPayment.getString("payment_Status");
                        String payment_TotalPayment = rowPayment.getString("payment_TotalPayment");
                         
                        out.println("<tr><td>"+payment_IdPayment + "</td>" 
                                + "<td>" + payment_IdTreatment +"</td>" 
                                + "<td><center>"+ payment_Date+"</center></td>" 
                                + "<td><center>"+ payment_Time+"</center></td>"
                                + "<td><center>"+ payment_Status+"</center></td>"
                                + "<td><center>"+ payment_TotalPayment+"</center></td>"
                                + "</tr>"); 
                    } // End while 
                    out.println("</table>"); 
                } // End if countPayment 
            } // End try 
            catch(SQLException sqlExp) { 
                request.setAttribute("error", sqlExp); 
                out.println(sqlExp); 
            } 
            finally { 
                if (connection != null) 
                    connection.close(); 
            } 
            %> 
            <br><a href="pharmacistMenu.jsp">Back to Menu</a> 
        </div>
    </body> 
</html>
