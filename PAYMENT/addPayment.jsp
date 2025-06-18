<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment Form Registration</title>
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
        <h1>Payment Registration</h1>
        <form name="addPayment" action="addNewPaymentProcess.jsp" method="post" 
            <table>
                <tr>
                    <td>Payment ID:</td>
                    <td><input type="text" name="payment_IdPayment" size="50"></td>
                </tr>
                <tr>
                    <td>Payment ID Treatment:</td>
                    <td><input type="text" name="payment_IdTreatment" size="50"></td>
                </tr>
       
                       <td>Payment Date:</td>
                    <td><input type="date" name="payment_Date" size="50"></td>
                </tr>
                 <tr>
                    <td>Payment Time:</td>
                    <td><input type="time" name="payment_Time" size="50"></td>
                </tr>
                <tr>
                   <td>Payment Status:</td>
                    <td><input type="text" name="payment_Status" size="20"></td>
               </tr>
                <tr>
                   <td>Payment Total Payment:</td>
                <td><input type="text" name="payment_TotalPayment"  required></td>
            
                    <td colspan="2">
                        <input type="submit" name="submitRegistrationPayment" value="Submit">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <a href="pharmacistMenu.jsp">Return To Pharmacist Menu</a>
    </div>
</body>
</html>
