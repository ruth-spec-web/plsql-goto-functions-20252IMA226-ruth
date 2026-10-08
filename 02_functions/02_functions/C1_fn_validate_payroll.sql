CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_emp_id IN NUMBER
) RETURN VARCHAR2 IS
    v_salary    employees.monthly_salary%TYPE;
    v_dept_id   employees.department_id%TYPE;
BEGIN
    IF p_emp_id IS NULL THEN
        RETURN 'INVALID';
    END IF;

    SELECT monthly_salary, department_id
    INTO v_salary, v_dept_id
    FROM employees
    WHERE employee_id = p_emp_id;

    IF v_salary IS NULL OR v_salary < 1000 OR v_salary > 20000 THEN
        RETURN 'INVALID';
    END IF;

    RETURN 'VALID';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID';
END fn_validate_payroll;
/
