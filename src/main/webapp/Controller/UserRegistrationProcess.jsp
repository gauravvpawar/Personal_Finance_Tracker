<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%

String name ,email ,  password , cnfPassword;

name = request.getParameter("name");
email = request.getParameter("email");
password = request.getParameter("password");
cnfPassword = request.getParameter("cnfPassword");


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personal_finance_tracker" ,"root", "gaurav@123");

PreparedStatement ps = con.prepareStatement("insert into users(name , email , password , cnfPassword) values('"+name+"' , '"+email+"' , '"+password+"' , '"+cnfPassword+"') ");

ps.execute();

out.println("<script>");
out.println("alert('Registration successfull')");
out.println("window.location.href =  '../index.html'");
out.println("</script>");

%>