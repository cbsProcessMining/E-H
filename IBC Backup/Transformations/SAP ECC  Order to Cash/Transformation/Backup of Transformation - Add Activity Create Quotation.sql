/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: Create Quotation













2. Required Tables:
TMP_O2C_VBAK_VBAP
TMP_O2C_VBAK_VBAP_QUOTES
USR02
VBFA

3. Required Columns:
TMP_O2C_VBAK_VBAP.TMP_O2C_VBAK_VBAP_QUOTES
TMP_O2C_VBAK_VBAP.USR02
TMP_O2C_VBAK_VBAP.VBFA
USR02.BNAME
USR02.MANDT
USR02.USTYP
VBFA.MANDT
VBFA.POSNN
VBFA.POSNV
VBFA.VBELN
VBFA.VBELV
V_ORDERS.MANDT
V_ORDERS.POSNR
V_ORDERS.VBELN
V_ORDERS._CASE_KEY
V_QUOTES.ERDAT
V_QUOTES.ERNAM
V_QUOTES.ERZET
V_QUOTES.MANDT
V_QUOTES.POSNR
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
V_QUOTES.ERDAT
V_QUOTES.ERZET

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
    "VBFA"."SCHEMA" as "SCHEMA" -- global job
    ,"MAP"."PRETTY_NAME" -- global job
    ,"MAP"."SC/PC" -- global job
	,"MAP"."PRETTY_NAME"|| "VBFA"."MANDT" || "VBFA"."VBELN" || "VBFA"."POSNN" AS "_CASE_KEY" -- global job
	, 'Lege Angebot an' AS "ACTIVITY_DE"
	, 'Create Quotation' AS "ACTIVITY_EN"
	, CAST("V_QUOTES"."ERDAT" AS DATE) + CAST("V_QUOTES"."ERZET" AS TIME) AS "EVENTTIME"
	, 10 AS "_SORTING"
	, "V_QUOTES"."ERNAM" AS "USER_NAME"
	, "USR02"."USTYP" AS "USER_TYPE"
	, "VBFA"."MANDT" AS "MANDT"
	, "VBFA"."VBELN" AS "VBELN"
	, "VBFA"."POSNN" AS "POSNR"
    , "V_CHANGES"."TCODE" AS "TRANSACTION_CODE"
    , MAP."PRETTY_NAME"||"V_QUOTES"."MANDT" || "V_QUOTES"."VBELN" || "V_QUOTES"."POSNR" AS "_ACTIVITY_KEY" -- global job
FROM
	"O2C_VBFA_N" AS "VBFA"
    JOIN "SCHEMA_xlsx_MD" as "MAP" on -- global job
        VBFA."SCHEMA" = "MAP"."SCHEMA"
	JOIN "TMP_O2C_VBAK_VBAP_QUOTES" AS "V_QUOTES" ON 1=1
        AND "V_QUOTES"."SCHEMA" = VBFA."SCHEMA" -- global Job
		AND "V_QUOTES"."MANDT" = "VBFA"."MANDT" 
		AND "V_QUOTES"."VBELN" = "VBFA"."VBELV"
		AND "V_QUOTES"."POSNR" = "VBFA"."POSNV"
    LEFT JOIN "USR02" AS "USR02" ON 1=1
        AND V_QUOTES."SCHEMA" = USR02."SCHEMA" -- global Job
		AND "V_QUOTES"."MANDT" = "USR02"."MANDT" 
		AND "V_QUOTES"."ERNAM" = "USR02"."BNAME"
    LEFT JOIN (SELECT
            "SCHEMA" -- global Job
            ,"TABKEY"
            ,MAX("TCODE") AS "TCODE"
            FROM "TMP_O2C_CDHDR_CDPOS"
            GROUP BY "TABKEY","SCHEMA") AS "V_CHANGES" ON 1=1
	    AND "VBFA"."MANDT" || "VBFA"."VBELN" || "VBFA"."POSNN" = "V_CHANGES"."TABKEY"
        AND VBFA."SCHEMA" = V_CHANGES."SCHEMA" -- global Job
;