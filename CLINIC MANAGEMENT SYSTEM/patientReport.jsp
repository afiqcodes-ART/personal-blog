<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of Supplier</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h1>List of Patient</h1>
        <%@include file="connectionDB.jsp" %> 
        <%  
        try{ 
            //declaration to create MySQL statement 
            Statement statementSQL = connection.createStatement(); 
              
            String querySelectCountSupplier = "SELECT COUNT(*) AS countPatient FROM Patient"; 
                 
            ResultSet rsSupplier = statementSQL.executeQuery(querySelectCountSupplier); 
            rsSupplier.next(); 
            int countSupplier = rsSupplier.getInt("countPatient"); 
                 
            if (countSupplier == 0) { 
                out.println("<br>Sorry, no registered Patient yet! No record in Patient Table"); 
            }  
            else  
            {  
                //statement/query MySQL select  
                //untuk dapat data supplier dari table supplier 
                String querySelectSupplier="Select * from Patient"; 
 
                //Declare ResultSet bagi setiap row dalam table kursus 
                ResultSet rowSupplier = statementSQL.executeQuery(querySelectSupplier); 
                out.println("<table border=\"1\" align=\"center\" style=\"border-collapse:collapse;\">"); 
                out.println("<tr>" 
                                + "<th>Patient IC</th>"
                                + "<th>Patient Name</th>"
                                + "<th>Patient Gender</th>"
                                + "<th>Patient Phone Number</th>"
                                + "<th>Patient Date Of Birth</th>"
                                + "<th>Patient Registration Date</th>"
                                + "<th>Patient Registration Time</th>"
                                + "<th>Patient Address</th>"
                                + "<th>Patient Allergy</th>"
                        + "</tr> "); 
                 
                //how to display 
                while(rowSupplier.next()) 
                { 
                    //declare attribut dalam table supplier yang  
                    //kita nak dipaparkan website  
                    String patient_IC = rowSupplier.getString("patient_IC");
                    String patient_Name = rowSupplier.getString("patient_Name");
                    String patient_Gender = rowSupplier.getString("patient_Gender");
                    String patient_PhoneNumber = rowSupplier.getString("patient_PhoneNumber");
                    String patient_DateOfBirth = rowSupplier.getString("patient_DateOfBirth");
                    String patient_RegistrationDate = rowSupplier.getString("patient_RegistrationDate");
                    String patient_RegistrationTime = rowSupplier.getString("patient_RegistrationTime");
                    String patient_Address = rowSupplier.getString("patient_Address");
                    String patient_Allergy = rowSupplier.getString("patient_Allergy");
                     
                    //papar rekod supplier di dalam table  
                    out.println("<tr><td>"+patient_IC + "</td>" 
                            + "<td>" + patient_Name +"</td>" 
                            + "<td><center>"+ patient_Gender+"</center></td>" 
                            + "<td><center>"+ patient_PhoneNumber+"</center></td>" 
                            + "<td><center>"+ patient_DateOfBirth+"</center></td>"
                            + "<td><center>"+ patient_RegistrationDate+"</center></td>"
                            + "<td><center>"+ patient_RegistrationTime+"</center></td>"
                            + "<td><center>"+ patient_Address+"</center></td>"
                            + "<td><center>"+ patient_Allergy+"</center></td>"
                            + "</tr>"); 
                }// end while 
                out.println("</table>"); 
            }//end else 
        }// end try 
        catch(SQLException sqlExp) 
        { 
            request.setAttribute("error", sqlExp); 
            out.println(sqlExp); 
        } 
        finally{ 
            if (connection != null) 
                connection.close(); 
        } 
        %> 
        <br><a href="clerkMenu.jsp">Back to Menu</a> 
    </div>
</body> 
</html>
