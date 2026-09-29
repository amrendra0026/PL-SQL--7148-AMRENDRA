/*4) Write a function that returns the square of the
given number. Execute the function using a separate 
PL/SQL block and on the command line.*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION square_number (
    p_num IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN p_num * p_num;
END;
/

-- Execute the function using a separate PL/SQL block

DECLARE
    v_result NUMBER;
BEGIN
    v_result := square_number(5);

    DBMS_OUTPUT.PUT_LINE('Square = ' || v_result);
END;
/

-- Execute the function on the command line

SELECT square_number(5) AS square
FROM dual;