SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := &input_number;
BEGIN
    IF v_number > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number ' || v_number || ' is POSITIVE.');
    ELSIF v_number < 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number ' || v_number || ' is NEGATIVE.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number is ZERO.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Classification Complete.');
END;
/
