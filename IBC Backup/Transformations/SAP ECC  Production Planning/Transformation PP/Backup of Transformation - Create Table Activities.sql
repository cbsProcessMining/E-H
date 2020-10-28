DROP TABLE IF EXISTS _CEL_PP_ACTIVITIES;

CREATE TABLE _CEL_PP_ACTIVITIES(
    "SCHEMA" VARCHAR(100) -- global job
    ,"PRETTY_NAME" VARCHAR(80) -- global job
    ,"_CASE_KEY" VARCHAR(50)
    ,"MANDT" NCHAR(3)
    ,"AUFNR" VARCHAR(12)
    ,"POSNR" VARCHAR(5)
    ,"ACTIVITY_DE" VARCHAR(300)
    ,"ACTIVITY_DETAIL_DE" VARCHAR(300)
    ,"ACTIVITY_EN" VARCHAR(200)
    ,"ACTIVITY_DETAIL_EN" VARCHAR(300)
    ,"EVENTTIME" DATETIME
    ,"_SORTING" int
    ,"USER_NAME" VARCHAR(50)
    ,"USER_TYPE" VARCHAR(10)
    -- ,"START_TIME" DATETIME
    -- ,"VORNR" VARCHAR(4)
    -- ,"WORK_CENTRE" VARCHAR(30)
    -- ,"WORK_CENTRE_TEXT" VARCHAR(200)
    -- ,"OPERATION_TEXT" VARCHAR(200)
    -- ,"VAT" FLOAT
    -- ,"SCRAP" FLOAT
    -- ,"YIELD" FLOAT
    -- ,"CHANGED_TABLE" VARCHAR(20)
    -- ,"CHANGED_FIELD" VARCHAR(20)
    -- ,"CHANGED_FROM" VARCHAR (50)
    -- ,"CHANGED_TO" VARCHAR(50)
    -- ,"CHANGED_FROM_FLOAT" FLOAT
    -- ,"CHANGED_TO_FLOAT" FLOAT
    -- ,"CHANGE_NUMBER" VARCHAR(100)
    ,"TRANSACTION_CODE" VARCHAR(20)

);