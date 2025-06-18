<%@ page import="java.sql.*" %>
<%@include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Patient Process</title>
</head>
<body>
<%
    String patient_IC = request.getParameter("patient_IC");
    String patient_Name = request.getParameter("patient_Name");
    String patient_Gender = request.getParameter("patient_Gender");
    String patient_PhoneNumber = request.getParameter("patient_PhoneNumber");
    String patient_DateOfBirth = request.getParameter("patient_DateOfBirth");
    String patient_RegistrationDate = request.getParameter("patient_RegistrationDate");
    String patient_RegistrationTime = request.getParameter("patient_RegistrationTime");
    String patient_Address = request.getParameter("patient_Address");
    String patient_Allergy = request.getParameter("patient_Allergy");

    try {
        String updateSQL = "UPDATE Patient SET patient_Name=?, patient_Gender=?, patient_PhoneNumber=?, patient_DateOfBirth=?, patient_RegistrationDate=?, patient_RegistrationTime=?, patient_Address=?, patient_Allergy=? WHERE patient_IC=?";
        PreparedStatement psUpdate = connection.prepareStatement(updateSQL);
        psUpdate.setString(1, patient_Name);
        psUpdate.setString(2, patient_Gender);
        psUpdate.setString(3, patient_PhoneNumber);
        psUpdate.setString(4, patient_DateOfBirth);
        psUpdate.setString(5, patient_RegistrationDate);
        psUpdate.setString(6, patient_RegistrationTime);
        psUpdate.setString(7, patient_Address);
        psUpdate.setString(8, patient_Allergy);
        psUpdate.setString(9, patient_IC);
        
        int i = psUpdate.executeUpdate();

        if (i > 0) {
            out.println("<script>alert('Patient details updated successfully');location='clerkMenu.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to update patient details');location='updatePatientProfile.jsp';</script>");
        }
    } catch (SQLException e) {
        out.println("<script>alert('Database connection error: " + e.getMessage() + "');location='updatePatientProfile.jsp';</script>");
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
</body>
</html>
