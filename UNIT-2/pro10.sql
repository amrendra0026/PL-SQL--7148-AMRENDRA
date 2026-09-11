-- Q10. Write a PL/SQL block to perform an update operation
-- on the EMPLOYEE table using an implicit cursor.

SET SERVEROUTPUT ON;

BEGIN
    UPDATE EMPLOYEE
    SET SALARY = SALARY + 1000;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' record(s) updated successfully');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No record found');
    END IF;

    COMMIT;
END;
/