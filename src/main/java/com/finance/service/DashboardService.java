package com.finance.service;

import java.util.List;

import com.finance.DAO.DashboardDAO;
import com.finance.model.Transaction;

public class DashboardService {

    private DashboardDAO dashboardDAO;

    public DashboardService() {
        dashboardDAO = new DashboardDAO();
    }

    public double getMonthlyIncome(int uid) {
        return dashboardDAO.getMonthlyIncome(uid);
    }

    public double getMonthlyExpenses(int uid) {
        return dashboardDAO.getMonthlyExpenses(uid);
    }

    public double getBalance(int uid) {
        return dashboardDAO.getMonthlyBalance(uid);
    }

    public List<Transaction> getTransactions(int uid) {
        return dashboardDAO.getRecentTransactions(uid);
    }
}

