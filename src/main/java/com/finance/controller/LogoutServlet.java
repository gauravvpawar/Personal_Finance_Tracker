package com.finance.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    public void doGet( HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        request.setAttribute("message", "Logout successfully!");

        request.getRequestDispatcher("/index.jsp")
               .forward(request, response);
    }
}