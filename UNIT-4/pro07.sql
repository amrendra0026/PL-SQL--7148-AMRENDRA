/* 7) Write a simple procedure that increases the salary 
of employees for the given department not by 
percentage inputted by the user using the IN 
parameter. */

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE update_emp
IS
BEGIN
    UPDATE EMP
    SET SAL = SAL + 1000
    WHERE DEPTNO = 10;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Employee salary updated successfully.');
END;
/

-- Call the procedure

BEGIN
    update_emp;
END;
/