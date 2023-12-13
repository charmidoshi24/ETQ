--ETIQUA Assessment--


--DROP TABLES--
DROP TABLE etq_Customer;
DROP TABLE etq_product_Rent;
DROP TABLE etq_product_book;
DROP TABLE etq_cust_card;


--CREATE TABLES--
--v_ : Varchar type Variable
--n_ : Number type Variable
--d_ : Date type Variable

CREATE TABLE etq_Customer(
  n_customerID NUMBER,
  v_name VARCHAR2(40),
  n_custAddress VARCHAR2(50),
  n_phone NUMBER(9),
  v_password VARCHAR2(20),
  v_userName VARCHAR2(10),
  d_dateSignUp DATE,
  n_cardID NUMBER,
  CONSTRAINT PK_etq_Customer PRIMARY KEY (n_customerID));

CREATE INDEX fidx_name ON etq_Customer (UPPER(v_name));

CREATE TABLE etq_product_Rent(
  n_cardID NUMBER,
  v_itemID VARCHAR2(6),
  d_startdate DATE,
  d_returnDate DATE,
  CONSTRAINT pk_etq_product_rent PRIMARY KEY (n_cardID,v_itemID));
 
CREATE TABLE etq_product_book(
  v_title VARCHAR2(400),
  v_bookID VARCHAR2(6),
  v_state VARCHAR2(10),
  v_avalability VARCHAR2(1) CHECK ((v_avalability = 'A') OR (v_avalability = 'O')),
  n_debCost NUMBER(10,2),
  n_lostCost NUMBER(10,2),
  v_address VARCHAR2(50),
  CONSTRAINT pk_etq_product_book PRIMARY KEY (v_bookID));

CREATE BITMAP INDEX bidx_avalability ON etq_product_book (v_avalability); -- BITMAP INDEX CREATION

CREATE TABLE etq_cust_card(
  n_cardID NUMBER,
  v_status VARCHAR2(1) CHECK ((v_status = 'A') OR (v_status = 'I')),
  n_fines NUMBER,
  CONSTRAINT PK_etq_cust_card PRIMARY KEY (n_cardID));


--SELECT--
SELECT * FROM etq_Customer;
SELECT * FROM etq_cust_card;
SELECT * FROM etq_product_book;
SELECT * FROM etq_product_Rent;

--FOREIGN KEYS--
ALTER TABLE etq_Customer
ADD CONSTRAINT FK_etq_Customer
FOREIGN KEY (n_cardID)
REFERENCES etq_cust_card(n_cardID);

ALTER TABLE etq_product_Rent
ADD CONSTRAINT FK_etq_product_Rent_1
FOREIGN KEY (n_cardID)
REFERENCES etq_cust_card(n_cardID);

ALTER TABLE etq_product_Rent
ADD CONSTRAINT FK_etq_product_Rent_2
FOREIGN KEY (v_itemID)
REFERENCES etq_product_book(v_bookID);


--INSERTS--
ALTER SESSION SET NLS_DATE_FORMAT = 'dd-MM-yyyy';

INSERT INTO etq_cust_card VALUES (1101,'A',0);
INSERT INTO etq_cust_card VALUES (1102,'A',0);
INSERT INTO etq_cust_card VALUES (1103,'A',0);
INSERT INTO etq_cust_card VALUES (1104,'A',0);
INSERT INTO etq_cust_card VALUES (1105,'A',0);
INSERT INTO etq_cust_card VALUES (1106,'A',0);
INSERT INTO etq_cust_card VALUES (1107,'I',50);
INSERT INTO etq_cust_card VALUES (1108,'I',10);
INSERT INTO etq_cust_card VALUES (1109,'I',25.5);
INSERT INTO etq_cust_card VALUES (1110,'I',15.25);
INSERT INTO etq_cust_card VALUES (1151,'A',0);
INSERT INTO etq_cust_card VALUES (1152,'A',0);
INSERT INTO etq_cust_card VALUES (1153,'A',0);
INSERT INTO etq_cust_card VALUES (1154,'A',0);
INSERT INTO etq_cust_card VALUES (1155,'A',0);

