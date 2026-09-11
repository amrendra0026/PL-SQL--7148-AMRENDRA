-- Q6. Write a PL/SQL block to explain the use of
-- NO_DATA_FOUND exception.

SET SERVEROUTPUT ON;

DECLARE
    V_NAME EMP.ENAME%TYPE;
    V_SALARY EMP.BASIC_SALARY%TYPE;
BEGIN
    SELECT ENAME, BASIC_SALARY
    INTO V_NAME, V_SALARY
    FROM EMP
    WHERE EID = &EID;

    DBMS_OUTPUT.PUT_LINE('Employee Name = ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Basic Salary = ' || V_SALARY);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee record not found.');
END;
/