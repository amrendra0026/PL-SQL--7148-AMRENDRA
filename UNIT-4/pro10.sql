/*10) Write a function that returns the balance for a 
given account number.*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION GET_BALANCE (
    p_acno IN NUMBER
)
RETURN NUMBER
IS
    v_balance NUMBER;
BEGIN
    SELECT BALANCE
    INTO v_balance
    FROM ACCOUNT
    WHERE ACNO = p_acno;

    RETURN v_balance;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

-- Execute the function using a separate PL/SQL block

DECLARE
    v_balance NUMBER;
BEGIN
    v_balance := GET_BALANCE(101);

    IF v_balance IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Balance = ' || v_balance);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Account not found.');
    END IF;
END;
/

-- Execute the function on the command line

SELECT GET_BALANCE(101) AS BALANCE
FROM DUAL;