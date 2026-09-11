-- Q1. Write a PL/SQL block that explains the use of the
-- ZERO_DIVIDE exception.

SET SERVEROUTPUT ON;

DECLARE
    A NUMBER := 10;
    B NUMBER := 0;
    C NUMBER;
BEGIN
    C := A / B;

    DBMS_OUTPUT.PUT_LINE('Result = ' || C);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Cannot divide by zero.');
END;
/