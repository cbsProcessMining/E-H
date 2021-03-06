/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: Clear Invoice













2. Required Tables:
BKPF
BKPF
BSEG
TMP_O2C_VBAK_VBAP
USR02
VBFA
VBRK
VBRP

3. Required Columns:
BKPF.BKPF
BKPF.BSEG
BKPF.USR02
BKPF.VBFA
BKPF.VBRK
BKPF.VBRP
BKPF_INV.AWKEY
BKPF_INV.AWTYP
BKPF_INV.BELNR
BKPF_INV.BUKRS
BKPF_INV.GJAHR
BKPF_INV.MANDT
BKPF_PAY.BELNR
BKPF_PAY.BUKRS
BKPF_PAY.CPUDT
BKPF_PAY.GJAHR
BKPF_PAY.MANDT
BKPF_PAY.USNAM
BSEG_INV.AUGBL
BSEG_INV.AUGDT
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
BKPF_PAY.CPUDT

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
	"USER_NAME",
	"USER_TYPE",
    "TRANSACTION_CODE",
    "_ACTIVITY_KEY")
SELECT
        "VBFA"."SCHEMA", -- global job
        "VBFA"."PRETTY_NAME", -- global job
        "VBFA"."SC/PC", -- global job
		"VBFA"."PRETTY_NAME"||"VBFA"."MANDT" || "VBFA"."VBELV" || "VBFA"."POSNV"  AS "_CASE_KEY" -- global job
		, CASE
            WHEN "VBFA"."VBTYP_N" = 'O' THEN 'Erstatte Gutschrift'
            WHEN "VBFA"."VBTYP_N" = 'M' THEN 'Gleiche Rechnung aus'
          END AS "ACTIVITY_DE"
        , CASE
            WHEN "VBFA"."VBTYP_N" = 'O' THEN 'Clear Credit Memo'
            WHEN "VBFA"."VBTYP_N" = 'M' THEN 'Clear Invoice'
          END AS "ACTIVITY_EN"
		, CAST("BKPF_PAY"."CPUDT" AS DATE) + CAST("BKPF_PAY"."CPUTM" AS TIME) AS "EVENTTIME"
		, 100 AS "_SORTING"
		,"VBFA"."MANDT" AS "MANDT"
		,"VBFA"."VBELV" AS "VBELN"
		,"VBFA"."POSNV" AS "POSNR"
		,"BKPF_PAY"."USNAM" AS "USER_NAME"
		,"USR02"."USTYP" AS "USER_TYPE"
        ,"BKPF_INV"."TCODE" AS "TRANSACTION_CODE"
        ,"VBFA"."PRETTY_NAME"||"BKPF_PAY"."MANDT" || "BKPF_PAY"."BUKRS" || "BKPF_PAY"."BELNR" ||"BKPF_PAY"."GJAHR" AS "_ACTIVITY_KEY" -- global job
FROM 
    "O2C_VBFA_V" AS "VBFA"
	JOIN "VBRP" AS "VBRP" ON 1=1
        AND "VBFA"."SCHEMA" = "VBRP"."SCHEMA" -- global job
		AND "VBFA"."MANDT" = "VBRP"."MANDT"
		AND "VBFA"."VBELN" = "VBRP"."VBELN"
		AND "VBFA"."POSNN" = "VBRP"."POSNR"
        AND "VBFA"."VBTYP_N" IN ('O','M')
	JOIN "VBRK" AS "VBRK" ON 1=1
        AND "VBRP"."SCHEMA" = "VBRK"."SCHEMA" -- global job
		AND "VBRP"."MANDT" = "VBRK"."MANDT"
		AND "VBRP"."VBELN" = "VBRK"."VBELN"
	JOIN "BKPF" AS "BKPF_INV" ON 1=1
        AND "VBRK"."SCHEMA" = "BKPF_INV"."SCHEMA" -- global job
		AND "VBRK"."MANDT" = "BKPF_INV"."MANDT"
		AND "VBRK"."VBELN" = "BKPF_INV"."AWKEY"
		AND "BKPF_INV"."AWTYP" = 'VBRK'
	JOIN "BSAD_C" AS "BSAD_INV" ON 1=1
        AND "BSAD_INV"."SCHEMA" = "BKPF_INV"."SCHEMA" -- global job
		AND "BSAD_INV"."MANDT" = "BKPF_INV"."MANDT"
		AND "BSAD_INV"."BUKRS" = "BKPF_INV"."BUKRS"
		AND "BSAD_INV"."BELNR" = "BKPF_INV"."BELNR"
		AND "BSAD_INV"."GJAHR" = "BKPF_INV"."GJAHR" 
	JOIN "BKPF" AS "BKPF_PAY" ON 1=1
        AND "BSAD_INV"."SCHEMA" = "BKPF_PAY"."SCHEMA" -- global job
		AND "BSAD_INV"."MANDT" = "BKPF_PAY"."MANDT"
		AND "BSAD_INV"."BUKRS" = "BKPF_PAY"."BUKRS"
		AND "BSAD_INV"."AUGBL" = "BKPF_PAY"."BELNR"
		AND "BSAD_INV"."AUGGJ" = "BKPF_PAY"."GJAHR"
	LEFT JOIN "USR02" AS "USR02" ON 1=1
        AND "BKPF_PAY"."SCHEMA" = "USR02"."SCHEMA" -- global job
		AND "BKPF_PAY"."MANDT" = "USR02"."MANDT"
		AND "BKPF_PAY"."USNAM" = "USR02"."BNAME";