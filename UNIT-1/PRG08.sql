/* Write a PL/SQL block which displays the gross salary of employees as per user input EID. (Consider an EMP table with EID, EName, Deptno, Deptname Gender, Age, BasicSal) with appropriate data types.) Gross_Salary: BASICSAL + (DA + HRA + Medical) – PF.
SET SERVEROUTPUT ON; */

ACCEPT P_EID NUMBER PROMPT 'Enter Employee ID: '

DECLARE
    V_NAME     EMP.ENAME%TYPE;
    V_BASIC    EMP.BASICSAL%TYPE;
    V_HRA      NUMBER;
    V_DA       NUMBER;
    V_MEDICAL  NUMBER := 500;
    V_PF       NUMBER;
    V_GROSS    NUMBER;
BEGIN
    SELECT ENAME, BASICSAL
    INTO V_NAME, V_BASIC
    FROM EMP
    WHERE EID = &P_EID;

    V_HRA := V_BASIC * 0.15;
    V_DA := V_BASIC * 0.50;
    V_PF := V_BASIC * 0.10;

    V_GROSS := V_BASIC + V_DA + V_HRA + V_MEDICAL - V_PF;

    DBMS_OUTPUT.PUT_LINE('----------------------------');
    DBMS_OUTPUT.PUT_LINE('Employee ID   : ' || &P_EID);
    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Basic Salary  : ' || V_BASIC);
    DBMS_OUTPUT.PUT_LINE('HRA           : ' || V_HRA);
    DBMS_OUTPUT.PUT_LINE('DA            : ' || V_DA);
    DBMS_OUTPUT.PUT_LINE('Medical       : ' || V_MEDICAL);
    DBMS_OUTPUT.PUT_LINE('PF            : ' || V_PF);
    DBMS_OUTPUT.PUT_LINE('Gross Salary  : ' || V_GROSS);
    DBMS_OUTPUT.PUT_LINE('----------------------------');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID Not Found.');
END;
/