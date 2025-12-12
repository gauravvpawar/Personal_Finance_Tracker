<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

  <%
  
  String type , description ,category ,  date;
  int id , amount;

type = request.getParameter("type");
id = Integer.parseInt(request.getParameter("id"));
amount = Integer.parseInt(request.getParameter("amount"));
description = request.getParameter("description");
category = request.getParameter("category");

date = request.getParameter("date");


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personal_finance_tracker" ,"root", "gaurav@123");

PreparedStatement ps = con.prepareStatement("insert into transactions(uid ,type ,  amount , description , category , date) values('"+id+"'  , '"+type+"', '"+amount+"' , '"+description+"' , '"+category+"' , '"+date+"') ");

if(ps.executeUpdate() > 0)
{
	out.println("<script>");
	out.println("alert('Transaction added')");
	out.println("window.location.href = '../Pages/User/UserDashBoard.jsp?id=" + id+ " ' ");
	out.println("</script>");
}else{
	out.println("<script>");
	out.println("alert('Failed to add Transaction')");
	out.println("window.location.href = '../Pages/User/UserDashBoard?id=" + id+ " ' ");
	out.println("</script>");
}
  
  %>