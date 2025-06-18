<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Clerk Form Registration</title>
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
            let login = document.forms["doctorRegisterForm"]["login_loginID"].value;
            let password = document.forms["doctorRegisterForm"]["login_password"].value;
            let employee_IC = document.forms["doctorRegisterForm"]["employee_IC"].value;
            let employee_Name = document.forms["doctorRegisterForm"]["employee_Name"].value;
            let employee_Gender = document.forms["doctorRegisterForm"]["employee_Gender"].value;
            let employee_PhoneNumber = document.forms["doctorRegisterForm"]["employee_PhoneNumber"].value;
            let employee_DateOfBirth = document.forms["doctorRegisterForm"]["employee_DateOfBirth"].value;
            let employee_Address = document.forms["doctorRegisterForm"]["employee_Address"].value;

            if (login === "") {
                alert("Login must be filled out!");
                document.forms["doctorRegisterForm"]["login_loginID"].select();
                document.forms["doctorRegisterForm"]["login_loginID"].focus();
                return false;
            }

            if (password === "") {
                alert("Password must be filled out!");
                document.forms["doctorRegisterForm"]["login_password"].select();
                document.forms["doctorRegisterForm"]["login_password"].focus();
                return false;
            }

            if (employee_IC === "") {
                alert("Employee IC must be filled out!");
                document.forms["doctorRegisterForm"]["employee_IC"].select();
                document.forms["doctorRegisterForm"]["employee_IC"].focus();
                return false;
            }

            if (employee_Name === "") {
                alert("Employee name must be filled out!");
                document.forms["doctorRegisterForm"]["employee_Name"].select();
                document.forms["doctorRegisterForm"]["employee_Name"].focus();
                return false;
            }

            if (employee_Name.length <= 2) {
                alert("Employee name must be more than 2 characters!");
                document.forms["doctorRegisterForm"]["employee_Name"].select();
                document.forms["doctorRegisterForm"]["employee_Name"].focus();
                return false;
            }

            if (employee_Gender === "") {
                alert("Employee gender must be selected!");
                document.forms["doctorRegisterForm"]["employee_Gender"].select();
                document.forms["doctorRegisterForm"]["employee_Gender"].focus();
                return false;
            }

            if ((isNaN(employee_PhoneNumber))) {
                alert("Input not valid for employee telephone, please put a number!");
                document.forms["doctorRegisterForm"]["employee_PhoneNumber"].select();
                document.forms["doctorRegisterForm"]["employee_PhoneNumber"].focus();
                return false;
            }

            if (employee_PhoneNumber.length < 10) {
                alert("Length of telephone number is not enough,\n\
                        telephone number should be more than 10 numbers\n\ \n\
                        which is " + employee_PhoneNumber.length + " number/s only");
                document.forms["doctorRegisterForm"]["employee_PhoneNumber"].select();
                document.forms["doctorRegisterForm"]["employee_PhoneNumber"].focus();
                return false;
            }

            if (employee_DateOfBirth === "") {
                alert("Employee date of birth must be filled out!");
                document.forms["doctorRegisterForm"]["employee_DateOfBirth"].select();
                document.forms["doctorRegisterForm"]["employee_DateOfBirth"].focus();
                return false;
            }

            if (employee_Address === "") {
                alert("Employee address must be filled out!");
                document.forms["doctorRegisterForm"]["employee_Address"].select();
                document.forms["doctorRegisterForm"]["employee_Address"].focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Doctor Registration</h1>
        <form name="clerkRegisterForm" action="doctorRegisterInsert.jsp" method="post" onsubmit="return validate()">
            <table>
                <tr>
                    <td>Login ID:</td>
                    <td><input type="text" name="login" size="20"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" size="20"></td>
                </tr>
                <tr>
                    <td>Employee IC:</td>
                    <td><input type="text" name="employee_IC" size="50"></td>
                </tr>
                <tr>
                    <td>Employee Name:</td>
                    <td><input type="text" name="employee_Name" size="50"></td>
                </tr>
                <tr>
                    <td>Employee Gender:</td>
                    <td>
                        <select name="employee_Gender">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Employee Telephone Number:</td>
                    <td><input type="tel" name="employee_PhoneNumber" size="50"></td>
                </tr>
                <tr>
                    <td>Employee Date Of Birth:</td>
                    <td><input type="date" name="employee_DateOfBirth" size="50"></td>
                </tr>
                <tr>
                    <td>Employee Address:</td>
                    <td><textarea name="employee_Address" rows="4" cols="50"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="submitRegistrationDoctor" value="Register">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <a href="index.html">Return to main page</a>
    </div>
</body>
</html>