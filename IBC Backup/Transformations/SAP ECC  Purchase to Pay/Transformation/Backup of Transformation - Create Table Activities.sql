/*DESCRIPTION:
1. Transformation Description:
This transformation creates a table with the following name: _CEL_P2P_ACTIVITIES

















2. Required Tables:
None

3. Required Columns:
None

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/

DROP TABLE IF EXISTS _CEL_P2P_ACTIVITIES;

CREATE TABLE _CEL_P2P_ACTIVITIES (
     "SCHEMA" varchar(300)
    ,"PRETTY_NAME" varchar(300)
    ,"SC/PC" varchar(300)
    ,"PS1090_WM" varchar(1)  
	,"_CASE_KEY" VARCHAR(50)
    ,"MANDT" VARCHAR(3)
    ,"EBELN" VARCHAR(10)
    ,"EBELP" VARCHAR(5)
    ,"ACTIVITY_DE" VARCHAR (300)
    ,"ACTIVITY_EN" VARCHAR(200)
    ,"EVENTTIME" DATETIME
    ,"_SORTING" INT
    ,"USER_NAME" VARCHAR(100)
    ,"USER_TYPE" VARCHAR(10)
    ,"CHANGED_TABLE" VARCHAR(20)
    ,"CHANGED_TABLE_TEXT_DE" VARCHAR(200)
    ,"CHANGED_TABLE_TEXT_EN" VARCHAR(200)
    ,"CHANGED_FIELD" VARCHAR(20)
    ,"CHANGED_FIELD_TEXT_DE" VARCHAR(200)
    ,"CHANGED_FIELD_TEXT_EN" VARCHAR(200)
    ,"CHANGED_FROM" VARCHAR (60)
    ,"CHANGED_TO" VARCHAR(60)
    ,"CHANGED_FROM_FLOAT" FLOAT
    ,"CHANGED_TO_FLOAT" FLOAT
    ,"CHANGE_NUMBER" VARCHAR(50)
    ,"TRANSACTION_CODE" VARCHAR(20)
    ,"_CELONIS_CHANGE_DATE" DATETIME
    ,"_ACTIVITY_KEY" VARCHAR(50)
  --  , "LGNUM" VARCHAR(3)
   -- , "TANUM" VARCHAR(10)
    --, "TAPOS" VARCHAR(6)    
);