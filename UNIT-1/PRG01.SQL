/* PROG1 - Write a PL/SQL block that calculates the simple interest based on the given principal amount, rate of interest and number of years. */


SET SERVEROUTPUT ON;

DECLARE 
 
V_PRINCIPAL_AMT NUMBER;
V_INTEREST NUMBER;
V_YEARS NUMBER;
SI NUMBER;

BEGIN

V_PRINCIPAL_AMT := 400000;
V_INTEREST := 4;
V_YEARS := 1;
SI := (V_PRINCIPAL_AMT* V_INTEREST* V_YEARS)/100;

DBMS_OUTPUT.PUT_LINE('SIMPLE INTEREST = RS '|| SI);

END;
/ 