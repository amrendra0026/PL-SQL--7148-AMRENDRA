/*  Write a program to generate the numbers using LOOP, FOR LOOP and WHILE LOOP up to the number inputted by the user.*/

SET SERVEROUTPUT ON;

DECLARE 

NUM NUMBER;
I   NUMBER  := 1;

BEGIN 

NUM := &NUM;

LOOP 

DBMS_OUTPUT.PUT_LINE(I);

I := I+1;

EXIT WHEN I>NUM;

END LOOP;

END;
/