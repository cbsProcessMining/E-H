/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: <% = activityNameCreateSOItem %>













2. Required Tables:
TMP_O2C_VBAK_VBAP
USR02

3. Required Columns:
TMP_O2C_VBAK_VBAP.USR02
USR02.BNAME
USR02.MANDT
USR02.USTYP
V_ORDERS.ERDAT
V_ORDERS.ERNAM
V_ORDERS.ERZET
V_ORDERS.MANDT
V_ORDERS.POSNR
V_ORDERS.VBELN
V_ORDERS._CASE_KEY

4. Columns used for timestamp:
V_ORDERS.ERDAT
V_ORDERS.ERZET

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global Job
    "PRETTY_NAME", -- global job
    "SC/PC",
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
    "V_ORDERS"."SCHEMA"-- global Job
    ,"V_ORDERS"."PRETTY_NAME" -- global job
    ,"V_ORDERS"."SC/PC" -- global job
	,"V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
	, 'Lege Auftragsposition an' AS "ACTIVITY_DE"
	, '<%= activityNameCreateSOItem %>' AS "ACTIVITY_EN"
	, CAST("V_ORDERS"."ERDAT" AS DATE) + CAST("V_ORDERS"."ERZET" AS TIME) AS "EVENTTIME"
	, 20 AS "_SORTING"
	, "V_ORDERS"."ERNAM" AS "USER_NAME"
	, "USR02"."USTYP" AS "USER_TYPE"
	,"V_ORDERS"."MANDT" AS "MANDT"
	,"V_ORDERS"."VBELN" AS "VBELN"
	,"V_ORDERS"."POSNR" AS "POSNR"
    ,"V_CHANGES"."TCODE" AS "TRANSACTION_CODE"
    , "V_ORDERS"."PRETTY_NAME"||"V_ORDERS"."MANDT" || "V_ORDERS"."VBELN" || "V_ORDERS"."POSNR" AS "_ACTIVITY_KEY" -- global job
FROM
	"TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
	LEFT JOIN "USR02" AS "USR02" ON
        "V_ORDERS"."SCHEMA" = "USR02"."SCHEMA" AND -- global Job
		"V_ORDERS"."MANDT" = "USR02"."MANDT" AND
		"V_ORDERS"."ERNAM" = "USR02"."BNAME"
    LEFT JOIN (SELECT "SCHEMA", --global Job
             "TABKEY"
            ,MAX("TCODE") AS "TCODE"
        FROM "TMP_O2C_CDHDR_CDPOS"
        GROUP BY "TABKEY", "SCHEMA") AS "V_CHANGES" ON 1=1
	    AND "V_ORDERS"."MANDT" || "V_ORDERS"."VBELN" || "V_ORDERS"."POSNR" = "V_CHANGES"."TABKEY"  -- erweiterte Anpassung, da im case key nun system im schlüssel hat
        AND "V_ORDERS"."SCHEMA" = "V_CHANGES"."SCHEMA" -- global job
;