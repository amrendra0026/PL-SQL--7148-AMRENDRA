/*1) Write a simple procedure without any parameter  
that shows a user defined message on the screen. Call  
the procedure using a separate PL/SQL block and on  
the command line. code alah alag mat dena ek sath denaaa */

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE show_message IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello! This is a user-defined message.');
END;
/

BEGIN
    show_message;
END;
/

EXEC show_message;