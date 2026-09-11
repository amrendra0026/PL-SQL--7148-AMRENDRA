-- Q5. Write a PL/SQL block using parameterized cursor and cursor
-- FOR LOOP to display the basic salary and total gross salary
-- of employees department wise.

SET SERVEROUTPUT ON;

DECLARE
    CURSOR C_EMP(P_DEPT_NO NUMBER) IS
        SELECT EID, ENAME, BASIC_SALARY
        FROM EMP
        WHERE DEPT_NO = P_DEPT_NO;

    V_HRA NUMBER;
    V_DA NUMBER;
    V_GROSS NUMBER;

BEGIN
    FOR D IN (SELECT DISTINCT DEPT_NO FROM EMP ORDER BY DEPT_NO)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Department No = ' || D.DEPT_NO);

        FOR E IN C_EMP(D.DEPT_NO)
        LOOP
            V_HRA := E.BASIC_SALARY * 0.20;
            V_DA := E.BASIC_SALARY * 0.10;
            V_GROSS := E.BASIC_SALARY + V_HRA + V_DA;

            DBMS_OUTPUT.PUT_LINE(
                'EID = ' || E.EID ||
                ', Name = ' || E.ENAME ||
                ', Basic Salary = ' || E.BASIC_SALARY ||
                ', Gross Salary = ' || V_GROSS
            );
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('----------------------');
    END LOOP;
END;
/