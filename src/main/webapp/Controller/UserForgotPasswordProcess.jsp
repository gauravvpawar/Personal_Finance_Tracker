<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String email , password , cnfPassword;

email = request.getParameter("email");
password = request.getParameter("password");
cnfPassword = request.getParameter("cnfPassword");


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personal_finance_tracker" ,"root", "gaurav@123");


PreparedStatement ps =	con.prepareStatement("select * from users where email = '"+email+"' ");
ResultSet rs =  ps.executeQuery();

if(rs.next())
{
	ps = con.prepareStatement("update users set password = '"+password+"' , cnfPassword = '"+cnfPassword+"' where email = '"+email+"' ");
	
	if(ps.executeUpdate() > 0){
		out.println("<script>");
		out.println("alert('Password updated Successfully ✔️')");
		out.println("window.location.href = '../index.jsp' ");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('Failure occur while updating data ✔️')");
		out.println("window.location.href = '../index.jsp' ");
		out.println("</script>");
	}
}else{
	out.println("<script>");
	out.println("alert('Email does not exist')");
	out.println("window.location.href = '../index.jsp' ");
	out.println("</script>");
}


%>

</body>
</html>