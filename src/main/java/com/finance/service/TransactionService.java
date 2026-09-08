package com.finance.service;

import com.finance.DAO.TransactionDAO;
import com.finance.model.Transaction;

public class TransactionService {

    private TransactionDAO transactionDAO;

    public TransactionService() {
        transactionDAO = new TransactionDAO();
    }

    public boolean addTransaction(Transaction transaction) {
        return transactionDAO.addTransaction(transaction);
    }
}