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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/index.jsp"
            );
            return;
        }

        User loggedInUser =(User) session.getAttribute("user");

        if (loggedInUser == null) {
            response.sendRedirect(
                request.getContextPath() + "/index.jsp"
            );
            return;
        }

        User user =userService.getUserById(loggedInUser.getUid());

        request.setAttribute("user", user);

        request.getRequestDispatcher(
            "/Pages/UserUpdateProfileForm.jsp"
        ).forward(request, response);
    }
}