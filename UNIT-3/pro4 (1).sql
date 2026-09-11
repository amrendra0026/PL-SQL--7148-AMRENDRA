-- Q4. Write a PL/SQL block to display the salary of the employee
-- whose age is 50 using exception handling.

SET SERVEROUTPUT ON;

UPDATE EMP
SET AGE = 40
WHERE EID = 104;

COMMIT;

DECLARE
    V_NAME EMP.ENAME%TYPE;
    V_SALARY EMP.BASIC_SALARY%TYPE;
BEGIN
    SELECT ENAME, BASIC_SALARY
    INTO V_NAME, V_SALARY
    FROM EMP
    WHERE AGE = 50;

    DBMS_OUTPUT.PUT_LINE('Employee Name = ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Basic Salary = ' || V_SALARY);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee with age 50 not found.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee with age 50 found.');
END;
/