/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: Sales Order 













2. Required Tables:
JCDS
TJ02T
TJ02T
TMP_O2C_VBAK_VBAP
USR02

3. Required Columns:
JCDS.CHIND
JCDS.INACT
JCDS.JCDS
JCDS.MANDT
JCDS.OBJNR
JCDS.STAT
JCDS.TJ02T
JCDS.UDATE
JCDS.USNAM
JCDS.USR02
JCDS.UTIME
TJ02T_DE.ISTAT
TJ02T_DE.SPRAS
TJ02T_DE.TXT30
TJ02T_EN.ISTAT
TJ02T_EN.SPRAS
TJ02T_EN.TXT30
USR02.BNAME
USR02.MANDT
USR02.USTYP
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
    "V_ORDERS"."SCHEMA", -- global job
    "V_ORDERS"."PRETTY_NAME", -- global job
    "V_ORDERS"."SC/PC", -- global job
	"V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
	, 'Auftrag ' || "TJ02T_DE"."TXT30" AS "ACTIVITY_DE"
	, 'Sales Order ' || "TJ02T_EN"."TXT30" AS "ACTIVITY_EN"
	, CAST("JCDS"."UDATE" AS DATE) + CAST("JCDS"."UTIME" AS TIME) AS "EVENTTIME"
	, 40 + ROW_NUMBER() OVER (PARTITION BY "V_ORDERS"."SCHEMA", "V_ORDERS"."MANDT", "V_ORDERS"."VBELN", "V_ORDERS"."POSNR" ORDER BY "JCDS"."STAT" ASC) AS "_SORTING" -- global job
	, "JCDS"."USNAM" AS "USER_NAME"
	, "USR02"."USTYP" AS "USER_TYPE"
	,"V_ORDERS"."MANDT" AS "MANDT"
	,"V_ORDERS"."VBELN" AS "VBELN"
	,"V_ORDERS"."POSNR" AS "POSNR"
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
    ,"V_ORDERS"."PRETTY_NAME"||"JCDS"."MANDT" || "JCDS"."OBJNR" || "JCDS"."STAT" || "JCDS"."CHGNR" AS "_ACTIVITY_KEY" -- global job
FROM
	"TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
	JOIN "JCDS" AS "JCDS" ON
        "V_ORDERS"."SCHEMA" = "JCDS"."SCHEMA" AND -- global job
		"V_ORDERS"."MANDT" = "JCDS"."MANDT" AND
		"V_ORDERS"."OBJNR" = "JCDS"."OBJNR" AND 
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
        "JCDS"."SCHEMA" = "USR02"."SCHEMA" AND -- global job
		"JCDS"."MANDT" = "USR02"."MANDT" AND
		"JCDS"."USNAM" = "USR02"."BNAME"
;