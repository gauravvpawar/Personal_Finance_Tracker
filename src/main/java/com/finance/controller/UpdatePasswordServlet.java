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

@WebServlet("/update-password")
public class UpdatePasswordServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/Pages/User/ForgotPassword.jsp"
            );

            return;
        }

        User user =(User) session.getAttribute(
                "forgotPasswordUser"
            );

        if (user == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/Pages/User/ForgotPassword.jsp"
            );

            return;
        }


        String password = request.getParameter("password");

        String cnfPassword = request.getParameter("cnfPassword");


        if (!password.equals(cnfPassword)) {

            request.setAttribute(
                "error",
                "Passwords do not match."
            );

            request.getRequestDispatcher(
                "/Pages/User/UpdatePassword.jsp"
            ).forward(request, response);

            return;
        }


        boolean updated =
            userService.updatePassword(
                user.getEmail(),
                password
            );


        if (updated) {

            session.removeAttribute(
                "forgotPasswordUser"
            );

            request.setAttribute(
                "message",
                "Password updated successfully."
            );

            request.getRequestDispatcher(
                "/Pages/UserLoginForm.jsp"
            ).forward(request, response);

        } else {

            request.setAttribute(
                "error",
                "Password update failed."
            );

            request.getRequestDispatcher(
                "/Pages/UserLoginForm.jsp"
            ).forward(request, response);
        }
    }
}