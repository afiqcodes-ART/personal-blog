<html>
    <head>
        <title>Insert supplier data into MySQL</title>
    </head>
    
    <body>
        <h1>Display Output</h1>
        <%--include file connectionDB.jsp to connect to MySQL--%>
        <%@include file="connectionDB.jsp" %>
        <%
           
            Statement stmtSQLsupplier = null;
            try{
             
                stmtSQLsupplier = connection.createStatement();
                
                //declaration variable
                String patient_IC;
                String patient_Name;
                String patient_Gender;
                String patient_PhoneNumber;
                String patient_DateOfBirth;
                String patient_RegistrationDate;
                String patient_RegistrationTime;
                String patient_Address;
                String patient_Allergy;
                
                //request parameter (form element name) from supplierRegisterForm
                //and assign to the declared varaible
                //use request for communication between client and server
                patient_IC = request.getParameter("patient_IC");
                patient_Name = request.getParameter("patient_Name");
                patient_Gender = request.getParameter("patient_Gender");
                patient_PhoneNumber = request.getParameter("patient_PhoneNumber");
                patient_DateOfBirth = request.getParameter("patient_DateOfBirth");
                patient_RegistrationDate = request.getParameter("patient_RegistrationDate");
                patient_RegistrationTime = request.getParameter("patient_RegistrationTime");
                patient_Address = request.getParameter("patient_Address");
                patient_Allergy = request.getParameter("patient_Allergy");
                
              
                    
                String sqlInsertSupplier ="INSERT INTO Patient "
                    + "(patient_IC, patient_Name, patient_Gender, "
                    + "patient_PhoneNumber, patient_DateOfBirth,"
                    + "patient_RegistrationDate,patient_RegistrationTime, patient_Address, "
                    + "patient_Allergy) "
                    + "VALUES "
                    + "('" + patient_IC + "', '" + patient_Name
                    + "', '" + patient_Gender + "', '" + patient_PhoneNumber
                    + "', '" + patient_DateOfBirth + "', '" + patient_RegistrationDate
                    +"','" +patient_RegistrationTime + "','" + patient_Address+"','"+ patient_Allergy + "')";
                    
                int rowSupplier = stmtSQLsupplier.executeUpdate(sqlInsertSupplier);
                
                if (rowSupplier>0){
                    out.println("<br>Patient successfully inserted into "
                    + "table Patient");
                    //to display in web browser
                    out.println("<br>Patient IC: " + patient_IC);
                    out.println("<br>Patient Name: " + patient_Name);
                    out.println("<br>Patient Gender: " + patient_Gender);
                    out.println("<br>Patient Telephone Number: " 
                                + patient_PhoneNumber);
                    out.println("<br>Patient Date Of Birth: " + patient_DateOfBirth);
                    out.println("<br>Patient Date Of Registration: " + patient_RegistrationDate);
                    out.println("<br>Patient Time Of Registration: " + patient_RegistrationTime);
                    out.println("<br>patient Address " + patient_Address);
                    out.println("<br>patient Allergy " + patient_Allergy);
                    
                }
                else
                    out.println("<br>Patient Register "
                    + "fail inserted into table Patient");
            }
            catch (SQLException sqlError){
                request.setAttribute("Error:", sqlError);
                out.println(sqlError);
            }
            finally{
                    
                if (stmtSQLsupplier !=null)
                    stmtSQLsupplier.close();
                    
                if (connection !=null)
                    connection.close();
            }
        %>
        <br><a href="clerkMenu.jsp">Return to Clerk Menu</a>
    </body>
</html>