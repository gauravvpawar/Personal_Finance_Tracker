
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.finance.model.User"%>

<%
    User user = (User) session.getAttribute("forgotPasswordUser");

    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/Pages/UserForgotPasswordForm.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Update Password</title>

<style>

/* MAIN LAYOUT */
body {
    font-family: Poppins, Arial, sans-serif;
    background: #f0f2f5;
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* FORM CARD */
.auth-form {
    background: #ffffff;
    padding: 30px 35px;
    border-radius: 12px;
    width: 420px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    animation: fadeIn 0.5s ease;
}

/* HEADINGS */
.auth-form h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #333;
    font-size: 26px;
    font-weight: 700;
}

/* FORM ELEMENTS */
.form-group {
    margin-bottom: 18px;
    display: flex;
    flex-direction: column;
}

label {
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 6px;
    color: #555;
}

input[type="email"],
input[type="password"] {
    width: 90%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 15px;
    transition: 0.3s;
}

input:focus {
    border-color: #4e73df;
    box-shadow: 0 0 4px rgba(78, 115, 223, 0.4);
    outline: none;
}

/* SUBMIT BUTTON */
.btn-submit {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    background: #4e73df;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s;
    margin-top: 10px;
    font-weight: 600;
}

.btn-submit:hover {
    background: #3b5cc4;
}

/* ANIMATION */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

</style>

</head>

<body>

<form action="<%= request.getContextPath() %>/update-password"
      method="post"
      class="auth-form">

    <h2>Update Password</h2>

    <div class="form-group">

        <label>Registered Email</label>

        <input type="email"
               value="<%= user.getEmail() %>"
               readonly>

    </div>

    <div class="form-group">

        <label>New Password</label>

        <input type="password"
               name="password"
               required>

    </div>

    <div class="form-group">

        <label>Confirm Password</label>

        <input type="password"
               name="cnfPassword"
               required>

    </div>

    <button type="submit"
            class="btn-submit">
        Update Password
    </button>

</form>

</body>

</html>

