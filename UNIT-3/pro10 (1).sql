-- 10) Write a PL/SQL block to trap the exception and display
-- the SQLCODE and SQLERRM.

SET SERVEROUTPUT ON;

DECLARE
    V_RESULT NUMBER;
BEGIN
    V_RESULT := 10 / 0;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SQLCODE = ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQLERRM = ' || SQLERRM);
END;
/