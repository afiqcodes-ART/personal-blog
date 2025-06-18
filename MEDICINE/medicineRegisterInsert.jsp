<html>
    <head>
        <title>Insert stmtSQLmedicine data into MySQL</title>
    </head>
    
    <body>
        <h1>Display Output</h1>
        <%--include file connectionDB.jsp to connect to MySQL--%>
        <%@include file="connectionDB.jsp" %>
        <%
           
            Statement stmtSQLmedicine = null;
            try{
             
                stmtSQLmedicine = connection.createStatement();
                
                //declaration variable
                String medication_Code;
                String medication_Name;
                String medication_Category;
                String medication_Quantity;
                
                medication_Code = request.getParameter("medication_Code");
                medication_Name = request.getParameter("medication_Name");
                medication_Category = request.getParameter("medication_Category");
                medication_Quantity = request.getParameter("medication_Quantity");
                
                String sqlInsertMedicine ="INSERT INTO Medication "
                    + "(medication_Code, medication_Name, medication_Category, "
                    + "medication_Quantity) "
                    + "VALUES "
                    + "('" + medication_Code + "', '" + medication_Name
                    + "', '" + medication_Category + "', '" + medication_Quantity + "')";
                    
                int rowMedicine = stmtSQLmedicine.executeUpdate(sqlInsertMedicine);
                
                if (rowMedicine>0){
                    out.println("<br>Medicine successfully inserted into "
                    + "table Medicine");
                    //to display in web browser
                    out.println("<br>Medication Code: " + medication_Code);
                    out.println("<br>Medication Name: " + medication_Name);
                    out.println("<br>Medication Category: " + medication_Category);
                    out.println("<br>Medication Quantity: " + medication_Quantity);
                    
                }
                else
                    out.println("<br>Medicine Register "
                    + "fail inserted into table Medication");
            }
            catch (SQLException sqlError){
                request.setAttribute("Error:", sqlError);
                out.println(sqlError);
            }
            finally{
                    
                if (stmtSQLmedicine !=null)
                    stmtSQLmedicine.close();
                    
                if (connection !=null)
                    connection.close();
            }
        %>
        <br><a href="pharmacistMenu.jsp">Return to Menu</a>
    </body>
</html>