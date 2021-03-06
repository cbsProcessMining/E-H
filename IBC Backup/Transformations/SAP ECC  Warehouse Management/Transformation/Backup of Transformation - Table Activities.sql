 
 DROP TABLE IF EXISTS _CEL_WM_ACTIVITIES;

CREATE TABLE _CEL_WM_ACTIVITIES (
     "SCHEMA" varchar(300)
    ,"PRETTY_NAME" varchar(300) 
	,"_CASE_KEY" VARCHAR(50)
    ,"MANDT" NCHAR(3)
    ,"LGNUM" VARCHAR(3)
    ,"TANUM" VARCHAR(10)
    ,"TAPOS" VARCHAR(4) 
    ,"ACTIVITY_DE" VARCHAR (300)
    ,"ACTIVITY_EN" VARCHAR(200)
    ,"EVENTTIME" DATETIME
    ,"_SORTING" INT
    ,"USER_NAME" VARCHAR(100)
    ,"USER_TYPE" VARCHAR(30)
    ,"TBNUM" VARCHAR(10)
    ,"TBPOS" VARCHAR(6)
    ,"PROD_TANUM" VARCHAR(10)
	,"AUFNR" VARCHAR(14)
    ,"CHANGED_TABLE" VARCHAR(20)
    ,"CHANGED_TABLE_TEXT_DE" VARCHAR(200)
    ,"CHANGED_TABLE_TEXT_EN" VARCHAR(200)
    ,"CHANGED_FIELD" VARCHAR(20)
    ,"CHANGED_FIELD_TEXT_DE" VARCHAR(200)
    ,"CHANGED_FIELD_TEXT_EN" VARCHAR(200)
    ,"CHANGED_FROM" VARCHAR (50)
    ,"CHANGED_TO" VARCHAR(50)
    ,"CHANGED_FROM_FLOAT" FLOAT
    ,"CHANGED_TO_FLOAT" FLOAT
    ,"CHANGE_NUMBER" VARCHAR(50)
    ,"TRANSACTION_CODE" VARCHAR(100)
    ,"_CELONIS_CHANGE_DATE" DATETIME
)
;