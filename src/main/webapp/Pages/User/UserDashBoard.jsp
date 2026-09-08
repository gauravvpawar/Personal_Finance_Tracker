
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.finance.model.User"%>
<%@ page import="com.finance.model.Transaction"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/index.jsp"
        );
        return;
    }

    double monthlyIncome =
        (Double) request.getAttribute("monthlyIncome");

    double monthlyExpenses =
        (Double) request.getAttribute("monthlyExpenses");

    double balanceRemaining =
        (Double) request.getAttribute("balanceRemaining");

    List<Transaction> transactions =
        (List<Transaction>) request.getAttribute("transactions");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Finance Tracker</title>

<!-- FontAwesome Icons -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
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
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
    transition: transform .2s;
    min-width: 0;
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

.income p {
    color: #28b463;
}

.expense p {
    color: #e74c3c;
}

.balance p {
    color: #3498db;
}

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
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
    min-width: 0;
}

.form-container h2 {
    margin-bottom: 15px;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-weight: 500;
}

input,
select {
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

/* -------------------- TRANSACTIONS -------------------- */

.transactions-container {
    width: 60%;
    background: #fff;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
    min-width: 0;
}

.greet {
    backdrop-filter: blur(10px);
    background: rgba(255, 255, 255, 0.25);
    padding: 16px 24px;
    border-radius: 15px;
    font-size: 22px;
    font-weight: 600;
    color: #222;
    margin: 25px auto;
    width: 90%;
    max-width: 1200px;
    display: flex;
    align-items: center;
    gap: 10px;
    border: 1px solid rgba(255, 255, 255, 0.4);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.greet i {
    font-size: 28px;
    color: #4e54f8;
}

.transactions-container {
    width: 90%;
    margin: 20px auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    font-family: 'Arial', sans-serif;
}

.transactions-container h2 {
    font-size: 1.8em;
    margin-bottom: 15px;
    color: #333;
}

.transactions-container h2 i {
    color: #4CAF50;
}

#transactions-list table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
}

#transactions-list th,
#transactions-list td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

#transactions-list th {
    background-color: #4CAF50;
    color: white;
    font-weight: bold;
}

#transactions-list tr:hover {
    background-color: #f1f1f1;
    cursor: pointer;
}

#transactions-list td {
    color: #555;
}

#transactions-list td:nth-child(4) {
    font-weight: bold;
}

/* -------------------- RESPONSIVE -------------------- */

@media screen and (max-width: 768px) {

    .transactions-container {
        padding: 10px;
    }

    #transactions-list th,
    #transactions-list td {
        padding: 8px 10px;
    }

}

</style>

</head>

<body>


<%
    String profileMessage =
        (String) session.getAttribute("profileMessage");

    if (profileMessage != null) {

        session.removeAttribute("profileMessage");
%>

<script>
    alert("<%= profileMessage %>");
</script>

<%
    }
%>


<%
    String transactionMessage =
        (String) session.getAttribute("transactionMessage");

    if (transactionMessage != null) {

        session.removeAttribute("transactionMessage");
%>

<script>
    alert("<%= transactionMessage %>");
</script>

<%
    }
%>
<!-- NAVBAR -->

<div class="navbar">

    <h2>Finance Tracker</h2>

    <div class="nav-links">

      <a href="<%= request.getContextPath() %>/dashboard">
		    Dashboard
		</a>

        <a href="<%= request.getContextPath() %>/profile">
            Profile
        </a>

        <a href="#">
            Reports
        </a>

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>

    </div>

</div>


<!-- GREETING -->

<div class="greet">

    <i class="fas fa-user-circle"></i>

    <span>
        Welcome <%= user.getName() %>
    </span>

</div>


<!-- DASHBOARD CARDS -->

<div class="stats-container">

    <div class="stat-card income">

        <h3>Monthly Income</h3>

        <p id="monthly-income">
            ₹<%= monthlyIncome %>
        </p>

    </div>


    <div class="stat-card expense">

        <h3>Monthly Expenses</h3>

        <p id="monthly-expenses">
            ₹<%= monthlyExpenses %>
        </p>

    </div>


    <div class="stat-card balance">

        <h3>Balance</h3>

        <p id="monthly-balance">
            ₹<%= balanceRemaining %>
        </p>

    </div>

