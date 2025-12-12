<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Data</title>
</head>
<body>

<%

String name , email , password , cnfPassword , dob, gender;
int id = Integer.parseInt(request.getParameter("id"));
name = request.getParameter("name");
email = request.getParameter("email");
password = request.getParameter("password");
cnfPassword = request.getParameter("cnfPassword");
dob = request.getParameter("dob");
gender = request.getParameter("gender");



Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personal_finance_tracker" ,"root", "gaurav@123");

PreparedStatement ps;

if(dob.isEmpty() && !gender.isEmpty())
{
 ps =  con.prepareStatement("Update users set name = '"+name+"' , password = '"+password+"' , cnfPassword = '"+cnfPassword+"' , gender = '"+gender+"' where email = '"+email+"' ");

if(ps.executeUpdate() > 0) 
{
	out.println("<script>");
	out.println("alert('Data Updated Successfully')");
	out.println("window.location.href = '../Pages/User/UserDashBoard.jsp?id="+ id+ " '; ");
	out.println("</script>");
}else
{
	out.println("<script>");
	out.println("alert('Failes to Updated data')");
	out.println("window.location.href = '../Pages/User/UserDashBoard.jsp?id="+ id+ " '; ");
	out.println("</script>");
}

}else if(!dob.isEmpty() && gender.isEmpty()){
	
	ps =  con.prepareStatement("Update users set name = '"+name+"' , password = '"+password+"' , cnfPassword = '"+cnfPassword+"' , dob = '"+dob+"' where email = '"+email+"' ");

	
if(ps.executeUpdate() > 0) 
{
	out.println("<script>");
	out.println("alert('Data Updated Successfully')");
	out.println("window.location.href = '../Pages/User/UserDashBoard.jsp?id="+ id+ " '; ");
	out.println("</script>");
}else
{
	out.println("<script>");
	out.println("alert('Failes to Updated data')");
	out.println("window.location.href = '../Pages/User/UserDashBoard.jsp?id="+ id+ " '; ");
	out.println("</script>");
}

}else{
	out.println("<script>");
	out.println("alert('Nothing Updated ')");
	out.println("window.location.href = '../Pages/User/UserDashBoard.jsp?id="+ id+ " '; ");
	out.println("</script>");
	
}
 


%>

</body>
</html>