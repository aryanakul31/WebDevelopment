-- USE db_name;

-- CREATE DATABASE your_db_name;
-- DROP DATABASE your_db_name;

-- CREATE TABLE your_table_name (f_name VARCHAR(20), l_name VARCHAR(20));
-- DROP TABLE your_table_name;

-- ALTER TABLE your_table_name ADD COLUMN your_column_name VARCHAR(20);
-- ALTER TABLE your_table_name DROP COLUMN your_column_name;
-- ALTER TABLE your_table_name CHANGE your_old_column_name your_new_column_name DATE;
-- ALTER TABLE your_table_name MODIFY your_column_name VARCHAR(20);

-- INSERT INTO your_table_name ADD (full_name, gender) VALUES ('Nakul','MALE');
-- INSERT INTO your_table_name ADD (full_name, gender) VALUES ('Nakul','MALE'), ('Nakul Arya','MALE');

-- DELETE FROM your_column_name WHERE id=1;
-- DELETE FROM your_table_name WHERE id IN(1,2,3,4);
-- TRUNCATE your_table_name;

-- SELECT * FROM your_table_name;
-- SELECT DISTINCT your_table_name FROM your_table_name;
-- SELECT COUNT(*) FROM  your_table_name;
-- SELECT * FROM your_table_name WHERE id=2 or first_name = 'Nakul';
-- SELECT * FROM your_table_name WHERE id >2;
-- SELECT first_name AS 'First Name' FROM your_table_name;
-- SELECT * FROM your_table_name LIMIT 10;
-- SELECT * FROM your_table_name LIMIT 10 OFFSET = 20;
-- SELECT * FROM your_table_name WHERE empId BETWEEN 10 AND 30;
-- SELECT * FROM your_table_name WHERE id IN(1,2,3,4);
-- SELECT * FROM employees ORDER BY country DESC; 
-- SELECT * FROM employees ORDER BY country ASC; 

-- Aggregate Functions
-- SELECT COUNT(empId) FROM employees ;
-- SELECT AVG(empId) FROM employees ;
-- SELECT MIN(empId) FROM employees ;
-- SELECT MAX(empId) FROM employees ;
-- SELECT SUM(empId) FROM employees ;

-- SELECT COUNT(*) FROM employees GROUP BY country;
-- SELECT COUNT(*) FROM employees GROUP BY country HAVING salary<7000;

-- CREATE TABLE users (id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,  username VARCHAR(50) NOT NULL, email VARCHAR(50) NOT NULL, phone int(1000) NULL);
-- INSERT INTO users (username, email, phone) VALUES ('Nakul', 'aryanakul31@gmail.com', '50');
-- SELECT * FROM users ORDER BY id DESC;
-- UPDATE users SET username ='',email='' WHERE id =1;
-- DELETE FROM users WHERE id=1;

-- DATA TYPES
-- 1.1 CHAR(5)- Fixed length of 5
-- 1.2 VARCHAR(5)- Varying length but max length is 5
-- 2. Decimal(5,2) - 2 means 2 digits after decimal, eg, 123.45
-- 3.1 Date and Time - DATE, TIME or DATETIME
-- 3.2 Current DateAndTime Fns- CURDATE(), CURTIME(), NOW()
-- 3.3 DateAndTime Fns- DAY(), DAYNAME(), DAYOFWEEK(), DAYOFYEAR(),		MONTH(), MONTHNAME(),		YEAR(),		HOUR(),MINUTE(),SECOND()
-- 3.4 Dates - DATE_DIFF(), DATE_ADD()
-- 3.5 TimeStamps
-- 3.6 DATE_FORMAT(date, %HH)

-- SELECT SUBSTR(first_name,1,3) FROM employees;

-- SELECT CONCAT('Nakul','Arya');
-- SELECT CONCAT_WS(' ','Nakul','Arya');
-- SELECT CONCAT_WS('-','Nakul','Arya');

