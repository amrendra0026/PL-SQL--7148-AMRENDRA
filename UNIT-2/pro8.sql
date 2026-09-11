-- Q8. Write a PL/SQL block to display data with the use of
-- LIKE operator using cursor FOR LOOP.

SET SERVEROUTPUT ON;

BEGIN
    FOR R IN
    (
        SELECT ID, NAME, ADDRESS
        FROM CUSTOMER
        WHERE NAME LIKE 'A%'
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('ID = ' || R.ID);
        DBMS_OUTPUT.PUT_LINE('NAME = ' || R.NAME);
        DBMS_OUTPUT.PUT_LINE('ADDRESS = ' || R.ADDRESS);
    END LOOP;
END;
/