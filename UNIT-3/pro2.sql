-- Q2. Write a PL/SQL block to accept the student name and
-- display the result from the RESULT table using exception handling.

SET SERVEROUTPUT ON;

DECLARE
    V_NAME VARCHAR2(50);
    V_ROLLNO RESULT.ROLLNO%TYPE;
    V_M1 RESULT.M1%TYPE;
    V_M2 RESULT.M2%TYPE;
    V_M3 RESULT.M3%TYPE;
BEGIN
    V_NAME := '&NAME';

    SELECT ROLLNO, M1, M2, M3
    INTO V_ROLLNO, V_M1, V_M2, V_M3
    FROM RESULT
    WHERE UPPER(NAME) = UPPER(V_NAME);

    DBMS_OUTPUT.PUT_LINE('Roll No = ' || V_ROLLNO);
    DBMS_OUTPUT.PUT_LINE('Name = ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Marks 1 = ' || V_M1);
    DBMS_OUTPUT.PUT_LINE('Marks 2 = ' || V_M2);
    DBMS_OUTPUT.PUT_LINE('Marks 3 = ' || V_M3);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student record not found.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one student found.');
END;
/