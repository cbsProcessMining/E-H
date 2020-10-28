-- Query No: 1 -- Case PO with ASN / Inbound delivery
INSERT INTO _CEL_P2P_ACTIVITIES (
     "SCHEMA"
    ,"PRETTY_NAME"
    ,"SC/PC" -- global job
	,"_CASE_KEY"
    ,"MANDT"
    ,"EBELN" 
    ,"EBELP"
    ,"ACTIVITY_DE" 
    ,"ACTIVITY_EN" 
    ,"EVENTTIME" 
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_TABLE_TEXT_DE"
    -- ,"CHANGED_TABLE_TEXT_EN" 
    -- ,"CHANGED_FIELD" 
    -- ,"CHANGED_FIELD_TEXT_DE"
    -- ,"CHANGED_FIELD_TEXT_EN"
    -- ,"CHANGED_FROM" 
    -- ,"CHANGED_TO" 
    -- ,"CHANGED_FROM_FLOAT"
    -- ,"CHANGED_TO_FLOAT" 
    -- ,"CHANGE_NUMBER" 
    --,"TRANSACTION_CODE" 
   -- ,"_CELONIS_CHANGE_DATE" 
    ,"_ACTIVITY_KEY" 
    )
SELECT DISTINCT
    E."SCHEMA" AS "SCHEMA" -- global job
    ,E.PRETTY_NAME AS "PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
	,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
	,E.EBELN AS "EBELN"
	,E.EBELP AS "EBELP"
    ,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Einlagerung quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Einlagerung mit Differenz quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Einlagerung storniert (WM)'
    END AS "ACTIVITY_DE"
	,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Put Away Confirmed (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Put Away Confirmed with difference (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Put Away Cancelled (WM)'
    END AS "ACTIVITY_EN"
	, CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME) AS "EVENTTIME"
	, 1030 AS "_SORTING"
	, "LTAP"."QNAME" AS "USER_NAME"
    ,USR02.USTYP AS "USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_TABLE_TEXT_DE"
    -- ,"CHANGED_TABLE_TEXT_EN" 
    -- ,"CHANGED_FIELD" 
    -- ,"CHANGED_FIELD_TEXT_DE"
    -- ,"CHANGED_FIELD_TEXT_EN"
    -- ,"CHANGED_FROM" 
    -- ,"CHANGED_TO" 
    -- ,"CHANGED_FROM_FLOAT"
    -- ,"CHANGED_TO_FLOAT" 
    -- ,"CHANGE_NUMBER" 
    -- ,"TRANSACTION_CODE" 
    -- ,"_CELONIS_CHANGE_DATE" 
    , E."PRETTY_NAME"||E.MANDT || E.EBELN || E.EBELP  AS"_ACTIVITY_KEY" -- global job
FROM 
    TMP_P2P_EKKO_EKPO AS E
	INNER JOIN EKES AS EKES ON
        EKES."SCHEMA" = E."SCHEMA" -- global job
		AND EKES.MANDT = E.MANDT
        AND EKES.EBELN = E.EBELN
        AND EKES.EBELP = E.EBELP
    INNER JOIN LTAP AS LTAP ON
        EKES."SCHEMA" = LTAP."SCHEMA" -- link ps1090
        AND EKES.MANDT = LTAP.MANDT
        AND EKES.VBELN = LTAP.VBELN
        AND EKES.VBELP = LTAP.POSNR
    INNER JOIN LTAK AS LTAK ON
        LTAP."SCHEMA" = LTAK."SCHEMA"
        AND LTAP.MANDT = LTAK.MANDT
        AND LTAP.LGNUM = LTAK.LGNUM
        AND LTAP.TANUM = LTAK.TANUM
    INNER JOIN USR02 AS USR02 ON
        LTAK."SCHEMA" = "USR02"."SCHEMA"
        AND LTAK.MANDT = "USR02"."MANDT"
        AND LTAK.BNAME = "USR02"."BNAME"
WHERE 
    EKES.EBTYP LIKE 'L%' 
    AND LTAP.PQUIT = 'X'
;

-- Query No: 2 -- Case PO without ASN but WM Put Away
INSERT INTO _CEL_P2P_ACTIVITIES (
     "SCHEMA" -- global job
    ,"PRETTY_NAME" -- global job
    ,"SC/PC"  -- global job
	,"_CASE_KEY"
    ,"MANDT"
    ,"EBELN" 
    ,"EBELP"
    ,"ACTIVITY_DE" 
    ,"ACTIVITY_EN" 
    ,"EVENTTIME" 
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_TABLE_TEXT_DE"
    -- ,"CHANGED_TABLE_TEXT_EN" 
    -- ,"CHANGED_FIELD" 
    -- ,"CHANGED_FIELD_TEXT_DE"
    -- ,"CHANGED_FIELD_TEXT_EN"
    -- ,"CHANGED_FROM" 
    -- ,"CHANGED_TO" 
    -- ,"CHANGED_FROM_FLOAT"
    -- ,"CHANGED_TO_FLOAT" 
    -- ,"CHANGE_NUMBER" 
    --,"TRANSACTION_CODE" 
   -- ,"_CELONIS_CHANGE_DATE" 
    ,"_ACTIVITY_KEY" 
    )
SELECT DISTINCT
    E.SCHEMA AS "SCHEMA" -- global job
    ,E.PRETTY_NAME AS "PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
	,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
	,E.EBELN AS "EBELN"
	,E.EBELP AS "EBELP"
    ,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Einlagerung quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Einlagerung mit Differenz quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Einlagerung storniert (WM)'
    END AS "ACTIVITY_DE"
	,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Put Away Confirmed (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Put Away Confirmed with difference (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Put Away Cancelled (WM)'
    END AS "ACTIVITY_EN"
	, CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME) AS "EVENTTIME"
	, 1010 AS "_SORTING"
	, "LTAP"."QNAME" AS "USER_NAME"
    , USR02.USTYP AS "USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_TABLE_TEXT_DE"
    -- ,"CHANGED_TABLE_TEXT_EN" 
    -- ,"CHANGED_FIELD" 
    -- ,"CHANGED_FIELD_TEXT_DE"
    -- ,"CHANGED_FIELD_TEXT_EN"
    -- ,"CHANGED_FROM" 
    -- ,"CHANGED_TO" 
    -- ,"CHANGED_FROM_FLOAT"
    -- ,"CHANGED_TO_FLOAT" 
    -- ,"CHANGE_NUMBER" 
    -- ,"TRANSACTION_CODE" 
    -- ,"_CELONIS_CHANGE_DATE" 
    ,E."PRETTY_NAME"||E.MANDT || E.EBELN || E.EBELP  AS "_ACTIVITY_KEY" -- global job
FROM 
    TMP_P2P_EKKO_EKPO AS E
	INNER JOIN MSEG AS MSEG ON 
        E."SCHEMA" = MSEG."SCHEMA"
        AND E.MANDT = MSEG.MANDT
        AND E.EBELN = MSEG.EBELN
        AND E.EBELP = MSEG.EBELP
    INNER JOIN TMP_TO AS "TO" ON
        MSEG."SCHEMA" = "TO"."SCHEMA"
        AND MSEG.MANDT = "TO".MANDT
        AND MSEG.MJAHR = "TO".MJAHR
        AND MSEG.MBLNR = "TO".MBLNR
        AND MSEG.ZEILE = "TO".MBPOS
    INNER JOIN LTAP AS LTAP ON
        "TO"."SCHEMA" = LTAP."SCHEMA"
        AND "TO".MANDT = LTAP.MANDT
        AND "TO".LGNUM = LTAP.LGNUM
        AND "TO".TANUM = LTAP.TANUM
        AND "TO".TAPOS = LTAP.TAPOS
    INNER JOIN LTAK AS LTAK ON
        LTAP."SCHEMA" = LTAK."SCHEMA"
        AND LTAP.MANDT = LTAK.MANDT
        AND LTAP.LGNUM = LTAK.LGNUM
        AND LTAP.TANUM = LTAK.TANUM
    INNER JOIN USR02 AS USR02 ON
        LTAK."SCHEMA" = "USR02"."SCHEMA"
        AND LTAK.MANDT = "USR02"."MANDT"
        AND LTAK.BNAME = "USR02"."BNAME"
WHERE 
    LTAP.VBELN IS NULL
    AND LTAP.PQUIT = 'X';

-------------------------------PS1090 Logic -----------------------------

-- Query No: 3 -- Case PO with ASN / Inbound delivery
INSERT INTO _CEL_P2P_ACTIVITIES (
     "SCHEMA"
    ,"PRETTY_NAME"
    ,"SC/PC" -- global job
    ,"PS1090_WM"
	,"_CASE_KEY"
    ,"MANDT"
    ,"EBELN" 
    ,"EBELP"
    ,"ACTIVITY_DE" 
    ,"ACTIVITY_EN" 
    ,"EVENTTIME" 
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_TABLE_TEXT_DE"
    -- ,"CHANGED_TABLE_TEXT_EN" 
    -- ,"CHANGED_FIELD" 
    -- ,"CHANGED_FIELD_TEXT_DE"
    -- ,"CHANGED_FIELD_TEXT_EN"
    -- ,"CHANGED_FROM" 
    -- ,"CHANGED_TO" 
    -- ,"CHANGED_FROM_FLOAT"
    -- ,"CHANGED_TO_FLOAT" 
    -- ,"CHANGE_NUMBER" 
    --,"TRANSACTION_CODE" 
   -- ,"_CELONIS_CHANGE_DATE" 
    ,"_ACTIVITY_KEY" 
    )
SELECT DISTINCT
    E."SCHEMA" AS "SCHEMA" -- global job
    ,E.PRETTY_NAME AS "PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
    ,'X'
	,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
	,E.EBELN AS "EBELN"
	,E.EBELP AS "EBELP"
    ,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Einlagerung quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Einlagerung mit Differenz quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Einlagerung storniert (WM)'
    END AS "ACTIVITY_DE"
	,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Put Away Confirmed (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Put Away Confirmed with difference (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Put Away Cancelled (WM)'
    END AS "ACTIVITY_EN"
	, CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME) AS "EVENTTIME"
	, 1030 AS "_SORTING"
	, "LTAP"."QNAME" AS "USER_NAME"
    ,USR02.USTYP AS "USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_TABLE_TEXT_DE"
    -- ,"CHANGED_TABLE_TEXT_EN" 
    -- ,"CHANGED_FIELD" 
    -- ,"CHANGED_FIELD_TEXT_DE"
    -- ,"CHANGED_FIELD_TEXT_EN"
    -- ,"CHANGED_FROM" 
    -- ,"CHANGED_TO" 
    -- ,"CHANGED_FROM_FLOAT"
    -- ,"CHANGED_TO_FLOAT" 
    -- ,"CHANGE_NUMBER" 
    -- ,"TRANSACTION_CODE" 
    -- ,"_CELONIS_CHANGE_DATE" 
    , E."PRETTY_NAME"||E.MANDT || E.EBELN || E.EBELP  AS"_ACTIVITY_KEY" -- global job
FROM 
    TMP_P2P_EKKO_EKPO AS E
	INNER JOIN EKES AS EKES ON
        EKES."SCHEMA" = E."SCHEMA" -- global job
		AND EKES.MANDT = E.MANDT
        AND EKES.EBELN = E.EBELN
        AND EKES.EBELP = E.EBELP
    INNER JOIN LTAP AS LTAP ON
        'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_b9ddf35b-8fa1-4f45-a41d-c873e600ca7c' = LTAP."SCHEMA" -- link ps1090
        --AND EKES.MANDT = LTAP.MANDT
        AND EKES.VBELN = LTAP.VBELN
        AND EKES.VBELP = LTAP.POSNR
    INNER JOIN LTAK AS LTAK ON
        LTAP."SCHEMA" = LTAK."SCHEMA"
        AND LTAP.MANDT = LTAK.MANDT
        AND LTAP.LGNUM = LTAK.LGNUM
        AND LTAP.TANUM = LTAK.TANUM
    INNER JOIN USR02 AS USR02 ON
        LTAK."SCHEMA" = "USR02"."SCHEMA"
        AND LTAK.MANDT = "USR02"."MANDT"
        AND LTAK.BNAME = "USR02"."BNAME"
WHERE 
    EKES.EBTYP LIKE 'L%' 
    AND LTAP.PQUIT = 'X'
;

/*
Does not work yet. 

Habe von oben nach unten Schema inkludiert und es war ein harter 0 count überall. 

-- Query No: 4 -- Case PO without ASN but WM Put Away
INSERT INTO _CEL_P2P_ACTIVITIES (
     "SCHEMA" -- global job
    ,"PRETTY_NAME" -- global job
    ,"SC/PC"  -- global job
    ,"PS1090_WM"
	,"_CASE_KEY"
    ,"MANDT"
    ,"EBELN" 
    ,"EBELP"
    ,"ACTIVITY_DE" 
    ,"ACTIVITY_EN" 
    ,"EVENTTIME" 
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_TABLE_TEXT_DE"
    -- ,"CHANGED_TABLE_TEXT_EN" 
    -- ,"CHANGED_FIELD" 
    -- ,"CHANGED_FIELD_TEXT_DE"
    -- ,"CHANGED_FIELD_TEXT_EN"
    -- ,"CHANGED_FROM" 
    -- ,"CHANGED_TO" 
    -- ,"CHANGED_FROM_FLOAT"
    -- ,"CHANGED_TO_FLOAT" 
    -- ,"CHANGE_NUMBER" 
    --,"TRANSACTION_CODE" 
   -- ,"_CELONIS_CHANGE_DATE" 
    ,"_ACTIVITY_KEY" 
    )
SELECT DISTINCT
    E.SCHEMA AS "SCHEMA" -- global job
    ,E.PRETTY_NAME AS "PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
    ,'X'
	,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
	,E.EBELN AS "EBELN"
	,E.EBELP AS "EBELP"
    ,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Einlagerung quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Einlagerung mit Differenz quittiert (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Einlagerung storniert (WM)'
    END AS "ACTIVITY_DE"
	,CASE 
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'Put Away Confirmed (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'Put Away Confirmed with difference (WM)'
        WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'Put Away Cancelled (WM)'
    END AS "ACTIVITY_EN"
	, CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME) AS "EVENTTIME"
	, 1010 AS "_SORTING"
	, "LTAP"."QNAME" AS "USER_NAME"
    , USR02.USTYP AS "USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_TABLE_TEXT_DE"
    -- ,"CHANGED_TABLE_TEXT_EN" 
    -- ,"CHANGED_FIELD" 
    -- ,"CHANGED_FIELD_TEXT_DE"
    -- ,"CHANGED_FIELD_TEXT_EN"
    -- ,"CHANGED_FROM" 
    -- ,"CHANGED_TO" 
    -- ,"CHANGED_FROM_FLOAT"
    -- ,"CHANGED_TO_FLOAT" 
    -- ,"CHANGE_NUMBER" 
    -- ,"TRANSACTION_CODE" 
    -- ,"_CELONIS_CHANGE_DATE" 
    ,E."PRETTY_NAME"||E.MANDT || E.EBELN || E.EBELP  AS "_ACTIVITY_KEY" -- global job
FROM 
    TMP_P2P_EKKO_EKPO AS E
	INNER JOIN MSEG AS MSEG ON 
        E."SCHEMA" = MSEG."SCHEMA"
        AND E.MANDT = MSEG.MANDT
        AND E.EBELN = MSEG.EBELN
        AND E.EBELP = MSEG.EBELP
    INNER JOIN TMP_TO AS "TO" ON
        MSEG."SCHEMA" = "TO"."SCHEMA"
        AND MSEG.MANDT = "TO".MANDT
        AND MSEG.MJAHR = "TO".MJAHR
        AND MSEG.MBLNR = "TO".MBLNR
        AND MSEG.ZEILE = "TO".MBPOS
    INNER JOIN LTAP AS LTAP ON
        "TO"."SCHEMA" = LTAP."SCHEMA"
        AND "TO".MANDT = LTAP.MANDT
        AND "TO".LGNUM = LTAP.LGNUM
        AND "TO".TANUM = LTAP.TANUM
        AND "TO".TAPOS = LTAP.TAPOS
    INNER JOIN LTAK AS LTAK ON
        LTAP."SCHEMA" = LTAK."SCHEMA"
        AND LTAP.MANDT = LTAK.MANDT
        AND LTAP.LGNUM = LTAK.LGNUM
        AND LTAP.TANUM = LTAK.TANUM
    INNER JOIN USR02 AS USR02 ON
        LTAK."SCHEMA" = "USR02"."SCHEMA"
        AND LTAK.MANDT = "USR02"."MANDT"
        AND LTAK.BNAME = "USR02"."BNAME"
WHERE 
    LTAP.VBELN IS NULL
    AND LTAP.PQUIT = 'X';
*/