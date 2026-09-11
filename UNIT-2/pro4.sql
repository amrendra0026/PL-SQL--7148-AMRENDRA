-- Q4. Write a PL/SQL block to display the top three highest
-- paid employees using cursor FOR LOOP.

SET SERVEROUTPUT ON;

BEGIN
    FOR R IN
    (
        SELECT EID, ENAME, BASIC_SALARY
        FROM EMP
        ORDER BY BASIC_SALARY DESC
    )
    LOOP
        EXIT WHEN ROWNUM > 3;

        DBMS_OUTPUT.PUT_LINE(
            'EID = ' || R.EID ||
            ', Name = ' || R.ENAME ||
            ', Salary = ' || R.BASIC_SALARY
        );
    END LOOP;
END;
/