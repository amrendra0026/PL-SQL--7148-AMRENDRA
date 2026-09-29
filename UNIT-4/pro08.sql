/*8) Write a procedure that search‟s whether the given 
employee number is present or not in the table. (Use 
both IN and OUT mode variables) and also Write a 
PL/SQL block to call the SEARCH_EMP procedure.*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE SEARCH_EMP (
    p_empno   IN NUMBER,
    p_result  OUT VARCHAR2
)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM EMP
    WHERE EMPNO = p_empno;

    IF v_count > 0 THEN
        p_result := 'Employee is present.';
    ELSE
        p_result := 'Employee is not present.';
    END IF;
END;
/

-- PL/SQL block to call SEARCH_EMP procedure

DECLARE
    v_result VARCHAR2(100);
BEGIN
    SEARCH_EMP(&empno, v_result);

    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/