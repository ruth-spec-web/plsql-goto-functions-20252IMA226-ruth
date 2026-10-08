CREATE OR REPLACE FUNCTION fn_dept_name (
    p_dept_id IN NUMBER
) RETURN VARCHAR2 IS
    v_dept_name departments.department_name%TYPE;
BEGIN
    IF p_dept_id IS NULL THEN
        RETURN 'Unknown Department';
    END IF;

    SELECT department_name
    INTO v_dept_name
    FROM departments
    WHERE department_id = p_dept_id;

    RETURN v_dept_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Unknown Department';
END fn_dept_name;
/
