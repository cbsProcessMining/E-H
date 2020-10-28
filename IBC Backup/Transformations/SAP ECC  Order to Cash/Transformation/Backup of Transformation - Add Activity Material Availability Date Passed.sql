/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: Material Availability Date passed













2. Required Tables:
TMP_O2C_VBAK_VBAP
USR02
VBEP

3. Required Columns:
TMP_O2C_VBAK_VBAP.USR02
USR02.BNAME
USR02.MANDT
USR02.USTYP
VBEP.MANDT
VBEP.MBDAT
VBEP.MBUHR
VBEP.POSNR
VBEP.VBELN
V_ORDERS.ERNAM
V_ORDERS.MANDT
V_ORDERS.POSNR
V_ORDERS.VBELN
V_ORDERS._CASE_KEY

4. Columns used for timestamp:
VBEP.MBDAT
VBEP.MBUHR

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
	"MANDT",
	"VBELN",
	"POSNR",
    "_ACTIVITY_KEY")

SELECT
    "V_ORDERS"."SCHEMA", -- global job
    "V_ORDERS"."PRETTY_NAME", -- global job
    "V_ORDERS"."SC/PC", -- global job
	"V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
	, 'Materialverfügbarkeitsdatum überschritten' AS "ACTIVITY_DE"
	, 'Material Availability Date passed' AS "ACTIVITY_EN"
	, VBEP.EVENTTIME AS "EVENTTIME"
	, 150 AS "_SORTING"
	,"V_ORDERS"."MANDT" AS "MANDT"
	,"V_ORDERS"."VBELN" AS "VBELN"
	,"V_ORDERS"."POSNR" AS "POSNR"
    , "V_ORDERS"."PRETTY_NAME"||VBEP.MANDT || VBEP.VBELN || VBEP.POSNR  AS "_ACTIVITY_KEY" -- global job
FROM
	"TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
    JOIN (SELECT
            "VBEP"."SCHEMA", -- global job
             VBEP.MANDT
            ,VBEP.VBELN 
            ,VBEP.POSNR
            ,MAX(CAST("VBEP"."MBDAT" AS DATE) + CAST("VBEP"."MBUHR" AS TIME)) AS EVENTTIME
        FROM VBEP
        GROUP BY "VBEP"."SCHEMA", VBEP.MANDT,VBEP.VBELN,VBEP.POSNR) -- global job
        AS VBEP ON 1=1
        AND V_ORDERS.SCHEMA = "VBEP"."SCHEMA" -- global job
        AND V_ORDERS.MANDT = VBEP.MANDT
        AND V_ORDERS.VBELN = VBEP.VBELN 
        AND V_ORDERS.POSNR = VBEP.POSNR;