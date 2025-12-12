<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
</head>

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

/* WRAPPER FOR BACK BUTTON + FORM */
.container {
    width: 420px;
    position: relative;
}

/* BACK BUTTON */
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

/* FORM CARD */
.auth-form {
    background: #ffffff;
    padding: 30px 35px;
    border-radius: 12px;
    width: 100%;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
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
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

/* GENDER */
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

<body>

<%

int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personal_finance_tracker" ,"root", "gaurav@123");

PreparedStatement ps = con.prepareStatement("select * from users where uid = '"+id+"' ");
ResultSet rs =  ps.executeQuery();


if(!rs.next())
{
	out.println("<script>");
	out.println("alert('Something went wrong')");
	out.println("<script>");
}

%>

<div class="container">

    <!-- BACK BUTTON -->
    <button type="button" class="btn-back" onclick="Back()">← Back</button>

    <form action="<%= request.getContextPath() %>/Controller/UserUpdateDataProcess.jsp"
          method="POST"
          class="auth-form">

        <h2>Update Profile</h2>

        <input type="hidden" name="id" value="<%= rs.getInt(1) %>">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" value="<%= rs.getString(2) %>" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" readonly value="<%= rs.getString(3) %>" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="text" name="password" value="<%= rs.getString(4) %>" required>
        </div>

        <div class="form-group">
            <label>Confirm Password</label>
            <input type="text" name="cnfPassword" value="<%= rs.getString(5) %>" required>
        </div>

        <div class="dob">
            <label>Date of Birth</label>
            <input type="date" name="dob" value="<%= rs.getString(6) != null ? rs.getString(7) : "" %>">
        </div>

        <label>Gender</label>
        <div class="gender-options">
            <label><input type="radio" name="gender" value="Male"   <%= "Male".equals(rs.getString(8)) ? "checked" : "" %>> Male</label>
            <label><input type="radio" name="gender" value="Female" <%= "Female".equals(rs.getString(8)) ? "checked" : "" %>> Female</label>
            <label><input type="radio" name="gender" value="Other"  <%= "Other".equals(rs.getString(8)) ? "checked" : "" %>> Other</label>
        </div>

        <button type="submit" class="btn-submit">Update Data</button>
    </form>

</div>

<script>
function Back() {
    history.back();
}
</script>



</body>
</html>