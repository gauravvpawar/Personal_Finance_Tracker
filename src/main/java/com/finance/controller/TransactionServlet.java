package com.finance.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.finance.model.Transaction;
import com.finance.model.User;
import com.finance.service.TransactionService;

@WebServlet("/transaction")
public class TransactionServlet extends HttpServlet {

    private TransactionService transactionService;

    @Override
    public void init() {
        transactionService = new TransactionService();
    }

    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                request.getContextPath() + "/index.jsp"
            );

            return;
        }

        User user = (User) session.getAttribute("user");

        String type = request.getParameter("type");
        String amountString = request.getParameter("amount");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String dateString = request.getParameter("date");

        try {

            double amount = Double.parseDouble(amountString);

            Date transactionDate =
                    Date.valueOf(dateString);

            Transaction transaction =
                    new Transaction();

            transaction.setUserId(user.getUid());
            transaction.setType(type);
            transaction.setAmount(amount);
            transaction.setDescription(description);
            transaction.setCategory(category);
            transaction.setTransactionDate(transactionDate);

            boolean success =transactionService.addTransaction(transaction);

            if (success) {

                session.setAttribute(
                    "transactionMessage",
                    "Transaction added successfully!"
                );

            } else {

                session.setAttribute(
                    "transactionMessage",
                    "Failed to add transaction."
                );
            }

            response.sendRedirect(
                request.getContextPath() + "/dashboard"
            );

        } catch (Exception e) {

            e.printStackTrace();

            session.setAttribute(
                "transactionMessage",
                "Invalid transaction data."
            );

            response.sendRedirect(
                request.getContextPath() + "/dashboard"
            );
        }
    }
}