INSERT INTO etq_Customer VALUES (1, 'PRIYA', 'KL', 123441234, 'PRIYA11', '12al1', '10-05-1992', 1101);
INSERT INTO etq_Customer VALUES (2, 'RAMA', 'BANGSAR', 123441235, 'RAMA11', 'j12a2', '10-05-1992', 1102);
INSERT INTO etq_Customer VALUES (3, 'GEORGE', 'NEW CITY', 123441366, 'GEORGE11', 'g123', '21-06-1992', 1103);
INSERT INTO etq_Customer VALUES (4, 'MANI', 'MELAKA.', 123441377, 'MANI11', 'to12m4', '05-12-1992', 1104);
INSERT INTO etq_Customer VALUES (5, 'PETER', 'SEREMBAN', 123412388, 'PETER11', '12pe5', '09-08-1991', 1105);
INSERT INTO etq_Customer VALUES (6, 'JENNY', 'IPOH', 112344299, 'JENNY11', '12e6', '30-04-1991', 1106);
INSERT INTO etq_Customer VALUES (7, 'ROSELYNE', 'PD', 112344310, 'ROSELYNE11', 'r12o7', '08-02-1991', 1107);
INSERT INTO etq_Customer VALUES (8, 'MONIKA', 'RAWANG', 123134433, 'MONIKA11', 'm12o8', '15-01-1991', 1108);
INSERT INTO etq_Customer VALUES (9, 'PHE', 'LANGKAWI', 121234222, 'PHE11', 'pho129', '05-03-1991', 1109);
INSERT INTO etq_Customer VALUES (10, 'JAMES', 'PJ', 111234411, 'JAMES11', '12JAMES', '10-09-1991', 1110);

