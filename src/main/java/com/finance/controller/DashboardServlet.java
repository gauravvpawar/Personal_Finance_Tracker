package com.finance.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.finance.DAO.DashboardDAO;
import com.finance.model.Transaction;
import com.finance.model.User;
import com.finance.service.DashboardService;

/**
 * Servlet implementation class DashboardServlet
 */@WebServlet("/dashboard")
 public class DashboardServlet extends HttpServlet {

	    private DashboardService dashboardService;

	    @Override
	    public void init() {
	        dashboardService = new DashboardService();
	    }

	    @Override
	    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	    {

	        HttpSession session = request.getSession(false);

	        if (session == null ||
	            session.getAttribute("user") == null) {

	            response.sendRedirect(
	                request.getContextPath() + "/index.jsp"
	            );

	            return;
	        }

	        User user = (User) session.getAttribute("user");

	        int uid = user.getUid();

	        double monthlyIncome =
	                dashboardService.getMonthlyIncome(uid);

	        double monthlyExpenses =
	                dashboardService.getMonthlyExpenses(uid);

	        double balanceRemaining =
	                dashboardService.getBalance(uid);

	        List<Transaction> transactions =
	                dashboardService.getTransactions(uid);

	        request.setAttribute(
	                "monthlyIncome",
	                monthlyIncome
	        );

	        request.setAttribute(
	                "monthlyExpenses",
	                monthlyExpenses
	        );

	        request.setAttribute(
	                "balanceRemaining",
	                balanceRemaining
	        );

	        request.setAttribute(
	                "transactions",
	                transactions
	        );

	        request.getRequestDispatcher(
	                "/Pages/User/UserDashBoard.jsp"
	        ).forward(request, response);
	    }
	}