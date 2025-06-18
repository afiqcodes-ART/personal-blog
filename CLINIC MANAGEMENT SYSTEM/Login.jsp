<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
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
            width: 300px;
        }
        h1 {
            margin-bottom: 20px;
        }
        h2 {
            margin-top: 0;
        }
        table {
            margin: auto;
            border-collapse: separate;
            border-spacing: 10px;
        }
        td {
            text-align: center;
        }
        form {
            text-align: center;
        }
        input[type="text"], input[type="password"] {
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
        .footer {
            text-align: center;
            font-size: 0.8em;
            color: #555;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Clinic Information System</h2>
        <h1>Login</h1>
        <br>
        <form name="Login" action="loginDisplayMenu.jsp" method="post">
            <table>
                <tr>
                    <td>Login ID:</td>
                    <td>
                        <input type="text" name="username" size="20"
                               value="<% if (session.getAttribute("username") != null) {
                                            out.print(session.getAttribute("username"));
                                        } %>">
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="login_password" size="20"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="SubmitLogin" value="Login">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <a href="index.html">Back To Main Page</a>
    </div>
    <div class="footer">
        &copy; Afiq Fauzan 2024. All rights reserved.
    </div>
</body>
</html>
