package com.finance.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.finance.model.User;
import com.finance.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	 private UserService userService;
	 
	 @Override
	    public void init() {
	        userService = new UserService();
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String email = request.getParameter("email");

	        String password = request.getParameter("password");

	        User user = userService.loginUser(email, password);

	        if (user != null) {

	            HttpSession session = request.getSession();

	            session.setAttribute("user", user);
	            
	            session.setAttribute("profileMessage", "Welcome back '" + user.getName() + "'!");
	            
	            response.sendRedirect(
	                request.getContextPath() + "/dashboard"
	            );

	        } else {

	            response.sendRedirect(
	                request.getContextPath()
	                + "/Pages/User/UserLoginForm.jsp?error=invalid"
	            );
	        }
	}

}
