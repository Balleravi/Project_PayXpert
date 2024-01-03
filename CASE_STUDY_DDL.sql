CREATE DATABASE PayExpert;
USE PayExpert;

CREATE TABLE Employee(
Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
DOB DATE NOT NULL,
Gender ENUM('Male', 'Female', 'Non-Binary', 'Other') NOT NULL,
Email VARCHAR(40) UNIQUE NOT NULL,
Phone_Number VARCHAR(15) UNIQUE NOT NULL,
Address VARCHAR(250),
Position VARCHAR(200) NOT NULL,
Joining_Date DATE NOT NULL,
Termination_Date DATE DEFAULT NULL
);


INSERT INTO Employee (Employee_ID,First_Name, Last_Name, DOB, Gender, Email, Phone_Number, Address, Position, Joining_Date,Termination_Date)
VALUES 
    (1,'Teenu', 'Aswal', '2002-02-07', 2, 'aswal@example.com', '8712383822', 'Near st road Uttarakhand', 'Manager', CURDATE(),NULL),
    (2,'Anushka', 'Sharma', '2002-05-15', 2, 'shrma@example.com', '9876543210', '66 Peter Colony UttarPradesh', 'Developer', '2023-10-18',NULL),
    (3,'Usman', 'Patel', '2002-09-20', 2, 'usam@example.com', '9754777888', 'Solapur Maharastra', 'Developer', CURDATE(),NULL),
    (4,'Avinash', 'Kumar', '2002-03-12', 1, 'avi@example.com', '1112223333', 'Patna Bihar', 'Engineer', '2023-5-12',NULL),
    (5,'Danish', 'Mishra', '2002-11-28', 3, 'danish@example.com', '9998887777', 'Kanpur Uttarpradesh', 'Engineer', CURDATE(),NULL),
    (6,'Emma', 'Garcia', '2000-07-10', 2, 'emma@example.com', '4443332222', '303 Maple St', 'Manager', '2023-09-23',NULL),
    (7,'Vaney', 'Mishra', '2001-12-05', 1, 'Mishrava6@example.com', '7776665555', '404 Birch St', 'Developer', '2022-07-02','2023-01-01'),
    (8,'Okesh', 'Chabra', '1989-06-25', 2, 'Okesh53@example.com', '2223334444', '505 Walnut St', 'Designer', CURDATE(),NULL),
    (9,'Pooja', 'Rawat', '2000-04-18', 1, 'rawatpooj2@example.com', '6667778888', '606 Oakwood St', 'Analyst', '2023-02-17',NULL),
    (10,'Yash', 'Nikol', '1999-08-08', 3, 'nikol23@example.com', '1231231234', '707 Cedarwood St', 'Engineer', '2021-03-19','2023-09-28');

SELECT * FROM Employee;

CREATE TABLE Payroll(
payroll_id INT PRIMARY KEY AUTO_INCREMENT,
employee_id INT NOT NULL,
pay_period_start DATE NOT NULL,
pay_period_end DATE NOT NULL,
base_salary DECIMAL(10,2) NOT NULL,
overtime_pay DECIMAL(10,2),
deductions DECIMAL(10,2),
net_salary DECIMAL(10,2) NOT NULL,
FOREIGN KEY(employee_id)REFERENCES Employee(Employee_ID) ON DELETE CASCADE
);
INSERT INTO Payroll(employee_id,pay_period_start,pay_period_end,base_salary,overtime_pay,deductions,net_salary) VALUES
(1,'2023-03-01','2024-04-01',300000,NULL,40000,340000),
(2,'2023-03-01','2024-04-01',500000,NULL,50000,550000),
(3,'2023-03-01','2024-04-01',250000,NULL,20000,300000),
(4,'2023-03-01','2024-04-01',450000,NULL,35000,500000),
(5,'2023-03-01','2024-04-01',400000,NULL,30000,450000),
(6,'2023-03-01','2024-04-01',350000,NULL,25000,400000),
(7,'2023-03-01','2024-04-01',500000,NULL,50000,550000),
(8,'2023-03-01','2024-04-01',650000,NULL,60000,750000),
(9,'2023-03-01','2024-04-01',200000,NULL,15000,250000),
(10,'2023-03-01','2024-04-01',900000,NULL,80000,1000000)
;


CREATE TABLE Tax (
    Tax_Id INT PRIMARY KEY AUTO_INCREMENT,
    Employee_ID INT NOT NULL,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON DELETE CASCADE,
    Tax_Year VARCHAR(50),
    Taxable_Income DECIMAL(12, 2),
    Tax_Amount DECIMAL(12, 2)
);

INSERT INTO Tax (Tax_ID, Employee_ID, Tax_Year, Taxable_Income, Tax_Amount)
VALUES
    (1, 1, '2023-2024', 555000.00, 00.00),
    (2, 2, '2023-2024', 700000.00, 00.00),
    (3, 3, '2023-2024', 600000.00, 00.00),
    (4, 4, '2023-2024', 880000.00, 11000.00),
    (5, 5, '2023-2024', 655000.00, 00.00),
    (6, 6, '2023-2024', 8550000.00, 7000.00),
    (7, 7, '2023-2024', 588000.00, 00.00),
    (8, 8, '2023-2024', 720000.00, 10000.00),
    (9, 9, '2023-2024', 490000.00, 00.00),
    (10, 10, '2023-2024', 982000.00, 11500.00);
  
CREATE TABLE FinancialRecord(
RecordID INT PRIMARY KEY AUTO_INCREMENT,
EmployeeID INT NOT NULL,
RecordDate DATE NOT NULL,
Descript VARCHAR(250),
Amount DECIMAL(9,2) NOT NULL,
RecordTypE VARCHAR(250),
FOREIGN KEY(EmployeeID)REFERENCES Employee(Employee_ID) ON DELETE CASCADE
);
INSERT INTO FinancialRecord (EmployeeID, RecordDate, Descript, Amount, RecordType) VALUES
    (1, '2023-12-01', 'Sal_Income', 50000.00, 'Income'),
    (2, '2023-12-01', 'Sal_Income', 48000.50, 'Income'),
    (3, '2023-12-01', 'Sal_Income', 30000.75, 'Income'),
    (4, '2023-12-01', 'Sal_Income', 80000.00, 'Income'),
    (5, '2023-12-01', 'Sal_Income', 45000.25, 'Income'),
    (3, '2023-12-05', 'EMI_for_vehicle', 6000.00, 'Expense'),
    (4, '2023-12-05', 'Emi_for_home_loan',20000.50, 'Expense'),
    (8, '2023-12-01', 'Sal_Income', 55000.75, 'Income'),
    (6, '2023-12-01', 'Sal_Income', 40000.00, 'Income'),
    (7, '2023-12-01', 'Sal_Income', 38000.25, 'Income'),
    (9, '2023-12-01', 'Sal_Income', 50000.00, 'Income'),
    (10,'2023-12-01', 'Sal_Income', 42000.50, 'Income'),
    (2, '2023-12-05', 'Tax_deductions',5000.75, 'Tax_Payment'),
    (3, '2023-12-05', 'Tax_deductions', 2000.00, 'Tax_Payment'),
    (4, '2023-12-05', 'Tax_deductions', 12000.25, 'Tax_Payment');
    
-- GetTaxById(taxId)
SELECT * FROM Tax WHERE Tax_ID = 1;

-- GetTaxesForEmployee(employeeId)
SELECT * FROM Tax WHERE Employee_ID = 1;

-- GetTaxesForYear(taxYear)
SELECT * FROM Tax WHERE Tax_Year = '2023-2024';


    