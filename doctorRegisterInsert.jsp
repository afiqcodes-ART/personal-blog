<html>
    <head>
        <title>Insert supplier data into MySQL</title>
    </head>
    
    <body>
        <h1>Display Output</h1>
        <%--include file connectionDB.jsp to connect to MySQL--%>
        <%@include file="connectionDB.jsp" %>
        <%
            Statement stmtSQLlogin = null;
            Statement stmtSQLsupplier = null;
            try{
                stmtSQLlogin = connection.createStatement();
                stmtSQLsupplier = connection.createStatement();
                
                //declaration variable
                String login;
                String password;
                String employee_IC;
                String employee_Name;
                String employee_Gender;
                String employee_PhoneNumber;
                String employee_DateOfBirth;
                String employee_Address;
                
                //request parameter (form element name) from supplierRegisterForm
                //and assign to the declared varaible
                //use request for communication between client and server
                login = request.getParameter("login");
                password = request.getParameter("password");
                employee_IC = request.getParameter("employee_IC");
                employee_Name = request.getParameter("employee_Name");
                employee_Gender = request.getParameter("employee_Gender");
                employee_PhoneNumber = request.getParameter("employee_PhoneNumber");
                employee_DateOfBirth = request.getParameter("employee_DateOfBirth");
                employee_Address = request.getParameter("employee_Address");
                
                String sqlInsertLogin ="INSERT INTO Login "
                    + "(login_loginID, login_password, login_type) "
                    + "VALUES "
                    + "('"+ login + "', '" + password + "', 'd')";
                    
                int rowLogin = stmtSQLlogin.executeUpdate(sqlInsertLogin);
                
                if (rowLogin>0){
                    out.println("<br>Login successfully inserted into table login");
                    //to display in web browser
                    out.println("<b>Login: " + login + "</b>");
                    out.println("<br>Password: " + password);
                }
                else
                    out.println("<br>Login fail inserted into table login");
                    
                String sqlInsertSupplier ="INSERT INTO Employee "
                    + "(employee_IC, employee_Name, employee_Gender, "
                    + "employee_PhoneNumber, employee_DateOfBirth, employee_Address, "
                    + "employee_Position, employee_loginID) "
                    + "VALUES "
                    + "('" + employee_IC + "', '" + employee_Name
                    + "', '" + employee_Gender + "', '" + employee_PhoneNumber
                    + "', '" + employee_DateOfBirth + "', '" + employee_Address
                    + "', '" + 'c'
                    + "', '" + login + "')";
                    
                int rowSupplier = stmtSQLsupplier.executeUpdate(sqlInsertSupplier);
                
                if (rowSupplier>0){
                    out.println("<br>Login successfully inserted into "
                    + "table Employee");
                    //to display in web browser
                    out.println("<br>Employee IC: " + employee_IC);
                    out.println("<br>Employee Name: " + employee_Name);
                    out.println("<br>Employee Gender: " + employee_Gender);
                    out.println("<br>Employee Telephone Number: " 
                                + employee_PhoneNumber);
                    out.println("<br>Employee Date Of Birth: " + employee_DateOfBirth);
                    out.println("<br>Employee Address " + employee_Address);
                    out.println("<br>Employee Position: " + 'd');
                    out.println("<br>Login: " + login);
                }
                else
                    out.println("<br>Clerk Register "
                    + "fail inserted into table employee");
            }
            catch (SQLException sqlError){
                request.setAttribute("Error:", sqlError);
                out.println(sqlError);
            }
            finally{
                if (stmtSQLlogin !=null)
                    stmtSQLlogin.close();
                    
                if (stmtSQLsupplier !=null)
                    stmtSQLsupplier.close();
                    
                if (connection !=null)
                    connection.close();
            }
        %>
        <br><a href="index.html">Return to main page</a>
    </body>
</html>