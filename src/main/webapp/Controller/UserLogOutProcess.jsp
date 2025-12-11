<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

HttpSession hs =  request.getSession();
hs.invalidate();

out.println("<script>");
out.println("alert('User logout sucessfully')");
out.println("window.location.href = '../index.jsp'");
out.println("</script>");
%>