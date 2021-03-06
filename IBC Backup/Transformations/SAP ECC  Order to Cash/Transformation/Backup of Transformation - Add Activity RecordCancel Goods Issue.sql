/*DESCRIPTION:
1. Transformation Description:
This transformation creates the following activities: Record Goods Issue, Cancel Goods Issue













2. Required Tables:
LIKP
LIPS
MKPF
TMP_O2C_VBAK_VBAP
USR02
VBFA
VBFA

3. Required Columns:
LIKP.LIKP
LIKP.LIPS
LIKP.MANDT
LIKP.MKPF
LIKP.USR02
LIKP.VBELN
LIKP.VBFA
LIPS.MANDT
LIPS.POSNR
LIPS.VBELN
MKPF.MANDT
MKPF.MBLNR
MKPF.MJAHR
MKPF.USNAM
USR02.BNAME
USR02.MANDT
USR02.USTYP
VBFA_DEL.MANDT
VBFA_DEL.POSNN
VBFA_DEL.POSNV
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
VBFA_GI.ERDAT
VBFA_GI.ERZET

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
    "ACTIVITY_DETAIL_DE",
	"ACTIVITY_EN",
    "ACTIVITY_DETAIL_EN",
	"EVENTTIME",
	"_SORTING", 
	"USER_NAME", 
	"USER_TYPE",
	"MANDT",
	"VBELN",
	"POSNR",
    "TRANSACTION_CODE",
    "_ACTIVITY_KEY")
SELECT DISTINCT
    VBFA_DEL."SCHEMA",  -- global job
    "VBFA_DEL"."PRETTY_NAME", -- global job
    VBFA_DEL."SC/PC", -- global job
 	 "VBFA_DEL"."PRETTY_NAME"||"VBFA_DEL"."MANDT" || "VBFA_DEL"."VBELV" || "VBFA_DEL"."POSNV" AS "_CASE_KEY" -- global job
 	,CASE
 	    WHEN "VBFA_GI"."VBTYP_N" = 'R' AND "LIKP"."VBTYP" = 'T' THEN 'Erfasse Retoureneingang'
        WHEN "VBFA_GI"."VBTYP_N" = 'R' THEN 'Erfasse Warenausgang'
 	    WHEN "VBFA_GI"."VBTYP_N" = 'h' THEN 'Storniere Warenausgang' 
 	END AS "ACTIVITY_DE"
    ,'Bewegungsnr: ' ||VBFA_DEL."PRETTY_NAME"|| "VBFA_GI"."MANDT" || "VBFA_GI"."VBELN" || "VBFA_GI"."POSNN" AS "ACTIVITY_DETAIL_DE" -- global job
 	,CASE
 	    WHEN "VBFA_GI"."VBTYP_N" = 'R' AND "LIKP"."VBTYP" = 'T' THEN 'Record Return Goods Receipt'
        WHEN "VBFA_GI"."VBTYP_N" = 'R' THEN 'Record Goods Issue'
 	    WHEN "VBFA_GI"."VBTYP_N" = 'h' THEN 'Cancel Goods Issue'
 	END AS "ACTIVITY_EN"
    ,'Movement ID: ' ||VBFA_DEL."PRETTY_NAME"|| "VBFA_GI"."MANDT" || "VBFA_GI"."VBELN" || "VBFA_GI"."POSNN" AS "ACTIVITY_DETAIL_EN" -- global job
	, CAST("VBFA_GI"."ERDAT" AS DATE) + CAST("VBFA_GI"."ERZET" AS TIME) AS "EVENTTIME"
	,80 +
	CASE
 	    WHEN "VBFA_GI"."VBTYP_N" = 'R' THEN 1
 	    WHEN "VBFA_GI"."VBTYP_N" = 'h' THEN 2
 	END AS "_SORTING"
	,"MKPF"."USNAM" AS "USER_NAME"
	,"USR02"."USTYP" AS "USER_TYPE"
	,"VBFA_DEL"."MANDT" AS "MANDT"
	,"VBFA_DEL"."VBELV" AS "VBELN"
	,"VBFA_DEL"."POSNV" AS "POSNR"
    ,"MKPF"."TCODE2" AS "TRANSACTION_CODE"
    , VBFA_DEL."PRETTY_NAME"||"VBFA_GI"."MANDT" || "VBFA_GI"."VBELV" || "VBFA_GI"."POSNV" || "VBFA_GI"."VBELN" || "VBFA_GI"."POSNN" || "VBFA_GI"."VBTYP_N" AS "_ACTIVITY_KEY" -- global job
FROM
	"O2C_VBFA_V" AS "VBFA_DEL"
	JOIN "LIPS" AS "LIPS" ON 
        "VBFA_DEL"."SCHEMA" = "LIPS"."SCHEMA" AND -- global job 
		"VBFA_DEL"."MANDT" = "LIPS"."MANDT" AND
		"VBFA_DEL"."VBELN" = "LIPS"."VBELN" AND
		"VBFA_DEL"."POSNN" = "LIPS"."POSNR" 
	JOIN "LIKP" AS "LIKP" ON
        "LIPS"."SCHEMA" = "LIKP"."SCHEMA" AND -- global job
		"LIPS"."MANDT" = "LIKP"."MANDT" AND
		"LIPS"."VBELN" = "LIKP"."VBELN" 
    JOIN "VBFA" AS "VBFA_GI" ON
        "LIPS"."SCHEMA" = "VBFA_GI"."SCHEMA" AND -- global job
		"LIPS"."MANDT" = "VBFA_GI"."MANDT" AND
		"LIPS"."VBELN" = "VBFA_GI"."VBELV" AND
		"LIPS"."POSNR" = "VBFA_GI"."POSNV" AND
        "VBFA_GI"."VBTYP_N" IN ('R', 'h') AND 
        "VBFA_GI"."RFMNG" > 0 
	LEFT JOIN "MKPF" AS "MKPF" ON
        "VBFA_GI"."SCHEMA" = "MKPF"."SCHEMA" AND -- global job
		"VBFA_GI"."MANDT" = "MKPF"."MANDT" AND
		"VBFA_GI"."VBELN" = "MKPF"."MBLNR" AND
        "VBFA_GI"."MJAHR"= "MKPF"."MJAHR"
	LEFT JOIN "USR02" AS "USR02" ON 1=1
        AND "MKPF"."SCHEMA" = "USR02"."SCHEMA" -- global job
		AND "MKPF"."MANDT" = "USR02"."MANDT"
		AND "MKPF"."USNAM" = "USR02"."BNAME"
;