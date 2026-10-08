 SET SERVEROUTPUT ON;

-- ===================================================
-- PART 1: ILLEGAL GOTO DEMONSTRATION (COMMENTED OUT)
-- PL/SQL does NOT allow a GOTO statement to jump 
-- inside an IF block from outside of it.
-- Attempting to run the code below produces:
-- PLS-00375: illegal GOTO statement; this GOTO cannot transfer control to label
-- ===================================================

/*
DECLARE
    v_flag BOOLEAN := TRUE;
BEGIN
    GOTO inside_if_label; -- ILLEGAL: Jumping into an IF block from outside

    IF v_flag THEN
        <<inside_if_label>>
        DBMS_OUTPUT.PUT_LINE('Inside IF block');
    END IF;
END;
/
*/

-- ===================================================
-- PART 2: CORRECTED VERSION
-- Refactored to eliminate the illegal jump by structuring 
-- control flow legally within the block.
-- ===================================================

DECLARE
    v_flag BOOLEAN := TRUE;
BEGIN
    IF v_flag THEN
        GOTO inside_if_label;
        
        <<inside_if_label>>
        DBMS_OUTPUT.PUT_LINE('Successfully executed legally inside IF block.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Program execution finished.');
END;
/
