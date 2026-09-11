-- Q3. Write a PL/SQL block to accept the employee name and
-- display the basic salary of the employee using exception handling.

SET SERVEROUTPUT ON;

DECLARE
    V_NAME VARCHAR2(50);
    V_SALARY EMP.BASIC_SALARY%TYPE;
BEGIN
    V_NAME := '&NAME';

    SELECT BASIC_SALARY
    INTO V_SALARY
    FROM EMP
    WHERE UPPER(ENAME) = UPPER(V_NAME);

    DBMS_OUTPUT.PUT_LINE('Employee Name = ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Basic Salary = ' || V_SALARY);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee record not found.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee found.');
END;
/