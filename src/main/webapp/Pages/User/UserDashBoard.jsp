<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*" %>
    
<%
HttpSession hs =  request.getSession();
String email =  (String)hs.getAttribute("email");

if(email == null)
{
	out.println("<script>");
	out.println("alert('You can not access page directly')");
	out.println("</script>");
}

%>    
    
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
        
        
        .greet {
		    backdrop-filter: blur(10px);
		    background: rgba(255, 255, 255, 0.25);
		    padding: 16px 24px;
		    border-radius: 15px;
		    font-size: 22px;
		    font-weight: 600;
		    color: #222;
		    margin-bottom: 25px;
		    display: flex;
		    align-items: center;
		    gap: 10px;
		    border: 1px solid rgba(255,255,255,0.4);
		    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
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
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    font-family: 'Arial', sans-serif;
}

/* Heading Styling */
.transactions-container h2 {
    font-size: 1.8em;
    margin-bottom: 15px;
    color: #333;
}

.transactions-container h2 i {
    color: #4CAF50; /* Icon color */
}

/* Table Styling */
#transactions-list table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
}

#transactions-list th, #transactions-list td {
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

/* Amount Styling: Optional to color based on type */
#transactions-list td:nth-child(4) {
    font-weight: bold;
}

/* Responsive */
@media screen and (max-width: 768px) {
    .transactions-container {
        padding: 10px;
    }

    #transactions-list th, #transactions-list td {
        padding: 8px 10px;
    }
        
    </style>
</head>

<body>


<%

int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personal_finance_tracker" ,"root", "gaurav@123");

PreparedStatement ps = con.prepareStatement("select * from users where uid = '"+id+"'  ");

ResultSet rs = ps.executeQuery();

if(!rs.next())
{
	out.println("<script>");
	out.println("alert('user id is not valid')");
	out.println("window.location.href = '../../index.jsp' ");
	out.println("</script>");
}
%>


    <!-- NAVBAR -->
    <div class="navbar">
        <h2>Finance Tracker</h2>
        <div class="nav-links">
            <a href="./UserDashBoard.jsp?id=<%= rs.getInt(1) %>">Dashboard</a>
            <a href="./UserUpdateProfileForm.jsp?id=<%= rs.getInt(1) %>">Profile</a>
            <a href="#">Reports</a>
            <a href="<%= request.getContextPath() %>/Controller/UserLogOutProcess.jsp">Logout</a>
        </div>
    </div>

	<div class="greet">
		 <span>Welcome <%= rs.getString(2) %> </span>
	</div>
	
<%

PreparedStatement ps1 = con.prepareStatement("select sum(amount) from transactions where type = 'income' and uid = '"+id+"' and date >= date_sub(curdate() , Interval 1 month) ");

ResultSet rs1 = ps1.executeQuery();

int monthlyIncome = 0;
 
if(rs1.next())
{
	monthlyIncome = rs1.getInt(1);
}

int monthlyExpences = 0;
ps1 = con.prepareStatement("select sum(amount) from transactions where type = 'expense' and uid = '"+id+"' and date >= date_sub(curdate() , Interval 1 month) ");
rs1 = ps1.executeQuery();

if(rs1.next())
{
	monthlyExpences = rs1.getInt(1);
}

int balanceRemaining = 0;
ps1 = con.prepareStatement("select sum(case when type = 'income' then amount else 0 end) - sum(case when type = 'expense' then amount else 0 end) from transactions where  uid = '"+id+"' and date >= date_sub(curdate() , Interval 1 month) ");
rs1 = ps1.executeQuery();

if(rs1.next())
{
	balanceRemaining = rs1.getInt(1);
}


%>

    <!-- DASHBOARD CARDS -->
    <div class="stats-container">
        <div class="stat-card income">
            <h3>Monthly Income</h3>
            <p id="monthly-income">₹ <%= monthlyIncome %></p>
        </div>
        <div class="stat-card expense">
            <h3>Monthly Expenses</h3>
            <p id="monthly-expenses">₹ <%= monthlyExpences %></p>
        </div>
        <div class="stat-card balance">
            <h3>Balance</h3>
            <p id="monthly-balance">₹ <%= balanceRemaining %></p>
        </div>
    </div>

    <div class="content-container">

        <!-- ADD TRANSACTION FORM -->
        <div class="form-container">
            <h2><i class="fas fa-plus-circle"></i> Add Transaction</h2>

            <form id="transaction-form" action="${pageContext.request.contextPath}/Controller/UserTransactionProcess.jsp" method="post">
				<div class="form-group">

				<!-- For the user id -->
				<input type="hidden" name="id" value="<%= rs.getInt(1) %>"> 

                    <label>Type:</label>
                    <div class="type-toggle">
                        <button type="button" class="type-btn active" data-type="income">Income</button>	
                        <button type="button" class="type-btn" data-type="expense">Expense</button>
                    </div>
                    <input type="hidden" id="transaction-type" name="type" value="income">
                </div>


		
                <div class="form-group">
                    <label>Amount (₹):</label>
                    <input type="number" id="amount" min="0" step="0.01" name="amount" required>
                </div>

                <div class="form-group">
                    <label>Description:</label>
                    <input type="text" id="description"  name="description" required>
                </div>

                <div class="form-group">
                    <label>Category:</label>
                    <select id="category" name="category">
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
                    <input type="date" id="date" name="date" required>
                </div>

                <button type="submit" class="submit-btn"><i class="fas fa-save"></i> Add Transaction</button>
            </form>
        </div>

        <!-- RECENT TRANSACTIONS -->
        <div class="transactions-container">
            <h2><i class="fas fa-history"></i> Recent Transactions</h2>
            <div id="transactions-list">
            
            <table>
            <tr>
            <th>Type</th>
            <th>Description</th>
            <th>Category</th>
            <th>Amount</th>
            </tr>
            
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/personal_finance_tracker" ,"root", "gaurav@123");
PreparedStatement ps2 =  con2.prepareStatement("select type , description , category , amount from transactions where uid = '"+id+"' ");

ResultSet rs2 =  ps2.executeQuery();

while(rs2.next())
{
%>
            
         	<tr>
         	<td><%= rs2.getString(1) %></td>
         	<td><%= rs2.getString(2) %></td>
         	<td><%= rs2.getString(3) %></td>
         	<td><%= rs2.getString(4) %></td>
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
    const typeButtons = document.querySelectorAll(".type-btn");
    const hiddenTypeInput = document.getElementById("transaction-type");
    const categorySelect = document.getElementById("category");

    // Categories
    const expenseCategories = ["Food", "Transportation", "Shopping", "Entertainment", "Bills", "Other"];
    const incomeCategories = ["Salary", "Freelance", "Other"];

    // Handle toggle switch
    typeButtons.forEach(btn => {
        btn.addEventListener("click", () => {
            // update active class
            document.querySelector(".type-btn.active").classList.remove("active");
            btn.classList.add("active");

            // update hidden input
            const selectedType = btn.dataset.type;
            hiddenTypeInput.value = selectedType;

            // update categories
            updateCategories(selectedType);
        });
    });

    // Update category dropdown based on type
    function updateCategories(type) {
        categorySelect.innerHTML = ""; // clear old categories

        const list = type === "income" ? incomeCategories : expenseCategories;

        list.forEach(cat => {
            const option = document.createElement("option");
            option.value = cat;
            option.textContent = cat;
            categorySelect.appendChild(option);
        });
    }

    // initialize default categories (income)
    updateCategories("income");

    </script>
</body>
</html>