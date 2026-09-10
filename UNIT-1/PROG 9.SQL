-- Write a PL/SQL block which displays all records of 
--Male employees working in the HR Dept from the EMP 
--table.




SET SERVEROUTPUT ON;

DECLARE 

  CURSOR C_EMP IS
  SELECT * FROM EMP WHERE DEPTNAME = 'HR' AND GENDER = 'M';


BEGIN 

FOR R IN C_EMP 

LOOP 

  DBMS_OUTPUT.PUT_LINE('EID :' || R.EID || 'ENAME:' || R.ENAME || 'DEPTNO:' || R.DEPTNO ||'DEPTNAME:' ||R.DEPTNAME ||'GENDER:' || R.GENDER || 'AGE:' || R.AGE || 'BASICSAL:' || R.BASICSAL);

  END LOOP;

  END;
  /
