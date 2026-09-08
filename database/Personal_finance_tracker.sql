
 -- Personal Finance tracker
 
 create database personal_finance_tracker;
 
use personal_finance_tracker;

create table users (
    uid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    cnfPassword varchar(100) not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from users;
alter table users add column dob date;
alter table users add column gender varchar(100);
 -- personal_finance_tracker

show databases;
show tables;

create table  transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uid INT NOT NULL,
    type ENUM('income', 'expense') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255) 	,
    category VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (uid) REFERENCES users(uid) ON DELETE CASCADE
);


select * from transactions;

drop table users;
drop table transactions;
drop database personal_finance_tracker;