<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patient Form Registration</title>
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
            let patient_RegistrationDate = document.forms["addNewPatient"]["patient_RegistrationDate"].value;
            let patient_RegistrationTime = document.forms["addNewPatient"]["patient_RegistrationTime"].value;
            let patient_IC = document.forms["addNewPatient"]["patient_IC"].value;
            let patient_Name = document.forms["addNewPatient"]["patient_Name"].value;
            let patient_Gender = document.forms["addNewPatient"]["patient_Gender"].value;
            let patient_PhoneNumber = document.forms["addNewPatient"]["patient_PhoneNumber"].value;
            let patient_DateOfBirth = document.forms["addNewPatient"]["patient_DateOfBirth"].value;
            let patient_Address = document.forms["addNewPatient"]["patient_Address"].value;
            let patient_Allergy = document.forms["addNewPatient"]["patient_Allergy"].value;

            if (patient_RegistrationDate === "") {
                alert("Login must be filled out!");
                document.forms["addNewPatient"]["patient_RegistrationDate"].select();
                document.forms["addNewPatient"]["patient_RegistrationDate"].focus();
                return false;
            }

            if (patient_RegistrationTime === "") {
                alert("Password must be filled out!");
                document.forms["addNewPatient"]["patient_RegistrationTime"].select();
                document.forms["addNewPatient"]["patient_RegistrationTime"].focus();
                return false;
            }

            if (patient_IC === "") {
                alert("Employee IC must be filled out!");
                document.forms["addNewPatient"]["patient_IC"].select();
                document.forms["addNewPatient"]["patient_IC"].focus();
                return false;
            }

            if (patient_Name === "") {
                alert("Patient name must be filled out!");
                document.forms["addNewPatient"]["patient_Name"].select();
                document.forms["addNewPatient"]["patient_Name"].focus();
                return false;
            }

            if (patient_Name.length <= 2) {
                alert("Patient name must be more than 2 characters!");
                document.forms["addNewPatient"]["patient_Name"].select();
                document.forms["addNewPatient"]["patient_Name"].focus();
                return false;
            }

            if (patient_Gender === "") {
                alert("Patient gender must be selected!");
                document.forms["addNewPatient"]["employee_Gender"].select();
                document.forms["addNewPatient"]["patient_Gender"].focus();
                return false;
            }

            if ((isNaN(patient_PhoneNumber))) {
                alert("Input not valid for Patient telephone, please put a number!");
                document.forms["addNewPatient"]["patient_PhoneNumber"].select();
                document.forms["addNewPatient"]["patient_PhoneNumber"].focus();
                return false;
            }

            if (patient_PhoneNumber.length < 10) {
                alert("Length of telephone number is not enough,\n\
                        telephone number should be more than 10 numbers\n\ \n\
                        which is " + employee_PhoneNumber.length + " number/s only");
                document.forms["addNewPatient"]["patient_PhoneNumber"].select();
                document.forms["addNewPatient"]["patient_PhoneNumber"].focus();
                return false;
            }

            if (patient_DateOfBirth === "") {
                alert("Patient date of birth must be filled out!");
                document.forms["addNewPatient"]["patient_DateOfBirth"].select();
                document.forms["addNewPatient"]["patient_DateOfBirth"].focus();
                return false;
            }

            if (patient_Address === "") {
                alert("Patient address must be filled out!");
                document.forms["addNewPatient"]["patient_Address"].select();
                document.forms["addNewPatient"]["patient_Address"].focus();
                return false;
            }
             if (patient_Allergy === "") {
                alert("Patient address must be filled out!");
                document.forms["addNewPatient"]["patient_Address"].select();
                document.forms["addNewPatient"]["patient_Address"].focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Patient Registration</h1>
        <form name="addNewPatient" action="addNewPatientProcess.jsp" method="post" onsubmit="return validate()">
            <table>
                <tr>
                    <td>Patient IC:</td>
                    <td><input type="text" name="patient_IC" size="50"></td>
                </tr>
                <tr>
                    <td>Patient Name:</td>
                    <td><input type="text" name="patient_Name" size="50"></td>
                </tr>
                <tr>
                    <td>Patient Gender:</td>
                    <td>
                        <select name="patient_Gender">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Patient Telephone Number:</td>
                    <td><input type="tel" name="patient_PhoneNumber" size="50"></td>
                </tr>
                <tr>
                    <td>Patient Date Of Birth:</td>
                    <td><input type="date" name="patient_DateOfBirth" size="50"></td>
                </tr>
                 <tr>
                    <td>Patient Registration Date:</td>
                    <td><input type="date" name="patient_RegistrationDate" size="50"></td>
                </tr>
                <tr>
                   <td>Patient Registration Time:</td>
                    <td><input type="time" name="patient_RegistrationTime" size="20"></td>
               </tr>
                <tr>
                    <td>Patient Address:</td>
                    <td><textarea name="patient_Address" rows="4" cols="50"></textarea></td>
                </tr>
                <tr>
                    <td>Patient Allergy:</td>
                    <td><input type="tel" name="patient_Allergy" size="50"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="submitRegistrationPatient" value="Register">
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
