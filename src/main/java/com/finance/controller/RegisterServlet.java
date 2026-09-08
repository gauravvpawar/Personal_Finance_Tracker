package com.finance.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finance.model.User;
import com.finance.service.UserService;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        String name = request.getParameter("name");

        String email = request.getParameter("email");

        String password =request.getParameter("password");

        String cnfPassword = request.getParameter("cnfPassword");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setCnfPassword(cnfPassword);

        boolean registered = userService.registerUser(user);

        if (registered) {

            response.sendRedirect(
                request.getContextPath()
                + "/Pages/UserLoginForm.jsp"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/Pages/UserRegistrationForm.jsp?error=true"
            );
        }
    }
}