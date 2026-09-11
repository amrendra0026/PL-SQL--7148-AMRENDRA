-- Q6. Write a PL/SQL block using cursor and user-defined exception
-- NO_DEPT_FOUND to insert the records of a particular department
-- into the EMP_BACKUP table.

SET SERVEROUTPUT ON;

DECLARE
    CURSOR C_EMP(P_DEPT_NO NUMBER) IS
        SELECT EID, ENAME, DEPT_NO, BASIC_SALARY
        FROM EMP
        WHERE DEPT_NO = P_DEPT_NO;

    NO_DEPT_FOUND EXCEPTION;
    V_COUNT NUMBER := 0;

BEGIN
    FOR E IN C_EMP(&DEPT_NO)
    LOOP
        INSERT INTO EMP_BACKUP
        VALUES (E.EID, E.ENAME, E.DEPT_NO, E.BASIC_SALARY);

        V_COUNT := V_COUNT + 1;
    END LOOP;

    IF V_COUNT = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        V_COUNT || ' record(s) inserted into EMP_BACKUP'
    );

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employee found for the given department.'
        );
END;
/