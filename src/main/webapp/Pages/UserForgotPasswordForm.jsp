<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<style>
body {
	font-family: 'Poppins', sans-serif;
	background: #eef1f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background: #ffffff;
	padding: 35px 40px;
	width: 380px;
	border-radius: 12px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
	animation: fadeIn 0.4s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #222;
	font-size: 22px;
	font-weight: 600;
}

.form-group {
	margin-bottom: 18px;
}

label {
	display: block;
	margin-bottom: 6px;
	font-weight: 600;
	color: #555;
	font-size: 14px;
}

input {
	width: 100%;
	padding: 12px;
	border: 1px solid #cccccc;
	border-radius: 6px;
	box-sizing: border-box;
	font-size: 15px;
	transition: 0.2s;
}

input:focus {
	border-color: #007bff;
	box-shadow: 0 0 6px rgba(0, 123, 255, 0.25);
	outline: none;
}

.btn-submit {
	width: 100%;
	padding: 12px;
	background: #007bff;
	border: none;
	color: white;
	border-radius: 6px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	margin-top: 10px;
	transition: background 0.2s;
}

.btn-submit:hover {
	background: #0056b3;
}

.note {
	margin-top: 10px;
	text-align: center;
	font-size: 13px;
	color: #777;
}
</style>

</head>
<body>

	<div class="container">
		<h2>Reset Your Password</h2>

		<form action="<%= request.getContextPath() %>/forgot-password"
      method="post">
		
		    <div class="form-group">
		
		        <label for="email">
		            Registered Email
		        </label>
		
		        <input type="email"
		               id="email"
		               name="email"
		               required
		               placeholder="example@gmail.com">
		
		    </div>
		
		    <button type="submit"
		            class="btn-submit">
		        Continue
		    </button>
		
		</form>
	</div>

</body>
</html>
