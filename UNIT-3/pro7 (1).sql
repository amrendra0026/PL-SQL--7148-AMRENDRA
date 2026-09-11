-- 7) Write a program that explains the use of the
-- INVALID_NUMBER exception.

SET SERVEROUTPUT ON;

DECLARE
    V_NUM NUMBER;
BEGIN
    SELECT TO_NUMBER('ABC')
    INTO V_NUM
    FROM DUAL;

    DBMS_OUTPUT.PUT_LINE('Number = ' || V_NUM);

EXCEPTION
    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE('INVALID_NUMBER exception occurred.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/