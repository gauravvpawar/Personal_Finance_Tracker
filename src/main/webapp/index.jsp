<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Finance Tracker</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    background: #f5f7fa;
    color: #333;
    line-height: 1.6;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: auto;
}

.navbar {
    background: #1a73e8;
    padding: 15px 0;
    color: white;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 2px 6px rgba(0,0,0,0.15);
}

.navbar .container {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo {
    display: flex;
    align-items: center;
    font-size: 1.4rem;
    font-weight: 600;
}

.logo i {
    margin-right: 8px;
    font-size: 1.5rem;
}

.nav-links {
    display: flex;
    gap: 20px;
    list-style: none;
}

.nav-links a {
    color: white;
    text-decoration: none;
    font-weight: 500;
    transition: 0.3s;
    padding: 5px 10px;
}

.nav-links a:hover {
    background: #0b57d0;
    border-radius: 5px;
}

.hero {
    background: linear-gradient(to right, #1a73e8, #4285f4);
    color: white;
    padding: 100px 0;
    text-align: center;
}

.hero h1 {
    font-size: 3rem;
    margin-bottom: 20px;
}

.hero p {
    max-width: 700px;
    margin: 0 auto 35px;
    font-size: 1.2rem;
}

.btn {
    padding: 12px 25px;
    border-radius: 30px;
    text-decoration: none;
    font-weight: 600;
    transition: 0.3s;
}

.btn-primary {
    background: white;
    color: #1a73e8;
    margin-right: 15px;
}

.btn-primary:hover {
    background: #e8eefc;
}

.btn-secondary {
    background: #0b57d0;
    color: white;
}

.btn-secondary:hover {
    background: #063ea2;
}

.features {
    padding: 80px 0;
    text-align: center;
}

.features h2 {
    font-size: 2.2rem;
    margin-bottom: 40px;
}

.feature-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 25px;
}

.feature-card {
    background: white;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.08);
    transition: 0.3s ease-in-out;
}

.feature-card i {
    font-size: 2.5rem;
    color: #1a73e8;
    margin-bottom: 15px;
}

.feature-card h3 {
    margin-bottom: 10px;
    font-size: 1.4rem;
}

.feature-card p {
    font-size: 0.95rem;
    color: #555;
}

.feature-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.15);
}

/* ------------------------------
   Footer
------------------------------ */
footer {
    background: #1a73e8;
    padding: 20px 0;
    text-align: center;
    color: white;
    margin-top: 50px;
}

footer p {
    font-size: 0.9rem;
}

/* ------------------------------
   Responsive adjustments
------------------------------ */
@media (max-width: 768px) {
    .hero h1 {
        font-size: 2.3rem;
    }

    .nav-links {
        gap: 10px;
    }
}
    
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <div class="logo">
                <i class="fas fa-chart-line"></i>
                <span>FinanceTracker</span>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="Pages/User/UserLoginForm.jsp">Login</a></li>
                <li><a href="Pages/User/UserRegistrationForm.jsp">Register</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#about">About</a></li>
            </ul>
        </div>
    </nav>

    <section class="hero">
        <div class="container">
            <h1>Take Control of Your Finances</h1>
            <p>Track expenses, set budgets, and achieve your financial goals with our easy-to-use personal finance tracker.</p>
            <a href="register.jsp" class="btn btn-primary">Get Started Free</a>
            <a href="Pages/User/UserLoginForm.jsp" class="btn btn-secondary">Login</a>
        </div>
    </section>

    <section id="features" class="features">
        <div class="container">
            <h2>Key Features</h2>
            <div class="feature-grid">
                <div class="feature-card">
                    <i class="fas fa-money-bill-wave"></i>
                    <h3>Expense Tracking</h3>
                    <p>Track your daily expenses and categorize them for better insights.</p>
                </div>
                <div class="feature-card">
                    <i class="fas fa-chart-pie"></i>
                    <h3>Budget Management</h3>
                    <p>Set monthly budgets and monitor your spending habits.</p>
                </div>
                <div class="feature-card">
                    <i class="fas fa-file-invoice-dollar"></i>
                    <h3>Income Tracking</h3>
                    <p>Record all sources of income and analyze your cash flow.</p>
                </div>
                <div class="feature-card">
                    <i class="fas fa-chart-bar"></i>
                    <h3>Visual Reports</h3>
                    <p>Get detailed charts and reports of your financial activities.</p>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; 2025 Personal Finance Tracker. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>