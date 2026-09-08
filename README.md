````
# Personal Finance Tracker

A web-based Personal Finance Tracker built using Java Servlets, JSP, JDBC, and MySQL. The application helps users manage their personal finances by tracking income and expenses, viewing transaction history, and managing their profile.

## Features

- User Registration
- User Login and Logout
- Forgot Password
- Update Password
- Update User Profile
- Add Income and Expense Transactions
- Categorize Transactions
- View Transaction History
- Monthly Income and Expense Summary
- Balance Calculation
- User Dashboard
- Session-based Authentication
- MySQL Database Integration

## Technology Stack

- **Backend:** Java, Servlets
- **Frontend:** JSP, HTML, CSS
- **Database:** MySQL
- **Database Connectivity:** JDBC
- **Server:** Apache Tomcat

## Project Architecture

The project follows a layered architecture to separate presentation, business logic, and database operations.

```text
JSP Pages
    ↓
Servlets / Controllers
    ↓
Service Layer
    ↓
DAO Layer
    ↓
JDBC
    ↓
MySQL Database
````

 ### Layers

 - **JSP:** Handles the user interface and displays application data.
- **Controller / Servlets:** Handles HTTP requests and controls application flow.
- **Service:** Contains the application's business logic.
- **DAO:** Handles database operations.
- **Model:** Represents application data such as users and transactions.
- **Database:** Stores user and financial transaction information.

 ## Main Functionalities

 ### User Registration and Login

 Users can register by providing their personal details and can log in using their registered email and password. Session management is used to maintain authenticated users.

 ### Password Management

 The application provides forgot password and update password functionality for account management.

 ### Profile Management

 Users can update their profile information including:

 - Name
- Email
- Date of Birth
- Gender
- Password

 ### Income and Expense Tracking

 Users can record their financial transactions as income or expenses. Each transaction can contain details such as amount, category, description, and date.

 ### Dashboard

 The user dashboard provides an overview of financial activity, including:

 - Monthly income
- Monthly expenses
- Remaining balance
- Transaction history

 ## Database

 The application uses MySQL for storing user and transaction data.

 ### Users

 Stores user account and profile information.

 ### Transactions

 Stores income and expense records associated with individual users.

 The database script is available at:

```
database/Personal_finance_tracker.sql
```

 ## Project Structure

```
Personal_Finance_Tracker/
│
├── database/
│   └── Personal_finance_tracker.sql
│
├── ScreenShots/
│   ├── MainPage.png
│   ├── RegisterPage.png
│   ├── LoginPage.png
│   ├── ForgotPasswordPage.png
│   ├── UpdatePasswordPage.png
│   ├── UserDashboard.png
│   └── UserUpdateData.png
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── finance/
│       │           ├── DAO/
│       │           ├── config/
│       │           ├── controller/
│       │           ├── model/
│       │           └── service/
│       │
│       └── webapp/
│
└── README.md
```

 ## Screenshots

 ### Home Page

 ### Register Page

 ### Login Page

 ### Forgot Password

 ### Update Password

 ### User Dashboard

 ### Update Profile

 ## How to Run

 ### Prerequisites

 - Java JDK
- Apache Tomcat
- MySQL
- Eclipse IDE or any Java web development IDE

 ### 1\. Clone the Repository

```
git clone https://github.com/gauravvpawar/Personal_Finance_Tracker.git
```

 ### 2\. Setup the Database

 Open MySQL and execute:

```
database/Personal_finance_tracker.sql
```

 ### 3\. Configure Database Connection

 Update the MySQL database credentials in the database connection configuration file:

```
src/main/java/com/finance/config/DBConnection.java
```

 ### 4\. Configure Tomcat

 Configure Apache Tomcat in your IDE and deploy the project as a web application.

 ### 5\. Run the Application

 Start the Tomcat server and open the application in your browser.

```
http://localhost:8080/Personal_Finance_Tracker/
```

 ## What I Learned

 Through this project, I gained practical experience in:

 - Java Servlet and JSP development
- MVC-style application structure
- DAO and Service layer implementation
- JDBC and MySQL database connectivity
- CRUD operations
- Session management and authentication
- Form handling and validation
- Connecting frontend JSP pages with backend Java code

 ## Future Improvements

 - Password hashing and stronger authentication
- Improved input validation
- Financial charts and reports
- Monthly and yearly reports
- Budget management
- Export transactions to CSV or PDF
- Responsive UI
- Email-based password recovery

 ## Author

 **Gaurav Pawar**

 GitHub: https://github.com/gauravvpawar

```

```