-- SELECT ASCII('N'); -- or 'Nakul' in place of N
-- SELECT BIN(200);
-- SELECT TRIM(' Hello World  ');
-- SELECT LENGTH('Hello World');
-- SELECT UPPER(first_name) FROM employees where id <5; -- OR-- 
-- SELECT UCASE(first_name) FROM employees where id <5;
-- SELECT LOWER(first_name) FROM employees where id <5; -- OR --  
-- SELECT LCASE(first_name) FROM employees where id <5;
-- SELECT REVERSE(first_name) FROM employees where id <5;
-- SELECT REPLACE(first_name,'a','b') FROM employees where id<5; -- OR -- 
-- SELECT REPLACE(first_name,'a','bbb') FROM employees where id<5;

-- SELECT STRCMP('STR1', 'STR2'); --  (-1) or (1) ->Not Equal 		(0)->Equal
-- SELECT RAND(); -- No arguments, only multiplication
-- SELECT RAND()*100;
-- SELECT ROUND(122.22);
-- SELECT ROUND(122.22,1); -- Number of digits after decimal. Here-> only 1

-- 			RELATIONSHIPS		-- 
-- 1. One To One-> Example- employees and employee_details (every employee has only one detail) RARE
-- 2. One to Many-> Example- employees and salaries (one employee has many salaries,ie, different months) MOST COMMON, MOST USEFUL
-- 3. Many to Many-> 

-- Primary key
-- 	Unique defines a record.
--     Stop duplicates
--     A table can have only one primary key

-- Foreign key
-- 	Links two tables together

-- Constraints:
-- 	Example Primary Key, Foreign Key, NOT NULL, CHECK, Default, index

-- CREATE DATABASE company;

-- CREATE TABLE employees(
-- 	id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(100),
--     last_name VARCHAR(100),
--     email VARCHAR(100)
-- );
-- CREATE TABLE salaries(
-- 	id INT AUTO_INCREMENT PRIMARY KEY,
--     salary DECIMAL(15,2),
--     salary_date DATE,
--     empId INT,
--     FOREIGN KEY salaries(empId) REFERENCES employees(id)
-- );

-- INSERT INTO employees (first_name, last_name, email) VALUES ('Nakul', 'Arya', 'aryanakul31@gmail.com'), ('Nakul', 'Arya', 'nakularya99@gmail.com') ;
-- INSERT INTO salaries (salary, salary_date, empId) VALUES (100.50, NOW(), 1), (500.55, NOW(), 2);


-- 			JOINS		-- 
-- Combine Two or more tables together
-- USELESS 0. Cross Joins (NOT COMMON):
-- 		SELECT * FROM employees, salaries;
--     	SELECT * FROM employees CROSS JOIN salaries;
--     	Problems -> Repeated
-- 1. Inner Join->
-- 2. Natural-> 
-- 		NOTE-> atleast 1 same column name 
-- 		SELECT e_name FROM tabl_1 NATURAL JOIN table_2
--     	Working-> SELECT e_name FROM table_1, table_2 where table_1.emp_id= table_2.emp_id
-- 3. Conditional->
-- 4. Equi->
-- 		Example- Find the e_name who worked in a department having location same as their address
-- 		Table_1-> e_no, e_name, address	Table_2-> dep_np, location, emp_no
-- 		SELECT e_name FROM table_1, table_2 where table_1.e_no = table_2.emp_no and table_1.address = table_2.location
-- 5. Self-> 
-- 		Note->Join with the table itself Example find student in atleast 2 subject. Table contains student_name, subject_code
--      SELECT * FROM table as T1, table as T2 where T1.student_name = T2.student_name and T1.subject_code <> T2.subject_Code
-- 6. Outer- 
-- 		Left-> 	Common data and data of left table (OR) natural join + left table data
-- 				table_1-> emp_no, e_name, dept_no	table_2-> dept_no, d_name, loc
--             	SELECT emp_no, e_name, d_name, loc FROM table_1 LEFT OUTER JOIN table_2 ON (table_1.dept_no=table_2.dept_no)
-- 		Right-> Common data and data of right table (OR) natural join + right table data
-- 				table_1-> emp_no, e_name, dept_no	table_2-> dept_no, d_name, loc
--             	SELECT emp_no, e_name, d_name, loc FROM table_1 RIGHT OUTER JOIN table_2 ON (table_1.dept_no=table_2.dept_no)
--     	Full->

USE company;
SELECT first_name, email, salaries.salary FROM employees INNER JOIN salaries ON salaries.empId = employees.id;