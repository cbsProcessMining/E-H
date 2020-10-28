/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: Create Purchase Order





2. Required Tables:
TMP_O2C_VBAK_VBAP
VBFA

3. Required Columns:
TMP_O2C_VBAK_VBAP.VBFA
VBFA.ERDAT
VBFA.ERZET
VBFA.MANDT
VBFA.POSNV
VBFA.VBELV
VBFA.VBTYP_N
V_ORDERS.MANDT
V_ORDERS.POSNR
V_ORDERS.VBELN
V_ORDERS._CASE_KEY

4. Columns used for timestamp:
VBFA.ERDAT
VBFA.ERZET

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
INSERT INTO "_CEL_O2C_ACTIVITIES" (
        "SCHEMA", -- Global Job
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
        "_ACTIVITY_KEY")
	SELECT
        "VBFA"."SCHEMA", -- Global Job
        "VBFA"."PRETTY_NAME", -- global job
        "VBFA"."SC/PC", -- global job
		"VBFA"."PRETTY_NAME" ||"VBFA"."MANDT" || "VBFA"."VBELV" || "VBFA"."POSNV" AS "_CASE_KEY"
        ,'Lege Bestellung an' AS "ACTIVITY_DE"
		,'Create Purchase Order' AS "ACTIVITY_EN"
        , CAST("VBFA"."ERDAT" AS DATE) + CAST("VBFA"."ERZET" AS TIME) AS "EVENTTIME"
		, 72 AS "_SORTING"
		, NULL AS "USER_NAME"
		, NULL AS "USER_TYPE"
		,"VBFA"."MANDT" AS "MANDT"
		,"VBFA"."VBELV" AS "VBELN"
		,"VBFA"."POSNV" AS "POSNR"
        ,"VBFA"."PRETTY_NAME"||"VBFA"."MANDT" || "VBFA"."VBELV" || "VBFA"."POSNV" || "VBFA"."VBELN" || "VBFA"."POSNN" || "VBFA"."VBTYP_N"  AS "_ACTIVITY_KEY" -- global job
    FROM "O2C_VBFA_V" AS "VBFA"
    WHERE 1=1
        AND "VBFA"."VBTYP_N" = 'V'; -- V is for POs