</div>


<!-- MAIN CONTENT -->

<div class="content-container">


    <!-- ADD TRANSACTION FORM -->

    <div class="form-container">

        <h2>
            <i class="fas fa-plus-circle"></i>
            Add Transaction
        </h2>


        <form id="transaction-form"
              action="<%= request.getContextPath() %>/transaction"
              method="post">


            <div class="form-group">

                <label>Type:</label>

                <div class="type-toggle">

                    <button type="button"
                            class="type-btn active"
                            data-type="income">
                        Income
                    </button>

                    <button type="button"
                            class="type-btn"
                            data-type="expense">
                        Expense
                    </button>

                </div>


                <input type="hidden"
                       id="transaction-type"
                       name="type"
                       value="income">

            </div>


            <div class="form-group">

                <label>Amount (₹):</label>

                <input type="number"
                       id="amount"
                       min="0"
                       step="0.01"
                       name="amount"
                       required>

            </div>


            <div class="form-group">

                <label>Description:</label>

                <input type="text"
                       id="description"
                       name="description"
                       required>

            </div>


            <div class="form-group">

                <label>Category:</label>

                <select id="category"
                        name="category">

                    <option value="Salary">Salary</option>
                    <option value="Freelance">Freelance</option>
                    <option value="Other">Other</option>

                </select>

            </div>


            <div class="form-group">

                <label>Date:</label>

                <input type="date"
                       id="date"
                       name="date"
                       required>

            </div>


            <button type="submit"
                    class="submit-btn">

                <i class="fas fa-save"></i>
                Add Transaction

            </button>

        </form>

    </div>


    <!-- RECENT TRANSACTIONS -->

    <div class="transactions-container">

        <h2>
            <i class="fas fa-history"></i>
            Recent Transactions
        </h2>


        <div id="transactions-list">

            <table>

                <tr>

                    <th>Type</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Amount</th>

                </tr>


                <%
                    if (transactions != null &&
                        !transactions.isEmpty()) {

                        for (Transaction transaction : transactions) {
                %>

                <tr>

                    <td>
                        <%= transaction.getType() %>
                    </td>

                    <td>
                        <%= transaction.getDescription() %>
                    </td>

                    <td>
                        <%= transaction.getCategory() %>
                    </td>

                    <td>
                        ₹<%= transaction.getAmount() %>
                    </td>

                </tr>

                <%
                        }

                    } else {
                %>

                <tr>

                    <td colspan="4"
                        style="text-align:center;">
                        No transactions found.
                    </td>

                </tr>

                <%
                    }
                %>

            </table>

        </div>

    </div>

</div>


<script>

// Toggle buttons

const typeButtons =
    document.querySelectorAll(".type-btn");

const hiddenTypeInput =
    document.getElementById("transaction-type");

const categorySelect =
    document.getElementById("category");


// Categories

const expenseCategories = [
    "Food",
    "Transportation",
    "Shopping",
    "Entertainment",
    "Bills",
    "Other"
];

const incomeCategories = [
    "Salary",
    "Freelance",
    "Other"
];


// Handle toggle switch

typeButtons.forEach(btn => {

    btn.addEventListener("click", () => {

        document
            .querySelector(".type-btn.active")
            .classList
            .remove("active");

        btn.classList.add("active");

        const selectedType =
            btn.dataset.type;

        hiddenTypeInput.value =
            selectedType;

        updateCategories(selectedType);

    });

});


// Update category dropdown

function updateCategories(type) {

    categorySelect.innerHTML = "";

    const list =
        type === "income"
            ? incomeCategories
            : expenseCategories;

    list.forEach(cat => {

        const option =
            document.createElement("option");

        option.value = cat;
        option.textContent = cat;

        categorySelect.appendChild(option);

    });

}


// Initialize

updateCategories("income");

</script>

</body>

</html>

