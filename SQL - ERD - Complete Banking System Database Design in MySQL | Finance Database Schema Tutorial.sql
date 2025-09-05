CREATE DATABASE IF NOT EXISTS finance_db;
USE finance_db;

-- Companies
CREATE TABLE companies (
    company_code VARCHAR(10) PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL UNIQUE,
    headquarters_address TEXT NOT NULL,
    phone VARCHAR(20),
    established_date DATE,
    total_assets DECIMAL(15,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Branches
CREATE TABLE branches (
    branch_code VARCHAR(15) PRIMARY KEY,
    company_code VARCHAR(10) NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(20),
    manager_name VARCHAR(100),
    opening_hours TIME DEFAULT '09:00:00',
    closing_hours TIME DEFAULT '17:00:00',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (company_code) REFERENCES companies(company_code) ON DELETE CASCADE,
    INDEX idx_company_branch (company_code) -- Speed up the query that fillter or Join based on company_code
);

-- Employees
CREATE TABLE employees (
    employee_id VARCHAR(10) PRIMARY KEY,
    branch_code VARCHAR(15) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL,
    department VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_code) REFERENCES branches(branch_code) ON DELETE CASCADE,
    INDEX idx_branch_employee (branch_code),
    INDEX idx_employee_email (email)
);

-- Account_types
CREATE TABLE account_types (
    account_type_code VARCHAR(10) PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    minimum_balance DECIMAL(10,2) DEFAULT 0.00,
    interest_rate DECIMAL(5,4) DEFAULT 0.0000,
    allows_overdraft BOOLEAN DEFAULT FALSE
);

-- Transaction_Categories
CREATE TABLE transaction_categories (
    category_code VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    category_type ENUM('INCOME','EXPENSE','TRANSFER','INVESTMENT') NOT NULL
    );

-- Customers
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    relationship_manager_id VARCHAR(10),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    date_of_birth DATE NOT NULL,
    id_number VARCHAR(50) UNIQUE NOT NULL,
    credit_score DECIMAL(4,1) DEFAULT 0.0,
    registration_date DATE DEFAULT (CURDATE()),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (relationship_manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL,
    INDEX idx_customer_manager (relationship_manager_id),
    INDEX idx_customer_email (email),
    CONSTRAINT chk_credit_score CHECK (credit_score >= 0 AND credit_score <= 850)
);

-- Accounts table
CREATE TABLE accounts (
    account_number VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    account_type_code VARCHAR(10) NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0.00,
    opening_date DATE DEFAULT (CURDATE()),
    status ENUM('ACTIVE', 'INACTIVE', 'FROZEN', 'CLOSED') DEFAULT 'ACTIVE',
    overdraft_limit DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (account_type_code) REFERENCES account_types(account_type_code),
    INDEX idx_customer_account (customer_id),
    INDEX idx_account_type (account_type_code)
);

-- Transactions
CREATE TABLE transactions (
    transaction_reference VARCHAR(20) PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL,
    category_code VARCHAR(10) NOT NULL,
    transaction_type ENUM('DEBIT', 'CREDIT') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    description TEXT,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    running_balance DECIMAL(15,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_number) REFERENCES accounts(account_number) ON DELETE CASCADE,
    FOREIGN KEY (category_code) REFERENCES transaction_categories(category_code),
    INDEX idx_account_transaction (account_number),
    INDEX idx_transaction_date (transaction_date),
    CONSTRAINT chk_amount CHECK (amount > 0)
);

-- Loans
CREATE TABLE loans (
    loan_number VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    loan_type ENUM('PERSONAL', 'HOME', 'CAR', 'BUSINESS', 'EDUCATION') NOT NULL,
    principal_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,4) NOT NULL,
    term_months INT NOT NULL,
    monthly_payment DECIMAL(10,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('ACTIVE', 'PAID_OFF', 'DEFAULTED', 'PENDING') DEFAULT 'PENDING',
    outstanding_balance DECIMAL(15,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    INDEX idx_customer_loan (customer_id),
    INDEX idx_loan_status (status),
    CONSTRAINT chk_principal CHECK (principal_amount > 0),
    CONSTRAINT chk_interest_rate CHECK (interest_rate >= 0),
    CONSTRAINT chk_term_months CHECK (term_months > 0)
);

-- Cards
CREATE TABLE cards (
    card_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    linked_account_number VARCHAR(20) NOT NULL,
    card_number_masked VARCHAR(19) NOT NULL,
    card_type ENUM('DEBIT', 'CREDIT', 'PREPAID') NOT NULL,
    issue_date DATE DEFAULT (CURDATE()),
    expiry_date DATE NOT NULL,
    credit_limit DECIMAL(10,2) DEFAULT 0.00,
    status ENUM('ACTIVE', 'BLOCKED', 'EXPIRED', 'CANCELLED') DEFAULT 'ACTIVE',
    pin_hash VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (linked_account_number) REFERENCES accounts(account_number) ON DELETE CASCADE,
    UNIQUE KEY unique_account_card (linked_account_number),
    INDEX idx_customer_card (customer_id),
    INDEX idx_card_masked (card_number_masked),
    CONSTRAINT chk_expiry_date CHECK (expiry_date > issue_date)
);














