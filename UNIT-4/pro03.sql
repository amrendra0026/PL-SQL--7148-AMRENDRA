/*3) Write a procedure that searches whether the given 
employee id is present or not in the table. If an 
employee is found then show its name otherwise raise 
appropriate error messages (Use both IN and OUT 
mode variables) and also write a PL/SQL block to call 
the procedure.*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE search_employee (
    p_emp_id   IN NUMBER,
    p_emp_name OUT VARCHAR2
)
IS
BEGIN
    SELECT name
    INTO p_emp_name
    FROM employees
    WHERE employee_id = p_emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee Found');
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || p_emp_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_emp_name := NULL;
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID not found.');

    WHEN OTHERS THEN
        p_emp_name := NULL;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

DECLARE
    v_emp_name VARCHAR2(100);
BEGIN
    search_employee(&employee_id, v_emp_name);

    IF v_emp_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Returned Employee Name: ' || v_emp_name);
    END IF;
END;
/