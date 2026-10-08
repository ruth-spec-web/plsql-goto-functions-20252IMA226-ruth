SET SERVEROUTPUT ON;

DECLARE
    v_status VARCHAR2(20);
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TESTING PAYROLL VALIDATION FUNCTION ---');

    -- Test Valid Employee
    v_status := fn_validate_payroll(101);
    DBMS_OUTPUT.PUT_LINE('Employee 101 Payroll Status: ' || v_status);

    -- Test Non-Existent Employee
    v_status := fn_validate_payroll(999);
    DBMS_OUTPUT.PUT_LINE('Employee 999 Payroll Status: ' || v_status);
END;
/
