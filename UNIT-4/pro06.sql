/* 6) Write a simple procedure without any parameter 
that updates the values in the EMP table.*/

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