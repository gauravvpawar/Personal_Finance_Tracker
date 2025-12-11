<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>


<style>
    body {
        font-family: Arial, sans-serif;
        background: #f3f4f6;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .login-container {
        background: #ffffff;
        padding: 30px 35px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        width: 350px;
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    .form-group {
        margin-bottom: 18px;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-weight: bold;
        color: #444;
    }

    input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 15px;
    }

    input:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 5px rgba(0,123,255,0.3);
    }

    .btn-submit {
        width: 100%;
        padding: 12px;
        background: #007bff;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: bold;
        margin-top: 10px;
    }

    .btn-submit:hover {
        background: #0056b3;
    }
</style>

</head>
<body>

<div class="login-container">
    <h2>Login</h2>

    <form action="<%= request.getContextPath() %>/Controller/UserLoginProcess.jsp" method="post">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        
        <div class="form-group">
            <label for="password">Password</label>
            <input type="text" id="password" name="password" required>
        </div>

        <button type="submit" class="btn-submit">Login</button>
    </form>
    
    <a href="./UserForgotPasswordForm.jsp">Forgot Password</a>
</div>

</body>
</html>