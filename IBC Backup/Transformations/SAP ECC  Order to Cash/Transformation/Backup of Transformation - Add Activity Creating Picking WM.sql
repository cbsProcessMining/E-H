/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: Create Picking
*/
-- Statement: Activity: Creating Picking (WM)
-- Query No: 1
INSERT INTO _CEL_O2C_ACTIVITIES (
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
    "SC/PC", -- global job
    "_CASE_KEY"
    ,"ACTIVITY_DE"
    ,"ACTIVITY_EN"
    ,"EVENTTIME"
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    ,"MANDT"
    ,"VBELN"
    ,"POSNR"
    )
SELECT DISTINCT
    V_ORDERS."SCHEMA", -- global job
    V_ORDERS."PRETTY_NAME", -- global job
    V_ORDERS."SC/PC", -- global job
    V_ORDERS._CASE_KEY AS "_CASE_KEY"    
    ,CASE WHEN COALESCE(LTAK.TANUM, '') = '' 
        THEN 'Kommissionierung quittiert (MM)'
        ELSE 'Erstelle Kommissionierauftrag (WM)'
    END AS "ACTIVITY_DE"
    ,CASE WHEN COALESCE(LTAK.TANUM, '') = ''
        THEN 'Picking Confirmed (MM)'
        ELSE 'Create Picking TO (WM)' 
    END AS "ACTIVITY_EN"
    ,CASE WHEN COALESCE(LTAK.TANUM, '') = ''
        THEN CAST("VBFA"."ERDAT" AS DATE) + CAST("VBFA"."ERZET" AS TIME)  
        ELSE CAST("LTAK"."BDATU" AS DATE) + CAST("LTAK"."BZEIT" AS TIME)
    END AS "EVENTTIME"
    ,75 AS "_SORTING" 
    ,CASE WHEN COALESCE(LTAK.TANUM, '') = ''
        THEN LIKP.ERNAM
        ELSE LTAK.BNAME 
    END AS "USER_NAME" 
    ,USR02.USTYP AS "USER_TYPE" 
    ,V_ORDERS.MANDT AS "MANDT"
    ,V_ORDERS.VBELN AS "VBELN"
    ,V_ORDERS.POSNR AS "POSNR"
FROM TMP_O2C_VBAK_VBAP AS V_ORDERS 
    JOIN LIPS AS LIPS ON
        "LIPS"."SCHEMA" = "V_ORDERS"."SCHEMA" AND -- global job 
        LIPS.MANDT = V_ORDERS.MANDT AND
        LIPS.VGBEL = V_ORDERS.VBELN AND
        LIPS.VGPOS = V_ORDERS.POSNR
    JOIN LIKP AS LIKP ON
        "LIPS"."SCHEMA" = "LIKP"."SCHEMA" AND -- global job 
        LIPS.MANDT = LIKP.MANDT AND
        LIPS.VBELN = LIKP.VBELN
    JOIN VBFA AS VBFA ON
        "LIPS"."SCHEMA" = "VBFA"."SCHEMA" AND -- global job
        LIPS.MANDT = VBFA.MANDT AND
        LIPS.VBELN = VBFA.VBELV AND
        LIPS.POSNR = VBFA.POSNV
    LEFT JOIN USR02 AS USR02 ON 
        "LIKP"."SCHEMA" = "USR02"."SCHEMA" AND -- global job
        LIKP.MANDT = USR02.MANDT AND
        LIKP.ERNAM = USR02.BNAME
    LEFT JOIN LTAK AS LTAK ON
        VBFA."SCHEMA" = LTAK."SCHEMA" AND
        VBFA.MANDT = LTAK.MANDT AND
        VBFA.LGNUM = LTAK.LGNUM AND
        VBFA.VBELN = LTAK.TANUM
WHERE "VBFA"."VBTYP_N" = 'Q';

------------------------------ PS1090 Logic -----------------------------------------------------------------------------------------------

-- Query No: 2
INSERT INTO _CEL_O2C_ACTIVITIES (
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
    "SC/PC", -- global job
    "PS1090_WM", -- global job
    "_CASE_KEY"
    ,"ACTIVITY_DE"
    ,"ACTIVITY_EN"
    ,"EVENTTIME"
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    ,"MANDT"
    ,"VBELN"
    ,"POSNR"
    )
