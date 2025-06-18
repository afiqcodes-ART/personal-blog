<%@include file="connectionDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patient Update Profile</title>
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
        <h1>Search Patient</h1>
        <form action="updatePatient.jsp" method="get">
            <label for="patientIC">Patient IC:</label>
            <input type="text" id="patientIC" name="patient_IC" required>
            <input type="submit" value="Search">
        </form>
    </div>

    <%
        String patient_IC = request.getParameter("patient_IC");

        if (patient_IC != null && !patient_IC.trim().isEmpty()) {
            try {
                Statement statement = connection.createStatement();
                String querySelectPatient = "SELECT * FROM Patient WHERE patient_IC = '" + patient_IC + "'";
                ResultSet rsPatient = statement.executeQuery(querySelectPatient);

                if (rsPatient.next()) {
                    String patient_Name = rsPatient.getString("patient_Name");
                    String patient_Gender = rsPatient.getString("patient_Gender");
                    String patient_PhoneNumber = rsPatient.getString("patient_PhoneNumber");
                    String patient_DateOfBirth = rsPatient.getString("patient_DateOfBirth");
                    String patient_RegistrationDate = rsPatient.getString("patient_RegistrationDate");
                    String patient_RegistrationTime = rsPatient.getString("patient_RegistrationTime");
                    String patient_Address = rsPatient.getString("patient_Address");
                    String patient_Allergy = rsPatient.getString("patient_Allergy");
    %>
                    <div class="container">
                        <h2>Update Patient Profile</h2>
                        <form name="updatePatient" action="updatePatientProcess.jsp" method="post">
                            <label for="patientIC">Patient IC:</label>
                            <input type="text" id="patientIC" name="patient_IC" value="<%= patient_IC %>" readonly>

                            <label for="patientName">Patient Name:</label>
                            <input type="text" id="patientName" name="patient_Name" value="<%= patient_Name %>">

                            <label for="patientGender">Patient Gender:</label>
                            <input type="text" id="patientGender" name="patient_Gender" value="<%= patient_Gender %>">

                            <label for="patientDateOfBirth">Patient Date of Birth:</label>
                            <input type="date" id="patientDateOfBirth" name="patient_DateOfBirth" value="<%= patient_DateOfBirth %>">

                            <label for="patientRegistrationDate">Patient Registration Date:</label>
                            <input type="date" id="patientRegistrationDate" name="patient_RegistrationDate" value="<%= patient_RegistrationDate %>">

                            <label for="patientRegistrationTime">Patient Registration Time:</label>
                            <input type="time" id="patientRegistrationTime" name="patient_RegistrationTime" value="<%= patient_RegistrationTime %>">

                            <label for="patientPhoneNumber">Patient Phone Number:</label>
                            <input type="tel" id="patientPhoneNumber" name="patient_PhoneNumber" value="<%= patient_PhoneNumber %>">

                            <label for="patientAddress">Patient Address:</label>
                            <input type="text" id="patientAddress" name="patient_Address" value="<%= patient_Address %>">

                            <label for="patientAllergy">Patient Allergy:</label>
                            <textarea id="patientAllergy" name="patient_Allergy"><%= patient_Allergy %></textarea>

                            <input type="submit" name="updatePatient" value="Update">
                        </form>
                    </div>
    <%
                } else {
                    out.println("<div class='container'><h2>No patient found with the given IC.</h2></div>");
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
    <a href="clerkMenu.jsp">Back to Clerk Menu</a>
</body>
</html>