INSERT INTO etq_product_book VALUES ('Wanderlove', 'V1CH16', 'GOOD', 'A', 5, 20, 'ARCHEOLOGY ROAD');
INSERT INTO etq_product_book VALUES ('Incarnate', 'B2A123', 'NEW', 'O', 6, 30, 'ARCHEOLOGY ROAD');
INSERT INTO etq_product_book VALUES ('Shiver', 'B1B234', 'NEW', 'A', 2, 15, 'CHEMISTRY ROAD');
INSERT INTO etq_product_book VALUES ('Roomies', 'B1C321', 'BAD', 'A', 1, 10, 'PHYSICS ROAD');
INSERT INTO etq_product_book VALUES ('Boomerang', 'V1DI00', 'GOOD', 'A', 3, 15, 'CHEMISTRY ROAD');
INSERT INTO etq_product_book VALUES ('Hunted', 'B1Z123', 'GOOD', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO etq_product_book VALUES ('Captivate', 'B1L321', 'NEW', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO etq_product_book VALUES ('Winter1', 'V1JA15', 'USED', 'A', 2, 12, 'CHEMISTRY ROAD');

INSERT INTO etq_product_Rent VALUES (1101, 'B2A123', '10-05-2023', '20-05-2023');
INSERT INTO etq_product_Rent VALUES (1102, 'B1Z123', '10-05-2023', '25-05-2023');
INSERT INTO etq_product_Rent VALUES (1104, 'V1JA15', '01-05-2023', '21-05-2023');
INSERT INTO etq_product_Rent VALUES (1105, 'V1DI00', '02-05-2023', '25-05-2023');
INSERT INTO etq_product_Rent VALUES (1154, 'B1L321', '04-05-2023', '26-05-2023');
INSERT INTO etq_product_Rent VALUES (1155, 'V1CH16', '29-04-2023', '29-05-2023');

COMMIT;
-----------------------------------------------------------------------------------------------------------------------

--FUNCTIONS/Procedures--
--BPC - Backend Procedure Call
--BFN - BAckend Function Call

--1-- USER DEFINED EXCEPTION---
--CUSTOMER--
CREATE OR REPLACE PROCEDURE bpc_customer_login(p_user IN VARCHAR2, p_pass IN VARCHAR2) IS
  v_pass etq_Customer.v_password%TYPE;
  e_incorrect_password EXCEPTION;
BEGIN
  
  SELECT NVL(v_password,0) INTO v_pass
  FROM etq_Customer
  WHERE v_userName = p_user;
  
  IF v_pass LIKE NVL(p_pass,1) THEN
    DBMS_OUTPUT.PUT_LINE('User ' || p_user || 'has logged in succesfully');
  ELSE
    RAISE e_incorrect_password;
  END IF;
  
  EXCEPTION
  WHEN no_data_found OR e_incorrect_password THEN 
       DBMS_OUTPUT.PUT_LINE('Incorrect username or password');
                                   
END;
/
----------------------------------------------
--use of '&' Help to PREVENT SQL INJECTION
SET SERVEROUTPUT ON;
DECLARE
  v_user etq_Customer.v_userName%TYPE;
  v_pass etq_Customer.v_password%TYPE;
BEGIN
  v_user := &Username;--12al1  
  v_pass := &Password;--PRIYA11
  bpc_customer_login(v_user,v_pass);
END;
----------------------------------------------------------------------------
-----------------------------------------------------------------------------
----------------------------------------------------------------------------
--2--
CREATE OR REPLACE PROCEDURE bpc_view_product(p_item_id IN VARCHAR2) IS
  iv_Title VARCHAR2(50);
  in_Year NUMBER;
  iv_State VARCHAR2(10);
  in_debCost NUMBER(10,2);
  in_lostCost NUMBER(10,2);
  iv_address VARCHAR2(50);
  iv_avalability VARCHAR2(1);
  n_Book NUMBER;
BEGIN
  
  SELECT COUNT(*) INTO n_Book
  FROM etq_product_book
  WHERE v_bookID = p_item_id;
  
  IF n_Book > 0 THEN
    SELECT  v_Title,v_state, v_avalability, n_debCost, n_lostCost, v_address
    INTO iv_Title,iv_state, iv_avalability, in_debCost, in_lostCost, iv_address
    FROM etq_product_book
    WHERE v_bookID LIKE p_item_id;
  
    DBMS_OUTPUT.PUT_LINE('BOOK ' || p_item_id || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TITLE: ' || iv_Title);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || iv_state);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || iv_avalability);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || in_debCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || in_lostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || iv_address);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
   ELSE
    DBMS_OUTPUT.PUT_LINE('Book Is Not Available');
  END IF;
END;
/
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  ItemID VARCHAR2(10);
BEGIN
  ItemID := &Item_ID; ---V1CH16
  bpc_view_product(ItemID);
END;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--3--
CREATE OR REPLACE PROCEDURE bpc_rent_Item(p_cardID IN NUMBER, p_itemID IN VARCHAR2, p_returnDate IN DATE) IS
  iv_status VARCHAR2(1);
  iv_avalability VARCHAR2(1);
BEGIN
  
  SELECT v_status INTO iv_status
  FROM etq_cust_card
  WHERE n_cardID LIKE p_cardID;
  
  IF iv_status = 'A' THEN
      SELECT v_avalability INTO iv_avalability
      FROM etq_product_book
      WHERE v_bookID LIKE p_itemID;
      
      IF iv_avalability = 'A' THEN
        UPDATE etq_product_book
        SET v_avalability = 'O'
        WHERE v_bookID LIKE p_itemID; 
              
        INSERT INTO etq_product_Rent
        VALUES (p_cardID,p_itemID,sysdate,p_returnDate);
        DBMS_OUTPUT.PUT_LINE('Item ' || p_itemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented');
      END IF;     
  ELSE
    DBMS_OUTPUT.PUT_LINE('The user is blocked');
  END IF;
  COMMIT;
END;
/
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  Card NUMBER;
  ItemID VARCHAR2(10);
  retDate DATE;
BEGIN
  Card := &Card_ID;
  ItemID := &ID_Item;
  retDate := &Return_date;
  bpc_rent_Item(Card,ItemID,retDate);
END;
----------------------------------------------------------------------------
SELECT * FROM customer;
SELECT * FROM rent;
SELECT * FROM card;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--4--
CREATE OR REPLACE FUNCTION bfn_pay_Fine(p_cardID IN etq_cust_card.n_cardID%TYPE, p_money IN NUMBER) RETURN NUMBER IS
  in_fines NUMBER;
  in_total NUMBER;
BEGIN
  SELECT n_fines INTO in_fines
  FROM etq_cust_card
  WHERE n_cardID LIKE p_cardID;
  
  IF in_fines <= p_money THEN
    in_total := p_money - in_fines;
    DBMS_OUTPUT.PUT_LINE('YOU HACE PAID ALL YOUR FINES AND YOU HAVE ' || in_total || ' MONEY BACK');
    
    UPDATE etq_cust_card
    SET v_status = 'A', n_fines = 0
    WHERE n_cardID = p_cardID; 
    COMMIT;
    RETURN in_total;
  ELSE
    in_total := in_fines - p_money;
    DBMS_OUTPUT.PUT_LINE('YOU WILL NEED TO PAY ' || in_total || ' MORE RINGIT TO UNLOCK YOUR CARD');
    
    UPDATE etq_cust_card
    SET n_fines = in_total
    WHERE n_cardID = p_cardID;   
	COMMIT;	
    RETURN in_total;
  END IF;
END;
/
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
    l_RetVal     NUMBER;
    l_P_CARDID   NUMBER;
    l_P_MONEY    NUMBER;
BEGIN
    l_P_CARDID := 1101;
    l_P_MONEY := 100;
    l_RetVal :=BFN_PAY_FINE (P_CARDID => l_P_CARDID, P_MONEY => l_P_MONEY);
     :1 := l_RetVal;
     DBMS_OUTPUT.PUT_LINE('RET MONEY-->'||l_RetVal);
END;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--5-- TRANSACTION MANAGEMENT USING PRAGMA AUTONOMOUS_TRANSACTION COMMIT and ROLLBACK
CREATE OR REPLACE PROCEDURE BPC_add_update_Customer(p_customerID IN NUMBER, p_name IN VARCHAR2, 
p_custAddress IN VARCHAR2, p_phone IN NUMBER, p_password IN VARCHAR2, p_userName IN VARCHAR2, p_cardID IN NUMBER) IS 
pragma autonomous_transaction;
BEGIN
   MERGE INTO etq_Customer d
    USING (select p_customerID, p_name,p_custAddress,p_phone,p_password,p_userName,p_cardID from dual) s
    ON (d.n_customerID = s.p_customerID)
    WHEN MATCHED THEN
      UPDATE SET d.v_name = s.p_name,
                d.n_custAddress = s.p_custAddress,
                d.n_phone = s.p_phone,
                d.v_password = s.p_password,
                d.v_userName = s.p_userName,
                d.n_cardID = s.p_cardID
    WHEN NOT MATCHED THEN
      INSERT (d.n_customerID ,d.v_name,d.n_custAddress,d.n_phone ,d.v_password ,d.v_userName,d.d_dateSignUp,d.n_cardID)
      VALUES (s.p_customerID ,s.p_name,s.p_custAddress,s.p_phone ,s.p_password ,s.p_userName,SYSDATE,s.p_cardID);
      COMMIT;
EXCEPTION
WHEN OTHERS THEN
    NULL;
    ROLLBACK;
END;
/
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  au_CustomerId NUMBER;
  au_Name VARCHAR2(20);
  au_CustomerAddress VARCHAR2(20);
  au_Phone NUMBER;
  au_Pass VARCHAR2(20);
  au_UserName VARCHAR2(20);
  au_CardNumber NUMBER;
BEGIN
  au_CustomerId := &Customer_ID;
  au_Name := &Name;
  au_CustomerAddress := &Address;
  au_Phone := &Phone;
  au_Pass := &Password;
  au_UserName := &User_Name;
  au_CardNumber := &Card_Numeber;
  BPC_add_update_Customer(au_CustomerId,au_Name,au_CustomerAddress,au_Phone,au_Pass,au_UserName,au_CardNumber);
END;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--6--
--CUSTOMER--
CREATE OR REPLACE TRIGGER trg_add_Card_Cust AFTER INSERT ON etq_Customer FOR EACH ROW DECLARE BEGIN
  INSERT INTO etq_cust_card
  VALUES (:new.n_cardID,'A',0);
  
  DBMS_OUTPUT.PUT_LINE('Card created');
END;
----------------------------------------------------------------------------
--EXAMPLE--
INSERT INTO etq_Customer
VALUES (1112,'MARI CARMEN','CORDOBA',645892456,'maricarmen123','ma11',SYSDATE,112);
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--7--
CREATE OR REPLACE PROCEDURE BPC_ALL_PRODUCTS IS 
  CURSOR cur_Available_Books
  IS
    SELECT *
    FROM etq_product_book WHERE v_avalability = 'A'; -- use of Bitmap index for faster extraction  
  CURSOR cur_out_on_rent_Books
  IS
    SELECT *
    FROM etq_product_book WHERE v_avalability = 'O';
    
    TYPE t_book_info IS TABLE OF etq_product_book%ROWTYPE;  
    l_book_info   t_book_info;
    
BEGIN
    OPEN cur_Available_Books;
    FETCH cur_Available_Books BULK COLLECT INTO l_book_info;
    CLOSE cur_Available_Books;
    
    DBMS_OUTPUT.PUT_LINE('Available Books');
    DBMS_OUTPUT.PUT_LINE('TITLE     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
       
    FOR i IN 1 .. l_book_info.COUNT
    LOOP
    DBMS_OUTPUT.PUT_LINE (l_book_info (i).v_title|| '     ' ||
    l_book_info (i).v_bookID|| '     ' ||
    l_book_info (i).v_state|| '     ' ||
    l_book_info (i).v_avalability|| '     ' ||
    l_book_info (i).n_debCost|| '     ' ||
    l_book_info (i).n_lostCost|| '     ' ||  
    l_book_info (i).v_address);
    END LOOP;

    OPEN cur_out_on_rent_Books;
    FETCH cur_out_on_rent_Books BULK COLLECT INTO l_book_info; --BULK COLLECT
    CLOSE cur_out_on_rent_Books;
    
    DBMS_OUTPUT.PUT_LINE('Out on Rent Books');
    DBMS_OUTPUT.PUT_LINE('TITLE     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
       
    FOR i IN 1 .. l_book_info.COUNT
    LOOP
    DBMS_OUTPUT.PUT_LINE (l_book_info (i).v_title|| '     ' ||
    l_book_info (i).v_bookID|| '     ' ||
    l_book_info (i).v_state|| '     ' ||
    l_book_info (i).v_avalability|| '     ' ||
    l_book_info (i).n_debCost|| '     ' ||
    l_book_info (i).n_lostCost|| '     ' ||  
    l_book_info (i).v_address);
    END LOOP;    
END;
/
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
BEGIN
  BPC_ALL_PRODUCTS;
END;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--8--
CREATE OR REPLACE PROCEDURE bpc_return_product(p_itemID IN VARCHAR2) IS
  n_Rented_count NUMBER;
  n_Book_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO n_Rented_count
  FROM etq_product_Rent
  WHERE v_itemID LIKE p_itemID;
  
  SELECT COUNT(*) INTO n_Book_count
  FROM etq_product_book
  WHERE v_bookID LIKE p_itemID;
  
  IF n_Rented_count > 0 THEN
    DELETE FROM etq_product_Rent
    WHERE v_itemID = p_itemID;
    
    IF n_Book_count > 0 THEN
      UPDATE etq_product_book
      SET v_avalability = 'A'
      WHERE v_bookID LIKE p_itemID;
      DBMS_OUTPUT.PUT_LINE('The book ' || p_itemID || ' is now avaible.');
	  COMMIT;
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('This item is not rented at the moment');
  END IF;
  EXCEPTION WHEN no_data_found THEN 
  ROLLBACK;
  DBMS_OUTPUT.PUT_LINE('Item ID incorrect');    
END;
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  au_ItemID VARCHAR2(10);
BEGIN
  au_ItemID := &ItemID_to_return;
  bpc_return_product(au_ItemID);
END;
----------------------------------------------------------------------------
SELECT * FROM rent;
SELECT * FROM book;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--09--
CREATE OR REPLACE TRIGGER TRG_modify_Fines AFTER DELETE ON etq_product_Rent FOR EACH ROW DECLARE
  in_cardID NUMBER;
  iv_itemID VARCHAR2(6);
  n_book_count NUMBER;
  in_debCost NUMBER;
BEGIN
  SELECT n_cardID, v_itemID INTO in_cardID, iv_itemID
  FROM etq_product_Rent
  WHERE n_cardID = :old.n_cardID;
  
  SELECT COUNT(*) INTO n_book_count
  FROM etq_product_book
  WHERE v_bookID = iv_itemID;
  
  IF SYSDATE > :old.d_returnDate THEN
    IF n_book_count > 0 THEN
      SELECT n_debCost INTO in_debCost
      FROM etq_product_book
      WHERE v_bookID = iv_itemID;
    END IF;
    
    UPDATE etq_cust_card
    SET v_status = 'B', n_fines = (n_fines + in_debCost)
    WHERE n_cardID LIKE in_cardID;
	COMMIT;
  ELSE
    DBMS_OUTPUT.PUT_LINE('The item has been return before deadline');
  END IF;
END;
/
----------------------------------------------------------------------------
--EXAMPLE--
INSERT INTO etq_Customer
VALUES (12,'ALEJANDRO','ZAIDIN',629629629,'alex123','al12',sysdate,113);
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  au_Card NUMBER;
  au_ItemID VARCHAR2(10);
  au_Date DATE;
BEGIN
  au_Card := &Card_ID;
  au_ItemID := &ID_Item;
  au_Date := &Return_date;
  bpc_rent_Item(au_Card,au_ItemID,au_Date);
  COMMIT;
END;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  au_ItemID VARCHAR2(10);
BEGIN
  au_ItemID := &ItemID_to_return;
  bpc_return_product(au_ItemID);
  COMMIT;
END;
----------------------------------------------------------------------------
DELETE FROM etq_cust_card WHERE n_cardID LIKE 112;
SELECT * FROM etq_cust_card;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--10--
CREATE OR REPLACE PROCEDURE bpc_find_Cust_det_usning_name(p_name IN VARCHAR2) IS
TYPE t_cust_details IS TABLE OF etq_Customer%ROWTYPE;
l_cust_details t_cust_details;

BEGIN
    
  SELECT * BULK COLLECT INTO l_cust_details
  FROM etq_Customer
  WHERE UPPER(v_name) LIKE UPPER(p_name);--Use of Function based INDEX
  
  FOR i IN 1 .. l_cust_details.COUNT
  LOOP
      DBMS_OUTPUT.PUT_LINE('CUSTOMER ' || l_cust_details(i).n_customerID || ' INFO');
      DBMS_OUTPUT.PUT_LINE('------------------------------------------');
      DBMS_OUTPUT.PUT_LINE('NAME: ' || UPPER(l_cust_details(i).v_name ));
      DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || l_cust_details(i).n_custAddress );
      DBMS_OUTPUT.PUT_LINE('PHONE: ' || l_cust_details(i).n_phone );
      DBMS_OUTPUT.PUT_LINE('USER NAME: ' || l_cust_details(i).v_userName );
      DBMS_OUTPUT.PUT_LINE('PASSWORD: ' || l_cust_details(i).v_password );
      DBMS_OUTPUT.PUT_LINE('DATE OF SIGN UP: ' || l_cust_details(i).d_dateSignUp );
      DBMS_OUTPUT.PUT_LINE('CARD NUMBER: ' || l_cust_details(i).n_cardID );
      DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  END LOOP;
END;
/
----------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  au_Custoname VARCHAR2(10);
BEGIN
  au_Custoname := &Customername;
  bpc_find_Cust_det_usning_name(au_Custoname);
END;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--SCHEDULED PRGRAM to RUN EVERY OTHER DAY.
BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
   job_name          =>  'BPC_ALL_PRODUCTS_BATCH',
   program_name      =>  'BPC_ALL_PRODUCTS', 
   repeat_interval   =>  'FREQ=DAILY;BYHOUR=2',
   comments          =>  'Daily at noon');
END;
/
----------------------------------------------------------------------------
--REULT CACHE EXAMPLE --START
SELECT /*+ RESULT_CACHE */ v_status, SUM(n_fines)
  FROM etq_cust_card
 GROUP BY v_status;
----------------------------------------------------------------------------
 --View Explain plan and retrieve RESULT CACHE as BELOW -
 /* Plan
SELECT STATEMENT  ALL_ROWSCost: 3  Bytes: 15  Cardinality: 1  			
	3 RESULT CACHE 805ub0akb2gr00qg63rj3v9da8 Cost: 3  Bytes: 15  Cardinality: 1  		
		2 HASH GROUP BY  Cost: 3  Bytes: 15  Cardinality: 1  	
			1 TABLE ACCESS FULL TABLE PENTAISF.ETQ_CUST_CARD Cost: 2  Bytes: 15  Cardinality: 1  */
			
SELECT id, type, creation_timestamp, block_count,
column_count, pin_count, row_count
FROM V$RESULT_CACHE_OBJECTS
WHERE cache_id = '805ub0akb2gr00qg63rj3v9da8';
----------------------------------------------------------------------------
-- OUTPUT AS BELOW -
--7084	Result	1/12/2023	1	2	0	0

--REULT CACHE EXAMPLE --END
---------------------------------------------------------------------------- 
/* SAFEGUARDING COLUMN
BEGIN
 SYS.DBMS_TSDP_MANAGE.ADD_SENSITIVE_COLUMN(
 schema_name        => 'ETQ',
 table_name         => 'ETQ_CUSTOMER',
 column_name        => 'V_PASSWORD',
 sensitive_type     => 'PASSWORD',
 user_comment       => 'Sensitive column addition of password type');
END;
/*/
