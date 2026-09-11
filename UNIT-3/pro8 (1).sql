-- 8) Write a program that explains the use of the
-- ZERO_DIVIDE exception.

SET SERVEROUTPUT ON;

DECLARE
    V_A NUMBER := 10;
    V_B NUMBER := 0;
    V_RESULT NUMBER;
BEGIN
    V_RESULT := V_A / V_B;

    DBMS_OUTPUT.PUT_LINE('Result = ' || V_RESULT);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Cannot divide by zero.');
END;
/