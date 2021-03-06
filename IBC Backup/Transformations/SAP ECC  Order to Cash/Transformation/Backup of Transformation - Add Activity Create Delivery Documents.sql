/*DESCRIPTION:
1. Transformation Description:
This transformation creates the following activities: Create (...)













2. Required Tables:
DD07T
DD07T
LIKP
LIPS
TMP_O2C_VBAK_VBAP
USR02
VBFA

3. Required Columns:
DD07T.DD07T
DD07T.LIKP
DD07T.LIPS
DD07T.USR02
DD07T.VBFA
DD07T_DE.DDLANGUAGE
DD07T_DE.DDTEXT
DD07T_DE.DOMNAME
DD07T_DE.DOMVALUE_L
DD07T_EN.DDLANGUAGE
DD07T_EN.DDTEXT
DD07T_EN.DOMNAME
DD07T_EN.DOMVALUE_L
LIKP.ERNAM
LIKP.MANDT
LIKP.VBELN
LIKP.VBTYP
LIPS.ERDAT
LIPS.ERZET
LIPS.MANDT
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
LIPS.ERDAT
LIPS.ERZET

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
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
	"POSNR",
    "TRANSACTION_CODE",
    "_ACTIVITY_KEY")
SELECT
    "VBFA"."SCHEMA", -- global job
    "VBFA"."PRETTY_NAME", -- global job
    "VBFA"."SC/PC", -- global job
	VBFA."PRETTY_NAME" || "VBFA"."MANDT" || "VBFA"."VBELV" || "VBFA"."POSNV" AS "_CASE_KEY" -- global job
	,CASE
	    WHEN "DD07T_DE"."DDTEXT" IS NOT NULL THEN 'Erstelle ' || "DD07T_DE"."DDTEXT"
	    ELSE 'Erstelle sonstiges Lieferdokument'
    END AS "ACTIVITY_DE"
	,CASE
		WHEN "DD07T_EN"."DDTEXT" IS NOT NULL THEN 'Create ' || "DD07T_EN"."DDTEXT"
		ELSE 'Create Other Delivery Document'
	END AS "ACTIVITY_EN"
	, CAST("LIPS"."ERDAT" AS DATE) + CAST("LIPS"."ERZET" AS TIME) AS "EVENTTIME"
	, 71 AS "_SORTING"
	, "LIKP"."ERNAM" AS "USER_NAME"
	, "USR02"."USTYP" AS "USER_TYPE"
	, "VBFA"."MANDT" AS "MANDT"
	, "VBFA"."VBELV" AS "VBELN"
	, "VBFA"."POSNV" AS "POSNR"
    , "LIKP"."TCODE" AS "TRANSACTION_CODE" 
    , VBFA."PRETTY_NAME"||"LIPS"."MANDT" || "LIPS"."VBELN" || "LIPS"."POSNR" AS "_ACTIVITY_KEY"
FROM 
    "O2C_VBFA_V" AS "VBFA"
	JOIN "LIPS" AS "LIPS" ON 1=1
        AND "VBFA"."SCHEMA" = "LIPS"."SCHEMA" -- global job 
        AND "VBFA"."MANDT" = "LIPS"."MANDT"
		AND "VBFA"."VBELN" = "LIPS"."VBELN"
		AND "VBFA"."POSNN" = "LIPS"."POSNR" 
	JOIN "LIKP" AS "LIKP" ON 1=1
        AND "LIPS"."SCHEMA" = "LIKP"."SCHEMA" -- global job
		AND "LIPS"."MANDT" = "LIKP"."MANDT"
		AND "LIPS"."VBELN" = "LIKP"."VBELN" 
        AND "LIPS"."ERDAT" IS NOT NULL   
	LEFT JOIN "DD07T" AS "DD07T_EN" ON 1=1
        AND DD07T_EN."SCHEMA" = "LIKP"."SCHEMA"-- global job
		AND "DD07T_EN"."DOMNAME" = 'VBTYP'
		AND "DD07T_EN"."DDLANGUAGE" = 'E'
		AND "DD07T_EN"."DOMVALUE_L" = "LIKP"."VBTYP"
	LEFT JOIN "DD07T" AS "DD07T_DE" ON 1=1
        AND "DD07T_DE"."SCHEMA" = "LIKP"."SCHEMA" -- global job
		AND "DD07T_DE"."DOMNAME" = 'VBTYP'
		AND "DD07T_DE"."DDLANGUAGE" = 'D'
		AND "DD07T_DE"."DOMVALUE_L" = "LIKP"."VBTYP"
	LEFT JOIN "USR02" AS "USR02" ON 1=1
        AND "LIKP"."SCHEMA" = "USR02"."SCHEMA" -- global job
		AND "LIKP"."MANDT" = "USR02"."MANDT"
		AND "LIKP"."ERNAM" = "USR02"."BNAME";