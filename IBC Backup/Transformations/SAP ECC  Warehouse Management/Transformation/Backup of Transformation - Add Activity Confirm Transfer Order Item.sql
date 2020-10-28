-- Statement: Activity: Confirm Transfer Order Item

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
    ,CASE 
        WHEN WMTO.PQUIT = 'X' AND WMTO.NSOLA = WMTO.NISTA THEN 'Kommissionierung quittiert (WM)'
        WHEN WMTO.PQUIT = 'X' AND WMTO.NSOLA = WMTO.NISTA + WMTO.NDIFA AND WMTO.KZDIF IS NOT NULL THEN 'Kommissionierung mit Differenz quittiert (WM)'
        WHEN WMTO.PQUIT = 'X' AND WMTO.NISTA = 0 AND WMTO.KZDIF IS NULL THEN 'Kommissionierung storniert (WM)'
    END AS "ACTIVITY_DE"
	,CASE 
        WHEN WMTO.PQUIT = 'X' AND WMTO.NSOLA = WMTO.NISTA THEN 'Picking Confirmed (WM)'
        WHEN WMTO.PQUIT = 'X' AND WMTO.NSOLA = WMTO.NISTA + WMTO.NDIFA AND WMTO.KZDIF IS NOT NULL THEN 'Picking Confirmed with difference (WM)'
        WHEN WMTO.PQUIT = 'X' AND WMTO.NISTA = 0 AND WMTO.KZDIF IS NULL THEN 'Picking Cancelled (WM)'
    END AS "ACTIVITY_EN"
    , CAST("WMTO"."QDATU" AS DATE) + CAST("WMTO"."QZEIT" AS TIME) AS "EVENTTIME"
    , 300 AS  "_SORTING"
    , WMTO.QNAME AS "USER_NAME"
    , USR02.USTYP AS "USER_TYPE"
    , NOW() AS "_CELONIS_CHANGE_DATE"
FROM TMP_WM_LTAK_LTAP AS WMTO
JOIN USR02 ON
    USR02.SCHEMA = WMTO.SCHEMA
    AND USR02.MANDT = WMTO.MANDT 
    AND USR02.BNAME = WMTO.BNAME
JOIN "SCHEMA_XLSX_MD" AS MAP ON
    MAP.SCHEMA = WMTO.SCHEMA
WHERE 
    WMTO.PQUIT = 'X';
;