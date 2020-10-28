


Drop TABLE if exists TMP_TO;

-- Create Temp Table LTAK/LTAP
CREATE TABLE TMP_TO AS (

SELECT
    LTAK."SCHEMA" -- global job
    , LTAK.MANDT
    , LTAK.LGNUM
    , LTAK.TANUM
    , LTAP.TAPOS
    , LTAK.MJAHR
    , LTAK.MBLNR
    , LTAP.MBPOS
    , LTAP.VBELN
    , LTAK.BWART
    , LTAP.WERKS
    , LTAP.LGORT
FROM LTAK
JOIN LTAP ON
    LTAK."SCHEMA" = LTAP."SCHEMA"
    AND LTAK.MANDT = LTAP.MANDT
    AND LTAK.LGNUM = LTAP.LGNUM
    AND LTAK.TANUM = LTAP.TANUM
);

-- Query No: 1 -- Case PO with ASN / InBound delivery
INSERT INTO _CEL_P2P_ACTIVITIES (
     "SCHEMA" -- global job
    ,"PRETTY_NAME" -- global job
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
    -- , "LGNUM" 
    -- , "TANUM" 
    -- , "TAPOS" 
    )
SELECT DISTINCT
    E."SCHEMA" AS "SCHEMA" -- global job
    ,E.PRETTY_NAME AS "PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
	,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
	,E.EBELN AS "EBELN"
	,E.EBELP AS "EBELP"
    ,'Erstelle TA zur Einlagerung (WM)' AS "ACTIVITY_DE" 
    ,'Create Put Away TO (WM)' AS "ACTIVITY_EN" 
    ,CAST("LTAK"."BDATU" AS DATE) + CAST("LTAK"."BZEIT" AS TIME) AS "EVENTTIME" 
    ,1000 AS "_SORTING"
    ,LTAK.BNAME AS "USER_NAME"
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
    , E."PRETTY_NAME"||E.MANDT || E.EBELN || E.EBELP  AS"_ACTIVITY_KEY"
    -- , LTAP."LGNUM" AS LGNUM
    -- , LTAP."TANUM" AS TANUM
    -- , LTAP."TAPOS" AS TAPOS
FROM 
    TMP_P2P_EKKO_EKPO AS E
	INNER JOIN EKES AS EKES ON
        EKES."SCHEMA" = E."SCHEMA" -- global job
		AND EKES.MANDT = E.MANDT
        AND EKES.EBELN = E.EBELN
        AND EKES.EBELP = E.EBELP
    INNER JOIN LTAP AS LTAP ON
        EKES."SCHEMA" = LTAP."SCHEMA" -- schema ps1090
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
WHERE EKES.EBTYP LIKE 'L%'
;



-- Query No: 2 -- Case PO without ASN but WM Put Away
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
    -- , "LGNUM" 
    -- , "TANUM" 
    -- , "TAPOS"
    )
SELECT DISTINCT
    E.SCHEMA AS "SCHEMA" -- global job
    ,E.PRETTY_NAME AS "PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
	,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
	,E.EBELN AS "EBELN"
	,E.EBELP AS "EBELP"
    ,'Erstelle TA zur Einlagerung (WM)' AS "ACTIVITY_DE" 
    ,'Create Put Away TO (WM)' AS "ACTIVITY_EN" 
    ,CAST("LTAK"."BDATU" AS DATE) + CAST("LTAK"."BZEIT" AS TIME) AS "EVENTTIME" 
    ,1010 AS "_SORTING"
    ,LTAK.BNAME AS "USER_NAME"
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
    ,E."PRETTY_NAME"||E.MANDT || E.EBELN || E.EBELP  AS "_ACTIVITY_KEY" -- global job
    -- , LTAP."LGNUM" AS LGNUM
    -- , LTAP."TANUM" AS TANUM
    -- , LTAP."TAPOS" AS TAPOS
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
WHERE LTAP.VBELN IS NULL;

