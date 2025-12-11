<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<style>

body {
    margin: 0;
    padding: 0;
    height: 100vh;
    background: #f3f4f6;
    display: flex;
    justify-content: center;   /* Centers horizontally */
    align-items: center;       /* Centers vertically */
    font-family: Arial, sans-serif;
}

.auth-form {
    background: #ffffff;
    padding: 30px 35px;
    border-radius: 10px;
    width: 380px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
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
    font-size: 15px;
}

input:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0,123,255,0.3);
    outline: none;
}

.btn-submit {
    width: 100%;
    padding: 12px;
    background: #28a745;
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
    margin-top: 10px;
}

.btn-submit:hover {
    background: #1e7e34;
}

.auth-links {
    text-align: center;
    margin-top: 15px;
}

.auth-links a {
    color: #007bff;
    text-decoration: none;
    font-size: 14px;
}

.auth-links a:hover {
    text-decoration: underline;
}

</style>

</head>
<body>

<form action="<%= request.getContextPath() %>/Controller/UserRegistrationProcess.jsp" method="POST" class="auth-form">

    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>
    </div>

    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
    </div>

    <div class="form-group">
        <label for="password">Password</label>
        <input type="text" id="password" name="password" required>
    </div>

    <div class="form-group">
        <label for="cnfPassword">Confirm Password</label>
        <input type="text" id="cnfPassword" name="cnfPassword" required>
    </div>

    <button type="submit" class="btn-submit">Register</button>

    <div class="auth-links">
        <a href="./UserLoginForm.jsp">Already have an account? Login</a>
    </div>

</form>

</body>
</html>
