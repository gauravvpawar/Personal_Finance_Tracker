package com.finance.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.finance.config.DBConnection;
import com.finance.model.Transaction;
import com.finance.model.User;

public class DashboardDAO {

    // ---------------------------------------------------------
    // 1. Get User Details
    // ---------------------------------------------------------
    public User getUserById(int uid) {

    	String sql = "select uid, name, email, password, cnfPassword from users where uid = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, uid);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    User user = new User();

                    user.setUid(rs.getInt("uid"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setCnfPassword(rs.getString("cnfPassword"));

                    return user;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // ---------------------------------------------------------
    // 2. Get Monthly Income
    // ---------------------------------------------------------
    public double getMonthlyIncome(int uid) {

    	String sql = "select coalesce(sum(amount), 0) as monthly_income from transactions where uid = ? and type = 'income' and date >= date_sub(curdate(), interval 1 month)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, uid);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return rs.getDouble("monthly_income");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }


    // ---------------------------------------------------------
    // 3. Get Monthly Expenses
    // ---------------------------------------------------------
    public double getMonthlyExpenses(int uid) {

        String sql = "SELECT COALESCE(SUM(amount), 0) AS monthly_expenses "
                   + "FROM transactions "
                   + "WHERE uid = ? "
                   + "AND type = 'expense' "
                   + "AND date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, uid);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return rs.getDouble("monthly_expenses");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }


    // ---------------------------------------------------------
    // 4. Get Monthly Balance
    // ---------------------------------------------------------
    public double getMonthlyBalance(int uid) {

        String sql = "SELECT "
                   + "COALESCE(SUM(CASE "
                   + "WHEN type = 'income' THEN amount "
                   + "ELSE 0 END), 0) "
                   + "-"
                   + "COALESCE(SUM(CASE "
                   + "WHEN type = 'expense' THEN amount "
                   + "ELSE 0 END), 0) "
                   + "AS balance "
                   + "FROM transactions "
                   + "WHERE uid = ? "
                   + "AND date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, uid);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return rs.getDouble("balance");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }


    // ---------------------------------------------------------
    // 5. Get Recent Transactions
    // ---------------------------------------------------------
    public List<Transaction> getRecentTransactions(int uid) {

        List<Transaction> transactions = new ArrayList<>();

        String sql = "select type, description, category, amount, date from transactions where uid = ? order by date desc";
        
        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, uid);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Transaction transaction = new Transaction();

                    transaction.setType(
                        rs.getString("type")
                    );

                    transaction.setDescription(
                        rs.getString("description")
                    );

                    transaction.setCategory(
                        rs.getString("category")
                    );

                    transaction.setAmount(
                        rs.getDouble("amount")
                    );

                    transaction.setTransactionDate(
                        rs.getDate("date")
                    );

                    transactions.add(transaction);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return transactions;
    }
}
