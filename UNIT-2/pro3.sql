-- Q3. Write a PL/SQL block to display the first five employees
-- having the highest salary using the %ROWCOUNT cursor attribute.

SET SERVEROUTPUT ON;

DECLARE
    CURSOR C_EMP IS
        SELECT EID, ENAME, BASIC_SALARY
        FROM EMP
        ORDER BY BASIC_SALARY DESC;

    V_EID EMP.EID%TYPE;
    V_NAME EMP.ENAME%TYPE;
    V_SALARY EMP.BASIC_SALARY%TYPE;

BEGIN
    OPEN C_EMP;

    LOOP
        FETCH C_EMP INTO V_EID, V_NAME, V_SALARY;

        EXIT WHEN C_EMP%NOTFOUND OR C_EMP%ROWCOUNT > 5;

        DBMS_OUTPUT.PUT_LINE(
            V_EID || '  ' || V_NAME || '  ' || V_SALARY
        );
    END LOOP;

    CLOSE C_EMP;
END;
/