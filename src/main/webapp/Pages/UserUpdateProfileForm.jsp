
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.finance.model.User"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>User Profile</title>

<style>

body {
    font-family: Poppins, Arial, sans-serif;
    background: #f0f2f5;
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.profile-container {
    width: 420px;
    position: relative;
}

.btn-back {
    padding: 8px 18px;
    font-size: 14px;
    background: #6c757d;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.2s;
    font-weight: 600;
    margin-bottom: 12px;
}

.btn-back:hover {
    background: #5a6268;
}

.auth-form {
    background: #ffffff;
    padding: 30px 35px;
    border-radius: 12px;
    width: 420px;
    box-sizing: border-box;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    animation: fadeIn 0.5s ease;
}

.auth-form h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #333;
    font-size: 26px;
    font-weight: 700;
}

.form-group, .dob {
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

input[type="text"],
input[type="email"],
input[type="date"] {
    width: 300px;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 15px;
    transition: 0.3s;
    box-sizing: border-box;
}

input:focus {
    border-color: #4e73df;
    box-shadow: 0 0 4px rgba(78, 115, 223, 0.4);
    outline: none;
}

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

.gender-options {
    display: flex;
    gap: 18px;
    margin-top: 5px;
}

.gender-options label {
    font-size: 14px;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 5px;
    cursor: pointer;
}

.gender-options input {
    accent-color: #4e73df;
    width: 16px;
    height: 16px;
    cursor: pointer;
}

</style>

</head>

<body>

<%
    User user = (User) request.getAttribute("user");

    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/index.jsp"
        );
        return;
    }
%>

<div class="profile-container">

    <button type="button"
            class="btn-back"
            onclick="history.back()">
        ← Back
    </button>

    <form action="<%= request.getContextPath() %>/update-profile"
          method="POST"
          class="auth-form">

        <h2>Update Profile</h2>

        <div class="form-group">
            <label>Name</label>
            <input type="text"
                   name="name"
                   value="<%= user.getName() %>"
                   required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email"
                   value="<%= user.getEmail() %>"
                   readonly>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="text"
                   name="password"
                   value="<%= user.getPassword() %>"
                   required>
        </div>

        <div class="form-group">
            <label>Confirm Password</label>
            <input type="text"
                   name="cnfPassword"
                   value="<%= user.getCnfPassword() %>"
                   required>
        </div>

        <div class="dob">
            <label>Date of Birth</label>
            <input type="date"
                   name="dob"
                   value="<%= user.getDob() != null ? user.getDob() : "" %>">
        </div>

        <label>Gender</label>

        <div class="gender-options">

            <label>
                <input type="radio"
                       name="gender"
                       value="Male"
                       <%= "Male".equals(user.getGender()) ? "checked" : "" %>>
                Male
            </label>

            <label>
                <input type="radio"
                       name="gender"
                       value="Female"
                       <%= "Female".equals(user.getGender()) ? "checked" : "" %>>
                Female
            </label>

            <label>
                <input type="radio"
                       name="gender"
                       value="Other"
                       <%= "Other".equals(user.getGender()) ? "checked" : "" %>>
                Other
            </label>

        </div>

        <button type="submit"
                class="btn-submit">
            Update Data
        </button>

    </form>

</div>

</body>

</html>

