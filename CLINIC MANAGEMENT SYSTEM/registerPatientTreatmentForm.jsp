<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patient Treatment Form Registration</title>
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
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
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
        input[type="text"], input[type="password"], input[type="tel"], select, textarea {
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
    <script>
        function validate() {
            //declare login
            let treatment_IdTreatment = document.forms["registerPatientTreatmentForm"]["treatment_IdTreatment"].value;
            let treatment_PatientIC = document.forms["registerPatientTreatmentForm"]["treatment_PatientIC"].value;
            let treatment_Date = document.forms["registerPatientTreatmentForm"]["treatment_Date"].value;
            let treatment_Time = document.forms["registerPatientTreatmentForm"]["treatment_Time"].value;
            let treatment_Illness = document.forms["registerPatientTreatmentForm"]["treatment_Illness"].value;
            let treatment_EmployeeIC = document.forms["registerPatientTreatmentForm"]["treatment_EmployeeIC"].value;
            

            if (treatment_IdTreatment === "") {
                alert("Login must be filled out!");
                document.forms["registerPatientTreatmentForm"]["treatment_IdTreatment"].select();
                document.forms["registerPatientTreatmentForm"]["treatment_IdTreatment"].focus();
                return false;
            }

            if (treatment_PatientIC === "") {
                alert("Password must be filled out!");
                document.forms["registerPatientTreatmentForm"]["treatment_PatientIC"].select();
                document.forms["registerPatientTreatmentForm"]["treatment_PatientIC"].focus();
                return false;
            }

            if (treatment_Date === "") {
                alert("Employee IC must be filled out!");
                document.forms["registerPatientTreatmentForm"]["treatment_Date"].select();
                document.forms["registerPatientTreatmentForm"]["treatment_Date"].focus();
                return false;
            }

            if (treatment_Time === "") {
                alert("Patient name must be filled out!");
                document.forms["registerPatientTreatmentForm"]["treatment_Time"].select();
                document.forms["registerPatientTreatmentForm"]["treatment_Time"].focus();
                return false;
            }

            if (treatment_Illness.length <= 2) {
                alert("Patient name must be more than 2 characters!");
                document.forms["registerPatientTreatmentForm"]["treatment_Illness"].select();
                document.forms["registerPatientTreatmentForm"]["treatment_Illness"].focus();
                return false;
            }

            if (treatment_EmployeeIC === "") {
                alert("Patient gender must be selected!");
                document.forms["registerPatientTreatmentForm"]["treatment_EmployeeIC"].select();
                document.forms["registerPatientTreatmentForm"]["treatment_EmployeeIC"].focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Patient Treatment Registration</h1>
        <form name="registerPatientTreament" action="registerPatientTreatmentProcess.jsp" method="post" onsubmit="return validate()">
            <table>
                <tr>
                    <td>ID Treament:</td>
                    <td><input type="text" name="treatment_IdTreatment" size="50"></td>
                </tr>
                <tr>
                    <td>Patient IC:</td>
                    <td><input type="text" name="treatment_PatientIC" size="50"></td>
                </tr>
         
   
                <tr>
                    <td>Treatment Date:</td>
                    <td><input type="date" name="treatment_Date" size="50"></td>
                </tr>
                <tr>
                   <td>Treatment Time:</td>
                    <td><input type="time" name="treatment_Time" size="20"></td>
               </tr>
                <tr>
                    <td>Treatment Illness:</td>
                    <td><input type=" text" name="treatment_Illness" size="20"></td>
                </tr>
                <tr>
                    <td>Treatment Employee IC:</td>
                    <td><input type="text" name="treatment_EmployeeIC" size="50"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="submitRegisterPatientTreatment" value="Register">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <a href="clerkMenu.jsp">Return To Clerk Menu</a>
    </div>
</body>
</html>
