SET SERVEROUTPUT ON;

DECLARE
    v_annual_sal NUMBER;
    v_years      NUMBER;
    v_tax        NUMBER;
    v_dname      VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TESTING INDIVIDUAL FUNCTIONS ---');

    -- Test Annual Salary Function
    v_annual_sal := fn_annual_salary(5000);
    DBMS_OUTPUT.PUT_LINE('Annual Salary (5000/mo): $' || v_annual_sal);

    -- Test Years of Service Function
    v_years := fn_years_of_service(TO_DATE('2020-01-15', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Years of Service (Hire Date 2020-01-15): ' || v_years || ' years');

    -- Test Calculate Tax Function
    v_tax := fn_calculate_tax(5000);
    DBMS_OUTPUT.PUT_LINE('Calculated Tax (5000/mo): $' || v_tax);

    -- Test Department Name Function
    v_dname := fn_dept_name(10);
    DBMS_OUTPUT.PUT_LINE('Department Name (ID 10): ' || v_dname);
END;
/
