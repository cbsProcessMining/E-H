/*DESCRIPTION:
1. Transformation Description:
This transformation creates the following activities: Create (...)













2. Required Tables:
DD07T
DD07T
TMP_O2C_VBAK_VBAP
USR02
VBFA
VBRK
VBRP

3. Required Columns:
DD07T.DD07T
DD07T.USR02
DD07T.VBFA
DD07T.VBRK
DD07T.VBRP
DD07T_DE.DDLANGUAGE
DD07T_DE.DDTEXT
DD07T_DE.DOMNAME
DD07T_DE.DOMVALUE_L
DD07T_EN.DDLANGUAGE
DD07T_EN.DDTEXT
DD07T_EN.DOMNAME
DD07T_EN.DOMVALUE_L
USR02.BNAME
USR02.MANDT
USR02.USTYP
VBFA.MANDT
VBFA.POSNN
VBFA.POSNV
VBFA.VBELN
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
VBRP.ERDAT
VBRP.ERZET

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA",
    "PRETTY_NAME",
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
    VBFA."SC/PC", -- global job
	VBFA."PRETTY_NAME"||"VBFA"."MANDT" || "VBFA"."VBELV" || "VBFA"."POSNV" AS "_CASE_KEY" -- global job
	,CASE
	    WHEN "DD07T_DE"."DDTEXT" IS NOT NULL THEN 'Erstelle ' || "DD07T_DE"."DDTEXT"
	    ELSE 'Erstelle sonstiges Rechnungsdokument'
    END AS "ACTIVITY_DE"
	,CASE
		WHEN "DD07T_EN"."DDTEXT" IS NOT NULL THEN 'Create ' || "DD07T_EN"."DDTEXT"
		ELSE 'Create Other Billing Document'
	END AS "ACTIVITY_EN"
	,CAST("VBRP"."ERDAT" AS DATE) + CAST("VBRP"."ERZET" AS TIME) AS "EVENTTIME"
	,90 AS "_SORTING"
	,"VBRP"."ERNAM" AS "USER_NAME"
	,"USR02"."USTYP" AS "USER_TYPE"
	,"VBFA"."MANDT" AS "MANDT"
	,"VBFA"."VBELV" AS "VBELN"
	,"VBFA"."POSNV" AS "POSNR"
    ,"BKPF"."TCODE" AS "TRANSACTION_CODE"
    , VBFA."PRETTY_NAME"||"VBRP"."MANDT" || "VBRP"."VBELN" || "VBRP"."POSNR" AS "_ACTIVITY_KEY"
FROM
	"O2C_VBFA_V" AS "VBFA"
	JOIN "VBRP" AS "VBRP" ON 1=1
        AND "VBFA"."SCHEMA" = "VBRP"."SCHEMA" -- global job
		AND "VBFA"."MANDT" = "VBRP"."MANDT"
		AND "VBFA"."VBELN" = "VBRP"."VBELN"
		AND "VBFA"."POSNN" = "VBRP"."POSNR"		
	JOIN "VBRK" AS "VBRK" ON 1=1
        AND "VBRP"."SCHEMA" = "VBRK"."SCHEMA" -- global job
		AND "VBRP"."MANDT" = "VBRK"."MANDT"
		AND "VBRP"."VBELN" = "VBRK"."VBELN" 	
	LEFT JOIN "DD07T" AS "DD07T_EN" ON 1=1
        AND "DD07T_EN"."SCHEMA" = "VBRK"."SCHEMA" -- global job
		AND "DD07T_EN"."DOMNAME" = 'VBTYP'
		AND "DD07T_EN"."DDLANGUAGE" = 'E'
		AND "DD07T_EN"."DOMVALUE_L" = "VBRK"."VBTYP"
	LEFT JOIN "DD07T" AS "DD07T_DE" ON 1=1
        AND "DD07T_DE"."SCHEMA" = "VBRK"."SCHEMA" -- global job
		AND "DD07T_DE"."DOMNAME" = 'VBTYP'
		AND "DD07T_DE"."DDLANGUAGE" = 'D'
		AND "DD07T_DE"."DOMVALUE_L" = "VBRK"."VBTYP"
	LEFT JOIN "USR02" AS "USR02" ON 1=1
        AND "VBRP"."SCHEMA" = "USR02"."SCHEMA" -- global job
		AND "VBRP"."MANDT" = "USR02"."MANDT"
		AND "VBRP"."ERNAM" = "USR02"."BNAME" 
	LEFT JOIN (SELECT
            "BKPF"."SCHEMA", -- global job
             "BKPF"."MANDT"
            ,"BKPF"."AWKEY"
            ,"BKPF"."AWTYP"
            ,MAX("BKPF"."TCODE") AS TCODE
        FROM  "BKPF" 
        GROUP BY "BKPF"."SCHEMA", "BKPF"."MANDT","BKPF"."AWKEY","BKPF"."AWTYP") AS "BKPF" ON 1=1 -- global job
        AND "VBRK"."SCHEMA" = "BKPF"."SCHEMA" -- global job
        AND "VBRK"."MANDT" = "BKPF"."MANDT"
		AND "VBRK"."VBELN" = "BKPF"."AWKEY"
        AND "BKPF"."AWTYP" = 'VBRK'
;