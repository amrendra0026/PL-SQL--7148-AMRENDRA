/*(9) Write a function that returns the square of the 
given number. Execute this function using a separate 
PL/SQL block and also without using PL/SQL block on 
the command line.*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION SQUARE_NUMBER (
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
    v_result := SQUARE_NUMBER(5);

    DBMS_OUTPUT.PUT_LINE('Square = ' || v_result);
END;
/

-- Execute the function without using PL/SQL block on the command line

SELECT SQUARE_NUMBER(5) AS SQUARE
FROM DUAL;