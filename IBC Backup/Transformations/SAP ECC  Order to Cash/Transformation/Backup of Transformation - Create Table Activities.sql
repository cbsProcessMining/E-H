/*DESCRIPTION:
1. Transformation Description:
This transformation creates a table with the following name: _CEL_O2C_ACTIVITIES













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
DROP TABLE IF EXISTS "_CEL_O2C_ACTIVITIES";

CREATE TABLE "_CEL_O2C_ACTIVITIES" (
     "SCHEMA" varchar(300)
    ,"PRETTY_NAME" varchar(300)
    ,"SC/PC" varchar(300)
    ,"PS1090_WM" varchar(1)  
	,"_CASE_KEY" VARCHAR(50)
	,"ACTIVITY_DE" VARCHAR(300)
	,"ACTIVITY_DETAIL_DE" VARCHAR(300)
	,"ACTIVITY_EN" VARCHAR(200)
	,"ACTIVITY_DETAIL_EN" VARCHAR(300)
	,"EVENTTIME" DATETIME
	,"_SORTING" INT
	,"USER_NAME" VARCHAR(80)
	,"USER_TYPE" VARCHAR(20)
    ,"CHANGED_TABLE" VARCHAR(20)
    ,"CHANGED_TABLE_TEXT" VARCHAR(200)
    ,"CHANGED_FIELD" VARCHAR(20)
    ,"CHANGED_FIELD_TEXT" VARCHAR(200)
    ,"CHANGED_FROM" VARCHAR (200)
    ,"CHANGED_TO" VARCHAR(200)
    ,"CHANGED_FROM_FLOAT" FLOAT
    ,"CHANGED_TO_FLOAT" FLOAT
	,"CHANGE_NUMBER" VARCHAR(50)
	,"TRANSACTION_CODE" VARCHAR(20)
    ,"MANDT" VARCHAR(3)
    ,"VBELN" VARCHAR(10)
    ,"POSNR" VARCHAR(6)
    ,"_ACTIVITY_KEY" VARCHAR(50)
);