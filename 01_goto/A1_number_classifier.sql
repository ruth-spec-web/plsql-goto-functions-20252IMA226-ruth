SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := &input_number;
BEGIN
    IF v_number > 0 THEN
        GOTO pos_label;
    ELSIF v_number < 0 THEN
        GOTO neg_label;
    ELSE
        GOTO zero_label;
    END IF;

    <<pos_label>>
    DBMS_OUTPUT.PUT_LINE('The number ' || v_number || ' is POSITIVE.');
    GOTO end_label;

    <<neg_label>>
    DBMS_OUTPUT.PUT_LINE('The number ' || v_number || ' is NEGATIVE.');
    GOTO end_label;

    <<zero_label>>
    DBMS_OUTPUT.PUT_LINE('The number is ZERO.');
    GOTO end_label;

    <<end_label>>
    DBMS_OUTPUT.PUT_LINE('Classification Complete.');
END;
/
