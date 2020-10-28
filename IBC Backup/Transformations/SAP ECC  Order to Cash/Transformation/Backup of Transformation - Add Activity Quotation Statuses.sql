/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: Quotation 













2. Required Tables:
JCDS
TJ02T
TJ02T
TMP_O2C_VBAK_VBAP
TMP_O2C_VBAK_VBAP_QUOTES
USR02
VBFA

3. Required Columns:
JCDS.CHIND
JCDS.INACT
JCDS.JCDS
JCDS.MANDT
JCDS.OBJNR
JCDS.STAT
JCDS.TJ02T
JCDS.TMP_O2C_VBAK_VBAP_QUOTES
JCDS.UDATE
JCDS.USNAM
JCDS.USR02
JCDS.UTIME
JCDS.VBFA
TJ02T_DE.ISTAT
TJ02T_DE.SPRAS
TJ02T_DE.TXT30
TJ02T_EN.ISTAT
TJ02T_EN.SPRAS
TJ02T_EN.TXT30
USR02.BNAME
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
JCDS.UDATE
JCDS.UTIME

5. Parameters used in where clause:
jcdsInsert

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
    "VBFA"."PRETTY_NAME",-- global job
    "VBFA"."SC/PC", -- global job
     "VBFA"."PRETTY_NAME"||"VBFA"."MANDT" || "VBFA"."VBELN" || "VBFA"."POSNN" AS "_CASE_KEY"
	, 'Angebot ' || "TJ02T_DE"."TXT30" AS "ACTIVITY_DE"
	, 'Quotation ' || "TJ02T_EN"."TXT30" AS "ACTIVITY_EN"
	, CAST("JCDS"."UDATE" AS DATE) + CAST("JCDS"."UTIME" AS TIME) AS "EVENTTIME"
	, 30 + ROW_NUMBER() OVER (PARTITION BY "VBFA"."SCHEMA", "VBFA"."MANDT", "VBFA"."VBELN", "VBFA"."POSNN" ORDER BY "JCDS"."STAT" ASC) AS "_SORTING" -- global job
	, "JCDS"."USNAM" AS "USER_NAME"
	, "USR02"."USTYP" AS "USER_TYPE"
	, "VBFA"."MANDT" AS "MANDT"
	, "VBFA"."VBELN" AS "VBELN"
	, "VBFA"."POSNN" AS "POSNR"
    , "JCDS"."CDTCODE" AS "TRANSACTION_CODE"
    , "VBFA"."PRETTY_NAME"||"JCDS"."MANDT" || "JCDS"."OBJNR" || "JCDS"."STAT" || "JCDS"."CHGNR" AS "_ACTIVITY_KEY"
FROM
	"O2C_VBFA_N" AS "VBFA"
	JOIN "TMP_O2C_VBAK_VBAP_QUOTES" AS "V_QUOTES" ON
        "V_QUOTES"."SCHEMA" = "VBFA"."SCHEMA" AND  -- global job
		"V_QUOTES"."MANDT" = "VBFA"."MANDT" AND
		"V_QUOTES"."VBELN" = "VBFA"."VBELV" AND
		"V_QUOTES"."POSNR" = "VBFA"."POSNV"
	JOIN "JCDS" AS "JCDS" ON
        "V_QUOTES"."SCHEMA" = "JCDS"."SCHEMA" AND -- global job
		"V_QUOTES"."MANDT" = "JCDS"."MANDT" AND
		"V_QUOTES"."OBJNR" = "JCDS"."OBJNR" AND 
        "JCDS"."INACT" IS NULL AND
	    "JCDS"."CHIND" = '<%=jcdsInsert%>'
	LEFT JOIN "TJ02T" AS "TJ02T_EN" ON
        "JCDS"."SCHEMA" = "TJ02T_EN"."SCHEMA" AND -- global job
		"JCDS"."STAT" = "TJ02T_EN"."ISTAT" AND
		"TJ02T_EN"."SPRAS" = 'E'
	LEFT JOIN "TJ02T" AS "TJ02T_DE" ON
        "JCDS"."SCHEMA" = "TJ02T_DE"."SCHEMA" AND -- global job
		"JCDS"."STAT" = "TJ02T_DE"."ISTAT" AND
		"TJ02T_DE"."SPRAS" = 'D'
	LEFT JOIN "USR02" AS "USR02" ON
        "JCDS"."SCHEMA" = "USR02"."SCHEMA" AND -- global Job
		"JCDS"."MANDT" = "USR02"."MANDT" AND
		"JCDS"."USNAM" = "USR02"."BNAME";