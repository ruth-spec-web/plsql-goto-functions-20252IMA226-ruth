SET LINESIZE 200;
SET PAGESIZE 50;

COLUMN employee_id FORMAT 9999 HEADING "ID";
COLUMN employee_name FORMAT A20 HEADING "Employee Name";
COLUMN department_name FORMAT A20 HEADING "Department";
COLUMN monthly_salary FORMAT $99,990.00 HEADING "Monthly";
COLUMN annual_salary FORMAT $999,990.00 HEADING "Annual Salary";
COLUMN years_worked FORMAT 99 HEADING "Years";
COLUMN tax_amount FORMAT $999,990.00 HEADING "Est. Tax";

SELECT 
    e.employee_id,
    e.employee_name,
    fn_dept_name(e.department_id) AS department_name,
    e.monthly_salary,
    fn_annual_salary(e.monthly_salary) AS annual_salary,
    fn_years_of_service(e.hire_date) AS years_worked,
    fn_calculate_tax(e.monthly_salary) AS tax_amount
FROM employees e
ORDER BY e.employee_id;