SELECT DISTINCT
    V_ORDERS."SCHEMA", -- global job
    V_ORDERS."PRETTY_NAME", -- global job
    V_ORDERS."SC/PC", -- global job
    'X', -- global job
    V_ORDERS._CASE_KEY AS "_CASE_KEY"    
    ,'Erstelle Kommissionierauftrag (WM)'AS "ACTIVITY_DE"
    ,'Create Picking TO (WM)' AS "ACTIVITY_EN"
    , CAST("LTAK"."BDATU" AS DATE) + CAST("LTAK"."BZEIT" AS TIME) AS "EVENTTIME"
    ,75 AS "_SORTING" 
    , LTAK.BNAME AS "USER_NAME" 
    ,USR02.USTYP AS "USER_TYPE" 
    ,V_ORDERS.MANDT AS "MANDT"
    ,V_ORDERS.VBELN AS "VBELN"
    ,V_ORDERS.POSNR AS "POSNR"
FROM TMP_O2C_VBAK_VBAP AS V_ORDERS 
    JOIN LIPS AS LIPS ON
        "LIPS"."SCHEMA" = "V_ORDERS"."SCHEMA" AND -- global job 
        LIPS.MANDT = V_ORDERS.MANDT AND
        LIPS.VGBEL = V_ORDERS.VBELN AND
        LIPS.VGPOS = V_ORDERS.POSNR
    JOIN LIKP AS LIKP ON -- e.g. PS1.030
        "LIPS"."SCHEMA" = "LIKP"."SCHEMA" AND -- global job 
        LIPS.MANDT = LIKP.MANDT AND
        LIPS.VBELN = LIKP.VBELN
    JOIN VBFA AS VBFA ON -- PS1.090
        '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' = "VBFA"."SCHEMA" AND -- global job
        -- LIPS.MANDT = VBFA.MANDT AND
        LIPS.VBELN = VBFA.VBELV AND
        LIPS.POSNR = VBFA.POSNV
    LEFT JOIN LTAK AS LTAK ON --PS1.090
        '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' = LTAK."SCHEMA" AND
        --VBFA.MANDT = LTAK.MANDT AND
        VBFA.LGNUM = LTAK.LGNUM AND
        VBFA.VBELN = LTAK.TANUM
    LEFT JOIN USR02 AS USR02 ON --PS1.090
        "LTAK"."SCHEMA" = "USR02"."SCHEMA" AND -- global job
        LTAK.MANDT = USR02.MANDT AND
        LTAK.BNAME = USR02.BNAME
WHERE "VBFA"."VBTYP_N" = 'Q';

-- Validation
-- Select VBELN, POSNR, COUNT (*) FROM LIPS 
-- GROUP BY VBELN, POSNR HAVING COUNT (*) > 2

-- SELECT * from tmp

-- -- Cleaning of TEMP tables
-- Drop Table if exists CASES;
-- Drop Table if exists WM;
-- Drop Table if exists "HELP";
--  Drop Table if exists TEMP;
--  Drop Table if exists TEMP_1;
 

-- -- Creation of the records which has Records Goods Issue but are not canceled
-- Create TABLE "TEMP" as 
-- Select _CASE_KEY, "ACTIVITY_EN", "EVENTTIME", 
-- ROW_NUMBER() OVER (PARTITION BY _CASE_KEY ORDER BY (EVENTTIME) ASC) AS "ROWNR"
--   from "_CEL_O2C_ACTIVITIES" where "ACTIVITY_EN" in ('Record Goods Issue','Cancel Goods Issue');

-- -- Creation of the Temp Table where Records with max Row Nr. 
-- Create Table "TEMP_1" as
-- Select _CASE_KEY, MAX(ROWNR) as "ROWNR" from "TEMP" group by _CASE_KEY;

-- -- Creation of the Temp Table "Help" which has max records but are not canceled => Only Goods Recieved left
-- Create Table "HELP" as 
-- Select _CASE_KEY from (

-- Select TEMP._CASE_KEY, TEMP."ACTIVITY_EN", TEMP."EVENTTIME" from "TEMP"
-- inner join "TEMP_1"
-- using(_CASE_KEY, ROWNR)

-- ) as "TMP"
-- where "ACTIVITY_EN" = 'Record Goods Issue';
 
--  -- House Keeping of the TEMP Tables for Goods Recieved
--  Drop Table if exists TEMP;
--  Drop Table if exists TEMP_1;

-- -- Creation of the TEMP Table WM where at least one WM Activity is happening 
-- CREATE TABLE WM as Select DISTINCT _CASE_KEY from "_CEL_O2C_ACTIVITIES" where "ACTIVITY_EN" in ('Picking Confirmed (MM)', 'Create Picking TO (WM)', 'Picking Confirmed (WM)', 'Picking Cancelled (WM)');

