-- Statement: Activity: Confirmation / Cancellation of Picking (WM)
-- Query No: 1
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global job
    "PRETTY_NAME",-- global job
    "SC/PC", -- global job
	"_CASE_KEY",
	"ACTIVITY_DE",
	"ACTIVITY_EN",
	"EVENTTIME",
	"_SORTING",
	"USER_NAME",
	"USER_TYPE",
	"MANDT",
	"VBELN",
	"POSNR")
SELECT DISTINCT
    "V_ORDERS"."SCHEMA" AS "SCHEMA"-- global job
    ,"V_ORDERS"."PRETTY_NAME" AS "PRETTY_NAME"-- global job
    ,"V_ORDERS"."SC/PC" AS "SC/PC" -- global job
	,"V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
	,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Kommissionierung quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Kommissionierung mit Differenz quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Kommissionierung storniert (WM)'
    END AS "ACTIVITY_DE"
	,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Picking Confirmed (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Picking Confirmed with difference (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Picking Cancelled (WM)'
    END AS "ACTIVITY_EN"
	, CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME) AS "EVENTTIME"
	, 79 AS "_SORTING"
	, "LTAP"."QNAME" AS "USER_NAME"
	, "USR02"."USTYP" AS "USER_TYPE"
	,"V_ORDERS"."MANDT" AS "MANDT"
	,"V_ORDERS"."VBELN" AS "VBELN"
	,"V_ORDERS"."POSNR" AS "POSNR"
 FROM
	"TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
	JOIN "VBFA" AS "VBFA" ON 1=1
        AND "V_ORDERS"."SCHEMA" = "VBFA"."SCHEMA" -- global job
		AND "V_ORDERS"."MANDT" = "VBFA"."MANDT"
		AND "V_ORDERS"."VBELN" = "VBFA"."VBELV"
		AND "V_ORDERS"."POSNR" = "VBFA"."POSNV"
	JOIN "LIPS" AS "LIPS" ON 1=1
        AND "VBFA"."SCHEMA" = "LIPS"."SCHEMA" -- global job
		AND "VBFA"."MANDT" = "LIPS"."MANDT"
		AND "VBFA"."VBELN" = "LIPS"."VBELN"
		AND "VBFA"."POSNN" = "LIPS"."POSNR" 
	JOIN "LIKP" AS "LIKP" ON 1=1
        AND "LIPS"."SCHEMA" = "LIKP"."SCHEMA" -- global job
		AND "LIPS"."MANDT" = "LIKP"."MANDT"
		AND "LIPS"."VBELN" = "LIKP"."VBELN"  
	JOIN "LTAP" AS LTAP ON 1 = 1
        AND "LTAP"."SCHEMA" = "LIPS"."SCHEMA" -- global job 
        AND LTAP.MANDT = LIPS.MANDT
        AND LTAP.VBELN = "LIPS"."VBELN"
        AND LTAP.POSNR = "LIPS"."POSNR"
    LEFT JOIN "USR02" AS "USR02" ON 1=1
        AND "LIKP"."SCHEMA" = "USR02"."SCHEMA" -- global job
		AND "LIKP"."MANDT" = "USR02"."MANDT"
		AND "LIKP"."ERNAM" = "USR02"."BNAME"
WHERE 
    "LTAP"."PQUIT" = 'X';



-----------------------------PS1090 Logic --------------------------------------------------------------------------
-- Query No 2. 
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global job
    "PRETTY_NAME",-- global job
    "SC/PC", -- global job
    "PS1090_WM", -- global job
	"_CASE_KEY",
	"ACTIVITY_DE",
	"ACTIVITY_EN",
	"EVENTTIME",
	"_SORTING",
	"USER_NAME",
	"USER_TYPE",
	"MANDT",
	"VBELN",
	"POSNR")
SELECT DISTINCT
    "V_ORDERS"."SCHEMA" AS "SCHEMA"-- global job
    ,"V_ORDERS"."PRETTY_NAME" AS "PRETTY_NAME"-- global job
    ,"V_ORDERS"."SC/PC" AS "SC/PC" -- global job
    ,'X' as "PS1090_WM" -- global job
	,"V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
	,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Kommissionierung quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Kommissionierung mit Differenz quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Kommissionierung storniert (WM)'
    END AS "ACTIVITY_DE"
	,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Picking Confirmed (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Picking Confirmed with difference (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Picking Cancelled (WM)'
    END AS "ACTIVITY_EN"
	, CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME) AS "EVENTTIME"
	, 79 AS "_SORTING"
	, "LTAP"."QNAME" AS "USER_NAME"
	, "USR02"."USTYP" AS "USER_TYPE"
	,"V_ORDERS"."MANDT" AS "MANDT"
	,"V_ORDERS"."VBELN" AS "VBELN"
	,"V_ORDERS"."POSNR" AS "POSNR"
 FROM
	"TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
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
	JOIN "LTAP" AS LTAP ON 1 = 1
        AND "LTAP"."SCHEMA" = '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' -- global job 
        AND LTAP.VBELN = "LIPS"."VBELN"
        AND LTAP.POSNR = "LIPS"."POSNR"
    LEFT JOIN "USR02" AS "USR02" ON 1=1
        AND "LIKP"."SCHEMA" = "USR02"."SCHEMA" -- global job
		AND "LIKP"."ERNAM" = "USR02"."BNAME"
WHERE 
    "LTAP"."PQUIT" = 'X';
