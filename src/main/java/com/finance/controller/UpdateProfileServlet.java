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

@WebServlet("/update-profile")
public class UpdateProfileServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/index.jsp"
            );
            return;
        }

        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            response.sendRedirect(
                request.getContextPath() + "/index.jsp"
            );
            return;
        }

        String name = request.getParameter("name");

        String password =request.getParameter("password");

        String cnfPassword = request.getParameter("cnfPassword");

        String dob =request.getParameter("dob");

        String gender =request.getParameter("gender");


        if (!password.equals(cnfPassword)) {

            request.setAttribute(
                "error",
                "Passwords do not match."
            );

            request.setAttribute(
                "user",
                loggedInUser
            );

            request.getRequestDispatcher(
                "/Pages/User/UserUpdateProfileForm.jsp"
            ).forward(request, response);

            return;
        }


        boolean updated =
                userService.updateProfile(
                    loggedInUser.getUid(),
                    name,
                    password,
                    cnfPassword,
                    dob,
                    gender
                );


        if (updated) {

            User updatedUser = userService.getUserById(loggedInUser.getUid());

            session.setAttribute("user", updatedUser);

            session.setAttribute(
                "profileMessage",
                "Profile updated successfully!"
            );

            response.sendRedirect(
                request.getContextPath() + "/dashboard"
            );

            return;
        } else {

            request.setAttribute(
                "error",
                "Failed to update profile."
            );

            request.setAttribute(
                "user",
                loggedInUser
            );

            request.getRequestDispatcher(
                "/Pages/User/UserUpdateProfileForm.jsp"
            ).forward(request, response);
        }
    }
}