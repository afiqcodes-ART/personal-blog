<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Clerk Profile</title>
</head>
<body>
<%
    try {
        PreparedStatement psUpdateEmployee = null;

        String employee_loginID = request.getParameter("employee_loginID");
        String employee_IC = request.getParameter("employee_IC");
        String employeeName = request.getParameter("employee_Name");
        String employee_Gender = request.getParameter("employee_Gender");
        String employee_PhoneNumber = request.getParameter("employee_PhoneNumber");
        String employee_DateOfBirth = request.getParameter("employee_DateOfBirth");
        String employee_Address = request.getParameter("employee_Address");
        String employee_Position = request.getParameter("employee_Position");

        String updateEmployeeSQL = "UPDATE Employee SET employee_IC = ?, " +
                "employee_Name = ?, employee_Gender = ?, " +
                "employee_PhoneNumber = ?, employee_DateOfBirth = ?, " +
                "employee_Address = ?, employee_Position = ? " +
                "WHERE employee_loginID = ?";

        psUpdateEmployee = connection.prepareStatement(updateEmployeeSQL);
        psUpdateEmployee.setString(1, employee_IC);
        psUpdateEmployee.setString(2, employeeName);
        psUpdateEmployee.setString(3, employee_Gender);
        psUpdateEmployee.setString(4, employee_PhoneNumber);
        psUpdateEmployee.setString(5, employee_DateOfBirth);
        psUpdateEmployee.setString(6, employee_Address);
        psUpdateEmployee.setString(7, employee_Position);
        psUpdateEmployee.setString(8, employee_loginID);

        int i = psUpdateEmployee.executeUpdate();

        if (i >= 1) {
            out.println("<script>alert('Profile Updated!'); " +
                    "window.location.href='clerkProfileUpdate.jsp';</script>");
        } else {
            out.println("<script>alert('Profile cannot be updated'); " +
                    "window.location.href='clerkProfileUpdate.jsp';</script>");
        }
    } catch(SQLException sqlExp) {
        request.setAttribute("error", sqlExp);
        out.println(sqlExp);
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
<br>
</body>
</html>