-- Query No: 3 -- Case PO with ASN NO WM
INSERT INTO _CEL_P2P_ACTIVITIES (
   "SCHEMA" -- global job
    ,"PRETTY_NAME" -- global job
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
    --,"USER_TYPE"
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
    ,'Einlagerung Quittiert (MM)' AS "ACTIVITY_DE" 
    ,'Put Away Confirmed (MM)' AS "ACTIVITY_EN" 
    ,CAST("VBFA"."ERDAT" AS DATE) + CAST("VBFA"."ERZET" AS TIME) AS "EVENTTIME" 
    ,1020 AS "_SORTING"
    ,'TBD from LIKP' AS "USER_NAME"
    --,'TBD from LIKP' "USER_TYPE"
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
    INNER JOIN VBFA AS VBFA ON
        EKES."SCHEMA" = VBFA."SCHEMA"
        AND EKES.MANDT = VBFA.MANDT
        AND EKES.VBELN = VBFA.VBELV
        AND EKES.VBELP = VBFA.POSNV
    -- LIKP / LIPS Table to be added and filtered on EKES to reduce extraction size 
    -- LEFT JOIN USR02 AS USR02 ON 
    --     "LIKP"."SCHEMA" = "USR02"."SCHEMA" AND -- global job
    --     LIKP.MANDT = USR02.MANDT AND
    --     LIKP.ERNAM = USR02.BNAME
    LEFT JOIN LTAK AS LTAK ON
        VBFA.SCHEMA = LTAK.SCHEMA AND
        VBFA.MANDT = LTAK.MANDT AND
        VBFA.LGNUM = LTAK.LGNUM AND
        VBFA.VBELN = LTAK.TANUM
WHERE 
    EKES.EBTYP LIKE 'L%'
    AND VBFA.VBTYP_N = 'Q'
    AND LTAK.TANUM IS NULL
;
---------------------------------PS1090 Logic-----------------------------------

-- Query No: 4 -- Case PO with ASN / InBound delivery
INSERT INTO _CEL_P2P_ACTIVITIES (
     "SCHEMA" -- global job
    ,"PRETTY_NAME" -- global job
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
    -- , "LGNUM" 
    -- , "TANUM" 
    -- , "TAPOS" 
    )
SELECT DISTINCT
    E."SCHEMA" AS "SCHEMA" -- global job
    ,E.PRETTY_NAME AS "PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
    ,'X' -- global job
	,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
	,E.EBELN AS "EBELN"
	,E.EBELP AS "EBELP"
    ,'Erstelle TA zur Einlagerung (WM)' AS "ACTIVITY_DE" 
    ,'Create Put Away TO (WM)' AS "ACTIVITY_EN" 
    ,CAST("LTAK"."BDATU" AS DATE) + CAST("LTAK"."BZEIT" AS TIME) AS "EVENTTIME" 
    ,1000 AS "_SORTING"
    ,LTAK.BNAME AS "USER_NAME"
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
    , E."PRETTY_NAME"||E.MANDT || E.EBELN || E.EBELP  AS"_ACTIVITY_KEY"
    -- , LTAP."LGNUM" AS LGNUM
    -- , LTAP."TANUM" AS TANUM
    -- , LTAP."TAPOS" AS TAPOS
FROM 
    TMP_P2P_EKKO_EKPO AS E
	INNER JOIN EKES AS EKES ON
        EKES."SCHEMA" = E."SCHEMA" -- global job
		AND EKES.MANDT = E.MANDT
        AND EKES.EBELN = E.EBELN
        AND EKES.EBELP = E.EBELP
    INNER JOIN LTAP AS LTAP ON
        'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_b9ddf35b-8fa1-4f45-a41d-c873e600ca7c' = LTAP."SCHEMA" -- schema ps1090
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
WHERE EKES.EBTYP LIKE 'L%';


-- Query No: 5 -- Case PO without ASN but WM Put Away 
/* Does not work yet

-- über die Isnull abfrage würde sonst, da keine harten information hinzugefügt werden können automatisch alles geinsert werden
Ich bin von oben nach unten alles durchgegangen ob ein bezug zu PS1090 im derzeitigen format möglich ist, 
leider nein. 

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
    -- , "LGNUM" 
    -- , "TANUM" 
    -- , "TAPOS"
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
    ,'Erstelle TA zur Einlagerung (WM)' AS "ACTIVITY_DE" 
    ,'Create Put Away TO (WM)' AS "ACTIVITY_EN" 
    ,CAST("LTAK"."BDATU" AS DATE) + CAST("LTAK"."BZEIT" AS TIME) AS "EVENTTIME" 
    ,1010 AS "_SORTING"
    ,LTAK.BNAME AS "USER_NAME"
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
    ,E."PRETTY_NAME"||E.MANDT || E.EBELN || E.EBELP  AS "_ACTIVITY_KEY" -- global job
    -- , LTAP."LGNUM" AS LGNUM
    -- , LTAP."TANUM" AS TANUM
    -- , LTAP."TAPOS" AS TAPOS
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
WHERE LTAP.VBELN IS NULL;

*/
/*

Gleicher Fall wie oben 
-- Query No: 6 -- Case PO with ASN NO WM
INSERT INTO _CEL_P2P_ACTIVITIES (
   "SCHEMA" -- global job
    ,"PRETTY_NAME" -- global job
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
    --,"USER_TYPE"
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
    ,'Einlagerung Quittiert (MM)' AS "ACTIVITY_DE" 
    ,'Put Away Confirmed (MM)' AS "ACTIVITY_EN" 
    ,CAST("VBFA"."ERDAT" AS DATE) + CAST("VBFA"."ERZET" AS TIME) AS "EVENTTIME" 
    ,1020 AS "_SORTING"
    ,'TBD from LIKP' AS "USER_NAME"
    --,'TBD from LIKP' "USER_TYPE"
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
    INNER JOIN VBFA AS VBFA ON
        'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_b9ddf35b-8fa1-4f45-a41d-c873e600ca7c' = VBFA."SCHEMA"
       -- AND EKES.MANDT = VBFA.MANDT
        AND EKES.VBELN = VBFA.VBELV
        AND EKES.VBELP = VBFA.POSNV
    -- LIKP / LIPS Table to be added and filtered on EKES to reduce extraction size 
    -- LEFT JOIN USR02 AS USR02 ON 
    --     "LIKP"."SCHEMA" = "USR02"."SCHEMA" AND -- global job
    --     LIKP.MANDT = USR02.MANDT AND
    --     LIKP.ERNAM = USR02.BNAME
    left JOIN LTAK AS LTAK ON
        'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_b9ddf35b-8fa1-4f45-a41d-c873e600ca7c'= LTAK."SCHEMA" AND
        --VBFA.MANDT = LTAK.MANDT AND
        VBFA.LGNUM = LTAK.LGNUM AND
        VBFA.VBELN = LTAK.TANUM
WHERE 
    EKES.EBTYP LIKE 'L%'
    AND VBFA.VBTYP_N = 'Q'
    AND LTAK.TANUM IS NULL
;


*/

-- No Drop Statement TMP_TO is still needed for next transformation job