-- -- Creation of the Case Table where Records Goods Issue is happening but no Corresponding WM Activity is happning.
-- Create Table Cases as Select * from HELP except Select * from WM;

-- -- House Keeping WM and HELP
-- Drop Table if exists WM;
-- Drop Table if exists "HELP";
 

-- -- Statement: Activity: Creating Picking (WM)
-- -- Query No: 1
-- INSERT INTO _CEL_O2C_ACTIVITIES (
--     "SCHEMA", -- global job
--     "PRETTY_NAME", -- global job
--     "SC/PC", -- global job
--     "PS1090_WM", -- global job for Logistic Centrum
--     "_CASE_KEY"
--     ,"ACTIVITY_DE"
--     ,"ACTIVITY_EN"
--     ,"EVENTTIME"
--     ,"_SORTING"
--     ,"USER_NAME"
--     ,"USER_TYPE"
--     ,"MANDT"
--     ,"VBELN"
--     ,"POSNR"
--     )
-- SELECT DISTINCT
--     V_ORDERS."SCHEMA", -- global job
--     V_ORDERS."PRETTY_NAME", -- global job
--     V_ORDERS."SC/PC", -- global job
--     'X', -- Flag if Logistic Centrum is included
--     V_ORDERS._CASE_KEY AS "_CASE_KEY"    
--     ,CASE WHEN COALESCE(LTAK.TANUM, '') = '' 
--         THEN 'Kommissionierung quittiert (MM)'
--         ELSE 'Erstelle Kommissionierauftrag (WM)'
--     END AS "ACTIVITY_DE"
--     ,CASE WHEN COALESCE(LTAK.TANUM, '') = ''
--         THEN 'Picking Confirmed (MM)'
--         ELSE 'Create Picking TO (WM)' 
--     END AS "ACTIVITY_EN"
--     ,CASE WHEN COALESCE(LTAK.TANUM, '') = ''
--         THEN CAST("VBFA"."ERDAT" AS DATE) + CAST("VBFA"."ERZET" AS TIME)  
--         ELSE CAST("LTAK"."BDATU" AS DATE) + CAST("LTAK"."BZEIT" AS TIME)
--     END AS "EVENTTIME"
--     ,75 AS "_SORTING" 
--     ,CASE WHEN COALESCE(LTAK.TANUM, '') = ''
--         THEN LIKP.ERNAM
--         ELSE LTAK.BNAME 
--     END AS "USER_NAME" 
--     ,USR02.USTYP AS "USER_TYPE" 
--     ,V_ORDERS.MANDT AS "MANDT"
--     ,V_ORDERS.VBELN AS "VBELN"
--     ,V_ORDERS.POSNR AS "POSNR"
-- FROM TMP_O2C_VBAK_VBAP AS V_ORDERS
--     join CASES 
--     using(_CASE_KEY)
--     JOIN LIPS AS LIPS ON
--         "LIPS"."SCHEMA" = V_ORDERS."SCHEMA" AND -- global job 
--         LIPS.MANDT = V_ORDERS.MANDT AND
--         LIPS.VGBEL = V_ORDERS.VBELN AND
--         LIPS.VGPOS = V_ORDERS.POSNR
--     JOIN LIKP AS LIKP ON
--         "LIPS"."SCHEMA" = "LIKP"."SCHEMA" AND -- global job 
--         LIPS.MANDT = LIKP.MANDT AND
--         LIPS.VBELN = LIKP.VBELN
--     JOIN LIKP as LIKP_1 ON  -- self join to achieve the PS1090 logic, that the Delivery Number is the same
--         LIKP.VBELN = LIKP_1.VBELN AND
--         LIKP_1."SCHEMA" = '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10'    
--     JOIN VBFA AS VBFA ON
--          '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' = "VBFA"."SCHEMA" AND -- global job
--          LIPS.VBELN = VBFA.VBELV AND
--         LIPS.POSNR = VBFA.POSNV
--     LEFT JOIN USR02 AS USR02 ON 
--         '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' = "USR02"."SCHEMA" AND -- global job
--            LIKP.ERNAM = USR02.BNAME
--     LEFT JOIN LTAK AS LTAK ON
--         '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' = LTAK.SCHEMA AND
--         VBFA.LGNUM = LTAK.LGNUM AND
--         VBFA.VBELN = LTAK.TANUM
-- WHERE "VBFA"."VBTYP_N" = 'Q' and V_ORDERS."SC/PC" = 'SC' and V_ORDERS.PRETTY_NAME <> 'PSG048' and V_ORDERS.ZZDLZ = '3';

-- -- Cases Table Please not Drop! It is still needed 



