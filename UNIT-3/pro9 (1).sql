-- 9) Write a PL/SQL block using implicit cursor to display
-- the commission of employees. If commission is NULL,
-- raise a user-defined exception NULL_COMMISSION.

SET SERVEROUTPUT ON;

ALTER TABLE EMP ADD COMMISSION NUMBER;

UPDATE EMP
SET COMMISSION = NULL
WHERE EID = 101;

COMMIT;

DECLARE
    V_COMMISSION EMP.COMMISSION%TYPE;

    NULL_COMMISSION EXCEPTION;

BEGIN
    SELECT COMMISSION
    INTO V_COMMISSION
    FROM EMP
    WHERE EID = &EID;

    IF V_COMMISSION IS NULL THEN
        RAISE NULL_COMMISSION;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Commission = ' || V_COMMISSION);

EXCEPTION
    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE('Commission is NULL.');

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee record not found.');
END;
/