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
</head>
<body>
    <div class="container">
        <h1>Medicine Registration</h1>
        <form name="medicineRegisterForm" action="medicineRegisterInsert.jsp" method="post" >
            <table>
                <tr>
                    <td>Medication Code:</td>
                    <td><input type="text" name="medication_Code" size="20"></td>
                </tr> 
                <tr>
                    <td>Medication Name:</td>
                    <td><input type="text" name="medication_Name" size="20"></td>
                </tr>
                <tr>
                    <td>Medication Category:</td>
                    <td><input type="text" name="medication_Category" size="50"></td>
                </tr>
                <tr>
                    <td>Medication Quantity:</td>
                    <td><input type="text" name="medication_Quantity" size="50"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="submitRegistrationMedicine" value="Register">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <a href="pharmacistMenu.jsp">Return to Pharmacist Menu</a>
    </div>
</body>
</html>
