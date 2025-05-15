-- Library Management system

CREATE DATABASE library_db;

USE library_db;

-- create branch table

DROP TABLE IF EXISTS branch; 
CREATE TABLE branch
	(
		branch_id VARCHAR(10) PRIMARY KEY,
        manager_id VARCHAR(10),
        branch_address VARCHAR(55),
        contact_no VARCHAR(15)
	);
    
    
-- create employee table
DROP TABLE IF EXISTS employees;
CREATE TABLE employees  
	(
		emp_id VARCHAR(10) PRIMARY KEY,
        emp_name VARCHAR(30),
        position VARCHAR(30),
        salary INT,
        branch_id VARCHAR(10),
        FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
	);

-- create members table
DROP TABLE IF EXISTS members ;
CREATE TABLE members
	(
		member_id VARCHAR(20) PRIMARY KEY,
        member_name VARCHAR(25),
        member_address VARCHAR(75),
        reg_date DATE
    );

-- create books table
DROP TABLE IF EXISTS books ;
CREATE TABLE books
	(
		isbn VARCHAR(20) PRIMARY KEY,
        book_title VARCHAR(80),
        category VARCHAR(15),
        rental_price FLOAT ,
        status VARCHAR(15),
        author VARCHAR(35),
        publisher VARCHAR(55)
        );
        
ALTER TABLE books
MODIFY category VARCHAR(20);
        
-- create issuestatus table
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
	(
		issued_id VARCHAR(10) PRIMARY KEY,
        issued_member_id VARCHAR(30),
        issued_book_name VARCHAR(80),
        issued_date DATE,
        issued_book_isbn VARCHAR(50),
        issued_emp_id VARCHAR(10),
        FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
        FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
        FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn)
	);

-- create returnstatus table
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
	(
		return_id VARCHAR(10) PRIMARY KEY,
        issued_id VARCHAR(30),
        return_book_name VARCHAR(80),
        return_date DATE,
        return_book_isbn VARCHAR(50),
        FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
    );

