SET SERVEROUTPUT ON;

-- Remove old tables if they already exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create departments table
CREATE TABLE departments (
    department_id   NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(50) NOT NULL
);

-- Create employees table
CREATE TABLE employees (
    employee_id     NUMBER(6) PRIMARY KEY,
    employee_name   VARCHAR2(80) NOT NULL,
    department_id   NUMBER(4),
    monthly_salary  NUMBER(10,2) NOT NULL,
    hire_date       DATE NOT NULL,
    
    CONSTRAINT fk_emp_dept
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
        
    CONSTRAINT chk_emp_salary
        CHECK (monthly_salary >= 0)
);

-- Insert departments
INSERT INTO departments VALUES (10, 'Information Technology');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'Human Resources');
INSERT INTO departments VALUES (40, 'Marketing');

-- Insert employees
INSERT INTO employees VALUES (101, 'Jade Noria', 10, 4500, DATE '2023-02-15');
INSERT INTO employees VALUES (102, 'Brian Niyonzima', 20, 5000, DATE '2020-07-01');
INSERT INTO employees VALUES (103, 'Claudine Mukamana', 30, 3000, DATE '2018-11-20');
INSERT INTO employees VALUES (104, 'David Habimana', 40, 6500, DATE '2016-01-10');
INSERT INTO employees VALUES (105, 'Eric Ishimwe', 10, 10000, DATE '2012-05-05');

COMMIT;



SELECT * FROM departments ORDER BY department_id;



SELECT * FROM employees ORDER BY employee_id;
