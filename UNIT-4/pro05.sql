/* 5) Write a function that returns the balance for a 
given account number. (Create ACCOUNT table with 
ACNO, CNAME, BNAME, BALANCE columns using 
appropriate data types)*/

SET SERVEROUTPUT ON;

-- Create ACCOUNT table

CREATE TABLE ACCOUNT (
    ACNO NUMBER PRIMARY KEY,
    CNAME VARCHAR2(50),
    BNAME VARCHAR2(50),
    BALANCE NUMBER(10,2)
);

-- Insert sample records

INSERT INTO ACCOUNT VALUES (101, 'Aasif', 'SBI', 25000);
INSERT INTO ACCOUNT VALUES (102, 'Rahul', 'BOB', 18000);
INSERT INTO ACCOUNT VALUES (103, 'Aman', 'HDFC', 32000);

COMMIT;

-- Create function to return balance

CREATE OR REPLACE FUNCTION get_balance (
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

-- Execute the function using a PL/SQL block

DECLARE
    v_balance NUMBER;
BEGIN
    v_balance := get_balance(101);

    IF v_balance IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Balance = ' || v_balance);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Account not found.');
    END IF;
END;
/

-- Execute the function on the command line

SELECT get_balance(101) AS BALANCE
FROM DUAL;