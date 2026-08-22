/* Write a PL/SQL block to calculate the total, percentage and grade of student based on his/her Rollno from the RESULT table. (Create RESULT table with Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Total, Per, Grade attributes with appropriate data type).  */

CREATE TABLE RESULT(
    ROLL_NO NUMBER PRIMARY KEY,
    NAME VARCHAR2(15),
    SUB1 NUMBER,
    SUB2 NUMBER,
    SUB3 NUMBER,
    SUB4 NUMBER,
    SUB5 NUMBER,
    TOTAL NUMBER,
    PER NUMBER,
    GRADE VARCHAR2(3)
);

-- INSERT INTO RESULT 
-- VALUES(101,'GAUTAM',80,75,90,85,70,NULL,NULL,NULL);

SET SERVEROUTPUT ON;

DECLARE 

V_ROLLNO RESULT.ROLL_NO%TYPE;
V_TOTAL NUMBER;
V_PER NUMBER;
V_GRADE VARCHAR2(2);

BEGIN

V_ROLLNO := &ROLLNO;

SELECT SUB1+SUB2+SUB3+SUB4+SUB5 INTO  V_TOTAL FROM RESULT WHERE ROLL_NO = V_ROLLNO;

V_PER := V_TOTAL/5;

IF V_PER >= 80 THEN
      V_GRADE := 'A';
   ELSIF V_PER >= 60 THEN
      V_GRADE := 'B';
   ELSIF V_PER >= 40 THEN
      V_GRADE := 'C';
   ELSE
      V_GRADE := 'F';
   END IF;

   UPDATE RESULT SET TOTAL = V_TOTAL,PER = V_PER,GRADE = V_GRADE WHERE ROLL_NO = V_ROLLNO;

   DBMS_OUTPUT.PUT_LINE('TOTAL = ' || V_TOTAL);
   DBMS_OUTPUT.PUT_LINE('PERCENTAGE = ' || V_PER);
   DBMS_OUTPUT.PUT_LINE('GRADE = ' || V_GRADE);

   END;
   /