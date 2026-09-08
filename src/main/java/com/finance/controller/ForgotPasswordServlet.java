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

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {

        String email = request.getParameter("email");

        User user = userService.getUserByEmail(email);

        if (user != null) {

            HttpSession session = request.getSession();

            session.setAttribute(
                "forgotPasswordUser",
                user
            );

            response.sendRedirect(
                request.getContextPath()
                + "/Pages/UserUpdatePassword.jsp"
            );

        } else {

            request.setAttribute(
                "error",
                "Email is not registered."
            );

            request.getRequestDispatcher(
                "/Pages/UserForgotPasswordForm.jsp"
            ).forward(request, response);
        }
    }
}