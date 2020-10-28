INSERT INTO "_CEL_PP_ACTIVITIES"(
    "SCHEMA" -- global job
    , "PRETTY_NAME" -- global job
    ,"_CASE_KEY"
    ,"MANDT"
    ,"AUFNR"
    ,"POSNR"
     ,"ACTIVITY_DE"
    ,"ACTIVITY_EN"
    ,"EVENTTIME"
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_FIELD"
    -- ,"CHANGED_FROM"
    -- ,"CHANGED_TO"
    -- ,"CHANGE_NUMBER"
    -- ,"TRANSACTION_CODE"
    )
SELECT
    "TMP_PP_AUFK_AFKO_AFPO"."SCHEMA" AS "SCHEMA" -- global job
    ,"TMP_PP_AUFK_AFKO_AFPO"."PRETTY_NAME" AS "PRETTY_NAME" -- global job
    ,"TMP_PP_AUFK_AFKO_AFPO"."_CASE_KEY" AS "_CASE_KEY"
    ,"TMP_PP_AUFK_AFKO_AFPO"."MANDT" AS "MANDT"
    ,"TMP_PP_AUFK_AFKO_AFPO"."AUFNR"
    ,"TMP_PP_AUFK_AFKO_AFPO"."POSNR"
    ,CASE 
        WHEN LTAK.TRART = 'E' THEN 'Erstelle Auftrag zur Einlagerung (WM)'
        WHEN LTAK.TRART = 'A' THEN 'Erstelle Kommissionierauftrag (WM)'
    END AS "ACTIVITY_DE"
    ,CASE 
        WHEN LTAK.TRART = 'E' THEN 'Create Put Away TO (WM)'
        WHEN LTAK.TRART = 'A' THEN 'Create Picking TO (WM)'
    END AS "ACTIVITY_DE"
    ,CAST(CAST("LTAK"."BDATU" AS DATE) || ' ' || CAST("LTAK"."BZEIT" AS TIME) AS TIMESTAMP) AS "EVENTTIME"
    ,4198 AS "_SORTING"
    ,"LTAK"."BNAME" AS "USER_NAME"
    ,"USR02"."USTYP" AS "USER_TYPE"
    -- ,NULL AS "CHANGED_TABLE"
    -- ,NULL AS "CHANGED_FIELD"
    -- ,NULL AS "CHANGED_FROM"
    -- ,NULL AS "CHANGED_TO"
    -- ,NULL AS "CHANGE_NUMBER"
    -- ,NULL AS "TRANSACTION_CODE"

FROM    
    "TMP_PP_AUFK_AFKO_AFPO"
    INNER JOIN "LTAK" ON
        "TMP_PP_AUFK_AFKO_AFPO"."SCHEMA" = "LTAK"."SCHEMA" AND
        "TMP_PP_AUFK_AFKO_AFPO"."MANDT" = "LTAK"."MANDT" AND
        "TMP_PP_AUFK_AFKO_AFPO"."AUFNR" = right('000000000000' || "LTAK"."BENUM", 12) -- SAP difference in dataformat: AUFNR = CHAR12, BENUM = CHAR10
    LEFT JOIN "USR02"  ON
        "LTAK"."SCHEMA" = "USR02"."SCHEMA" AND
        "LTAK"."MANDT" = "USR02"."MANDT" AND
        "LTAK"."BNAME" = "USR02"."BNAME"
WHERE 
    "LTAK"."BETYP" = 'F' -- only relevant BETYP for starters


