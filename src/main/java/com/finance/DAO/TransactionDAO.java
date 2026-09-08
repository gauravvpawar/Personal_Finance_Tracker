package com.finance.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.finance.config.DBConnection;
import com.finance.model.Transaction;

public class TransactionDAO {

    public boolean addTransaction(Transaction transaction) {

        String sql =
            "INSERT INTO transactions " +
            "(uid, type, amount, description, category, date) " +
            "VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, transaction.getUserId());
            ps.setString(2, transaction.getType());
            ps.setDouble(3, transaction.getAmount());
            ps.setString(4, transaction.getDescription());
            ps.setString(5, transaction.getCategory());
            ps.setDate(6, transaction.getTransactionDate());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}