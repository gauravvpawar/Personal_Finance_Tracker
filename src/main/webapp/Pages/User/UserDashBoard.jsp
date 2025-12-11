<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance Tracker</title>
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            background: #f4f6f9;
            color: #333;
            overflow-x: hidden;
        }

        .navbar {
            width: 100%;
            background: #1e1e2d;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }
        .navbar h2 {
            margin: 0;
            font-weight: 600;
        }
        .navbar .nav-links a {
            margin-left: 20px;
            color: #cccccc;
            text-decoration: none;
            font-size: 15px;
        }
        .navbar .nav-links a:hover {
            color: #fff;
        }

        /* -------------------- DASHBOARD CARDS -------------------- */
        .stats-container {
            margin: 25px auto;
            width: 90%;
            max-width: 1200px;
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }
        .stat-card {
            flex: 1;
            padding: 25px;
            background: #ffffff;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            transition: transform .2s;
            min-width: 0; /* Prevents overflow */
        }
        .stat-card:hover {
            transform: translateY(-5px);
        }
        .stat-card h3 {
            margin: 0;
            color: #515151;
            font-size: 18px;
        }
        .stat-card p {
            margin-top: 10px;
            font-size: 26px;
            font-weight: 600;
        }
        .income p { color: #28b463; }
        .expense p { color: #e74c3c; }
        .balance p { color: #3498db; }

        /* -------------------- MAIN CONTENT -------------------- */
        .content-container {
            width: 90%;
            max-width: 1200px;
            margin: auto;
            display: flex;
            gap: 25px;
        }

        /* -------------------- ADD TRANSACTION FORM -------------------- */
        .form-container {
            width: 40%;
            padding: 25px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            min-width: 0; /* Prevents overflow */
        }
        .form-container h2 {
            margin-bottom: 15px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label { font-weight: 500; }

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 5px;
            max-width: 100%;
        }

        .type-toggle button {
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-right: 10px;
            background: #ddd;
        }
        .type-toggle .active {
            background: #3498db;
            color: #fff;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            border: none;
            background: #1e88e5;
            color: #fff;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.2s;
        }
        .submit-btn:hover {
            background: #1669b2;
        }

        .transactions-container {
            width: 60%;
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            min-width: 0; /* Prevents overflow */
        }

        .transaction-item {
            padding: 12px;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #eee;
            min-width: 0; /* Prevents overflow */
        }

        .transaction-item:last-child { border-bottom: none; }

        .income-text { color: #28b463; }
        .expense-text { color: #e74c3c; }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">
        <h2>Finance Tracker</h2>
        <div class="nav-links">
            <a href="#">Dashboard</a>
            <a href="#">Profile</a>
            <a href="#">Reports</a>
            <a href="<%= request.getContextPath() %>/Controller/UserLogOutProcess.jsp">Logout</a>
        </div>
    </div>

    <!-- DASHBOARD CARDS -->
    <div class="stats-container">
        <div class="stat-card income">
            <h3>Monthly Income</h3>
            <p id="monthly-income">₹0.00</p>
        </div>
        <div class="stat-card expense">
            <h3>Monthly Expenses</h3>
            <p id="monthly-expenses">₹0.00</p>
        </div>
        <div class="stat-card balance">
            <h3>Balance</h3>
            <p id="monthly-balance">₹0.00</p>
        </div>
    </div>

    <div class="content-container">

        <!-- ADD TRANSACTION FORM -->
        <div class="form-container">
            <h2><i class="fas fa-plus-circle"></i> Add Transaction</h2>

            <form id="transaction-form">
                <div class="form-group">
                    <label>Type:</label>
                    <div class="type-toggle">
                        <button type="button" class="type-btn active" data-type="income">Income</button>
                        <button type="button" class="type-btn" data-type="expense">Expense</button>
                    </div>
                    <input type="hidden" id="transaction-type" value="income">
                </div>

                <div class="form-group">
                    <label>Amount (₹):</label>
                    <input type="number" id="amount" min="0" step="0.01" required>
                </div>

                <div class="form-group">
                    <label>Description:</label>
                    <input type="text" id="description" required>
                </div>

                <div class="form-group">
                    <label>Category:</label>
                    <select id="category">
                        <option value="Other">Other</option>
                        <option value="Food">Food</option>
                        <option value="Transportation">Transportation</option>
                        <option value="Shopping">Shopping</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Bills">Bills</option>
                        <option value="Salary">Salary</option>
                        <option value="Freelance">Freelance</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Date:</label>
                    <input type="date" id="date" required>
                </div>

                <button type="submit" class="submit-btn"><i class="fas fa-save"></i> Add Transaction</button>
            </form>
        </div>

        <!-- RECENT TRANSACTIONS -->
        <div class="transactions-container">
            <h2><i class="fas fa-history"></i> Recent Transactions</h2>
            <div id="transactions-list"></div>
        </div>

    </div>
</body>
</html>