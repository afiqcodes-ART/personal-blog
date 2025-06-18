<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Display Menu</title>
    </head>
    <body>
        <%@include file= "connectionDB.jsp" %>
        <%
            if (request.getParameter("SubmitLogin") != null){
                String username = request.getParameter("username").trim();
                session.setAttribute("username", username);
            }

            String username = request.getParameter("username").trim();
            String password = request.getParameter("login_password").trim();

            try {
                Statement statementSQL = connection.createStatement();

                String querySelectLogin = "SELECT login_loginID, login_password, login_type FROM Login WHERE login_loginID = '" + username + "' AND login_password = '" + password + "'";

                ResultSet rowLogin = statementSQL.executeQuery(querySelectLogin);

                if (rowLogin.next()) {
                    String login_loginID = rowLogin.getString("login_loginID");
                    String login_password = rowLogin.getString("login_password");
                    String login_type = rowLogin.getString("login_type");

                    if (login_type.equals("c")) {
                        String querySelectEmployee = "SELECT employee_IC, employee_Name FROM Login, Employee WHERE login_loginID = employee_loginID AND employee_loginID = '" + username + "'";
                        ResultSet rowEmployee = statementSQL.executeQuery(querySelectEmployee);

                        if (rowEmployee.next()) {
                            String employee_IC = rowEmployee.getString("employee_IC");
                            String employee_Name = rowEmployee.getString("employee_Name");
                            session.setAttribute("employee_IC", employee_IC);
                            session.setAttribute("employee_Name", employee_Name);
                            response.sendRedirect("clerkMenu.jsp");
                        }
                    } else if (login_type.equals("d")) {
                        String querySelectEmployee = "SELECT employee_IC, employee_Name FROM Login, Employee WHERE login_loginID = employee_loginID AND employee_loginID = '" + username + "'";
                        ResultSet rowEmployee = statementSQL.executeQuery(querySelectEmployee);

                        if (rowEmployee.next()) {
                            String employee_IC = rowEmployee.getString("employee_IC");
                            String employee_Name = rowEmployee.getString("employee_Name");
                            session.setAttribute("employee_IC", employee_IC);
                            session.setAttribute("employee_Name", employee_Name);
                            response.sendRedirect("doctorMenu.jsp");
                        }
                    } else if (login_type.equals("p")) {
                        String querySelectEmployee = "SELECT employee_IC, employee_Name FROM Login, Employee WHERE login_loginID = employee_loginID AND employee_loginID = '" + username + "'";
                        ResultSet rowEmployee = statementSQL.executeQuery(querySelectEmployee);

                        if (rowEmployee.next()) {
                            String employee_IC = rowEmployee.getString("employee_IC");
                            String employee_Name = rowEmployee.getString("employee_Name");
                            session.setAttribute("employee_IC", employee_IC);
                            session.setAttribute("employee_Name", employee_Name);
                            response.sendRedirect("pharmacistMenu.jsp");
                        }
                    } else {
                        out.println("Invalid login type.");
                    }
                } else {
                    out.println("Wrong username or password.");
                }
            } catch (SQLException sqlExp) {
                request.setAttribute("Error", sqlExp);
                out.println("SQL Exception: " + sqlExp);
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        out.println("SQL Exception on close: " + e);
                    }
                }
            }
        %>
    </body>
</html>
