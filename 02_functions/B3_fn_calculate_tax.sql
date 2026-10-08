CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_monthly_salary IN NUMBER
) RETURN NUMBER IS
    v_annual_salary NUMBER;
    v_tax           NUMBER := 0;
BEGIN
    IF p_monthly_salary IS NULL OR p_monthly_salary <= 0 THEN
        RETURN 0;
    END IF;

    v_annual_salary := p_monthly_salary * 12;

    IF v_annual_salary <= 30000 THEN
        v_tax := v_annual_salary * 0.10;
    ELSIF v_annual_salary <= 60000 THEN
        v_tax := (30000 * 0.10) + ((v_annual_salary - 30000) * 0.18);
    ELSE
        v_tax := (30000 * 0.10) + (30000 * 0.18) + ((v_annual_salary - 60000) * 0.25);
    END IF;

    RETURN ROUND(v_tax, 2);
END fn_calculate_tax;
/
