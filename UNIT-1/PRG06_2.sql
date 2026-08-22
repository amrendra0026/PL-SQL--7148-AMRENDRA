/* using while loop*/

SET SERVEROUTPUT ON;

DECLARE

NUM NUMBER;
I NUMBER := 1;

BEGIN

NUM := &NUM;

WHILE I <= NUM LOOP

DBMS_OUTPUT.PUT_LINE(I);

I := I + 1;

END LOOP;

END;
/

END;
/