<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*" %>

<%

String email , password;
email = request.getParameter("email");
password = request.getParameter("password");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personal_finance_tracker" ,"root", "gaurav@123");

PreparedStatement ps =  con.prepareStatement("select * from users where email = '"+email+"' and password = '"+password+"' ");
 
ResultSet rs = ps.executeQuery();


if(rs.next())
{
int id = rs.getInt(1);

	out.println("<script>");
	out.println("alert('Login Successfull')");
	out.println("window.location.href = '../Pages/User/UserDashBoard.jsp?id="+ id +  "' ; ");
	out.println("</script>");
}else{
	out.println("<script>");
	out.println("alert('Login failure')");
	out.println("window.location.href = '../index.html' ");
	out.println("</script>");
}

%>