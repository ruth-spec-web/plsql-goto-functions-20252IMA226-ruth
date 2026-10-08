SET SERVEROUTPUT ON;

DECLARE
    v_emp_id     employees.employee_id%TYPE := &input_emp_id;
    v_emp_name   employees.employee_name%TYPE;
    v_salary     employees.monthly_salary%TYPE;
BEGIN
    SELECT employee_name, monthly_salary
    INTO v_emp_name, v_salary
    FROM employees
    WHERE employee_id = v_emp_id;

    IF v_salary >= 7000 THEN
        GOTO high_salary;
    ELSIF v_salary >= 4000 THEN
        GOTO medium_salary;
    ELSE
        GOTO low_salary;
    END IF;

    <<high_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_emp_name || ' | Salary: $' || v_salary || ' | Category: HIGH SALARY');
    GOTO end_label;

    <<medium_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_emp_name || ' | Salary: $' || v_salary || ' | Category: MEDIUM SALARY');
    GOTO end_label;

    <<low_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_emp_name || ' | Salary: $' || v_salary || ' | Category: LOW SALARY');
    GOTO end_label;

    <<end_label>>
    DBMS_OUTPUT.PUT_LINE('Salary Review Complete.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || v_emp_id || ' does not exist.');
END;
/
