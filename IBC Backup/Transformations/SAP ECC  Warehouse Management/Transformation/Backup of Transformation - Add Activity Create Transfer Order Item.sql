-- Statement: Activity: Create Transfer Order Item

INSERT INTO _CEL_WM_ACTIVITIES (
     "SCHEMA"
    ,"PRETTY_NAME"
	,"_CASE_KEY"
    ,"MANDT"
    ,"LGNUM"
    ,"TANUM"
    ,"TAPOS" 
    ,"ACTIVITY_DE"
    ,"ACTIVITY_EN"
    ,"EVENTTIME"
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    ,"_CELONIS_CHANGE_DATE"
)
SELECT
    WMTO.SCHEMA AS "SCHEMA"
    , MAP.PRETTY_NAME AS "PRETTY_NAME"
	, WMTO._CASE_KEY AS "_CASE_KEY"
    , WMTO.MANDT AS "MANDT"
    , WMTO.LGNUM AS "LGNUM"
    , WMTO.TANUM AS "TANUM"
    , WMTO.TAPOS AS "TAPOS" 
    , CASE
        WHEN WMTO.TRART = 'U' THEN 'Erstelle TA für Umbuchung'
        WHEN WMTO.TRART = 'E' THEN 'Erstelle TA für Einlagerung'
        WHEN WMTO.TRART = 'A' THEN 'Erstelle TA für Auslagerung'
        WHEN WMTO.TRART = 'X' THEN 'Erstelle TA für Umlagerung'
    END AS "ACTIVITY_DE"
    , CASE 
        WHEN WMTO.TRART = 'U' THEN 'Create TO for Posting Change'
        WHEN WMTO.TRART = 'E' THEN 'Create TO for Put-Away'
        WHEN WMTO.TRART = 'A' THEN 'Create TO for Picking'
        WHEN WMTO.TRART = 'X' THEN 'Create TO for internal transfer'
    END AS "ACTIVITY_EN"
    , CAST(WMTO.BDATU AS DATE) + CAST(WMTO.BZEIT AS TIME) AS "EVENTTIME"
    , 200 AS  "_SORTING"
    , WMTO.BNAME AS "USER_NAME"
    , USR02.USTYP AS "USER_TYPE"
    , NOW() AS "_CELONIS_CHANGE_DATE"
FROM TMP_WM_LTAK_LTAP AS WMTO
JOIN USR02 ON
    USR02.SCHEMA = WMTO.SCHEMA
    AND USR02.MANDT = WMTO.MANDT 
    AND USR02.BNAME = WMTO.BNAME
JOIN "SCHEMA_XLSX_MD" AS MAP ON
    MAP.SCHEMA = WMTO.SCHEMA
;

-- SELECT BETYP, COUNT(*) FROM TMP_WM_LTAK_LTAP WHERE VBELN IS NULL GROUP BY BETYP

-- SELECT BWLVS, BWART, TRART, COUNT(*) FROM LTAK WHERE BETYP IS NULL GROUP BY BWLVS, BWART, TRART ORDER BY BWLVS
-- SELECT YEAR(CAST(LTAK.BDATU AS DATE)) AS YEAR, COUNT(*) FROM LTAK GROUP BY YEAR


-- ,CASE 
--         WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Kommissionierung quittiert (WM)'
--         WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Kommissionierung mit Differenz quittiert (WM)'
--         WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Kommissionierung storniert (WM)'
--     END AS "ACTIVITY_DE"
-- 	,CASE 
--         WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Picking Confirmed (WM)'
--         WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Picking Confirmed with difference (WM)'
--         WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Picking Cancelled (WM)'
--     END AS "ACTIVITY_EN"
-- 	, CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME) AS "EVENTTIME"

--  FROM "LTAP" AS LTAP ON 1 = 1
--         AND "LTAP"."SCHEMA" = "LIPS"."SCHEMA" -- global job 
--         AND LTAP.MANDT = LIPS.MANDT
--         AND LTAP.VBELN = "LIPS"."VBELN"
--         AND LTAP.POSNR = "LIPS"."POSNR"
--     LEFT JOIN "USR02" AS "USR02" ON 1=1
--         AND "LIKP"."SCHEMA" = "USR02"."SCHEMA" -- global job
-- 		AND "LIKP"."MANDT" = "USR02"."MANDT"
-- 		AND "LIKP"."ERNAM" = "USR02"."BNAME"
-- WHERE 
--     "LTAP"."PQUIT" = 'X';