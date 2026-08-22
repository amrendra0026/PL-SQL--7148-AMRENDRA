/*4) Write a PL/SQL block which accepts measurement in feet and displays it in cm, inch and meter. */

SET SERVEROUTPUT ON;

DECLARE 

V_FEET NUMBER(3);
V_CM NUMBER(3);
V_INCH NUMBER(3);
V_METER NUMBER(3);

BEGIN

V_FEET := &FEET;
V_CM := V_FEET * 30.48;
V_INCH := V_FEET * 12;
V_METER := V_FEET * 0.3048;

DBMS_OUTPUT.PUT_LINE('FEET IN CM :' || V_CM);
DBMS_OUTPUT.PUT_LINE('FEET IN INCH:' || V_INCH);
DBMS_OUTPUT.PUT_LINE('FEET IN METER:' || V_METER);

END;
/