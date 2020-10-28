/*DESCRIPTION:
#########################
  S T A T E M E N T  1:
#########################
#########################
#########################
#########################
#########################
#########################
#########################

1. Transformation Description:
This transformation creates a temporary table with the following name: TCURF_TMP



1. Transformation Description:
This transformation creates a temporary table with the following name: TCURF_TMP



1. Transformation Description:
This transformation creates a temporary table with the following name: TCURF_TMP



1. Transformation Description:
This transformation creates a temporary table with the following name: TCURF_TMP



1. Transformation Description:
This transformation creates a temporary table with the following name: TCURF_TMP



1. Transformation Description:
This transformation creates a temporary table with the following name: TCURF_TMP



1. Transformation Descripti

WARNING: DESCRIPTION TOO LONG AND WAS CUT OFF!
*/
--Transform TCURF

DROP TABLE IF EXISTS "TCURF_CC";
DROP TABLE IF EXISTS "TCURF_TMP";

CREATE TABLE "TCURF_TMP" AS(
SELECT *
	,DENSE_RANK() OVER (ORDER BY 
        TCURF.SCHEMA -- Globale Anpassung 
		,TCURF."MANDT"
		,TCURF."KURST"
		,TCURF."FCURR"
		,TCURF."TCURR"
		) AS "TCURF_KEY"
	,ROW_NUMBER() OVER (PARTITION BY 
		TCURF.SCHEMA -- Globale Anpassung 
        ,TCURF."MANDT"
		,TCURF."KURST"
		,TCURF."FCURR"
		,TCURF."TCURR"
		ORDER BY (99999999-CAST(TCURF."GDATU" AS INT)) ASC) AS "TCURF_ROWNR"
FROM "TCURF" AS TCURF
WHERE 1=1 
	AND (99999999-CAST(TCURF."GDATU" as int)) >= 18000000
    AND (99999999-CAST(TCURF."GDATU" as int)) <= 20990000
);

CREATE TABLE "TCURF_CC" AS(
SELECT * 
	,CAST(LPAD(CAST((99999999-CAST("GDATU" AS INT)) AS VARCHAR(10)),8,'0') || ' ' || '00:00:00' AS TIMESTAMP) AS "VALID_START"
	,CAST(NULL AS TIMESTAMP) AS "VALID_END"
FROM "TCURF_TMP"
);

UPDATE "TCURF_CC" AS TCURF_CC
SET "VALID_END" = CAST(LPAD(CAST((99999999-CAST(TCURF_TMP."GDATU" AS INT)) AS VARCHAR(10)),8,'0') || ' ' || '00:00:00' AS TIMESTAMP) 
FROM "TCURF_TMP" AS TCURF_TMP 
WHERE 1=1
	AND TCURF_CC."TCURF_KEY" = TCURF_TMP."TCURF_KEY" 
	AND	TCURF_CC."TCURF_ROWNR" + 1 = TCURF_TMP."TCURF_ROWNR";

UPDATE "TCURF_CC" 
SET "VALID_END" = '2099-01-01' 
WHERE "VALID_END" IS NULL;

DROP TABLE IF EXISTS "TCURF_TMP";

                                                       
--Transform TCURR

DROP TABLE IF EXISTS "TCURR_CC";
DROP TABLE IF EXISTS "TCURR_TMP";

CREATE TABLE "TCURR_TMP" AS(
SELECT
    TCURR.SCHEMA -- Anpassung wegen Global Job
    ,TCURR."MANDT"
    ,TCURR."KURST"
    ,TCURR."FCURR"
    ,TCURR."TCURR"
    ,TCURR."GDATU"
    ,TCURR."UKURS"
    ,TCURR."FFACT"
    ,TCURR."TFACT"
	,DENSE_RANK() OVER (ORDER BY
        TCURR.SCHEMA -- Anpassung wegen Global Job
		,TCURR."MANDT"
		,TCURR."KURST"
		,TCURR."FCURR"
		,TCURR."TCURR"
		) AS "TCURR_KEY"
	,ROW_NUMBER() OVER (PARTITION BY 
		TCURR.SCHEMA -- Anpassung wegen Global Job
        ,TCURR."MANDT"
		,TCURR."KURST"
		,TCURR."FCURR"
		,TCURR."TCURR"
		ORDER BY (99999999-CAST(TCURR."GDATU" AS INT)) ASC) AS "TCURR_ROWNR"
FROM "TCURR" AS TCURR
WHERE 1=1 
	AND (99999999-CAST(TCURR."GDATU" AS INT)) >= 18000000
    AND (99999999-CAST(TCURR."GDATU" AS INT)) <= 20990000
);

CREATE TABLE "TCURR_CC" AS(
SELECT * 
	,CAST(LPAD(CAST((99999999-cast("GDATU" AS INT)) AS VARCHAR(10)),8,'0') || ' ' || '00:00:00' AS TIMESTAMP) AS "VALID_START"
	,CAST(NULL AS TIMESTAMP) AS "VALID_END"
FROM "TCURR_TMP"
);

UPDATE "TCURR_CC"  AS TCURR_CC
SET "VALID_END" = CAST(LPAD(CAST((99999999-CAST(TCURR_TMP."GDATU" AS INT)) AS VARCHAR(10)),8,'0') || ' ' || '00:00:00' AS timestamp) 
FROM "TCURR_TMP" AS TCURR_TMP
WHERE 1=1
	AND TCURR_CC."TCURR_KEY" = TCURR_TMP."TCURR_KEY"  
	AND TCURR_CC."TCURR_ROWNR" + 1=TCURR_TMP."TCURR_ROWNR";

UPDATE "TCURR_CC" AS TCURR_CC
SET "VALID_END" = '2099-01-01' 
WHERE "VALID_END" IS NULL;

DROP TABLE IF EXISTS "TCURR_TMP";


--Create temp table with converted net order value

DROP TABLE IF EXISTS "VBAP_CURR_TMP";
CREATE TABLE "VBAP_CURR_TMP" AS(
    SELECT
    "VBAP"."SCHEMA" -- Globale Anpassung 
    ,"VBAP"."MANDT"
    ,"VBAP"."VBELN"
    ,"VBAP"."POSNR"
    ,CASE 
        WHEN "VBAP"."WAERK" = '<%=currency%>' THEN "VBAP"."NETWR"*COALESCE("TCURX"."TDEC",1) 
        WHEN "TCURR_CC"."UKURS" < 0 THEN ("VBAP"."NETWR"*COALESCE("TCURX"."TDEC",1))*(1/ABS(TCURR_CC.UKURS)/(CASE WHEN COALESCE(TCURF_CC.FFACT, TCURR_CC.FFACT, 0) = 0 THEN 1 ELSE COALESCE(TCURF_CC.FFACT, TCURR_CC.FFACT) END))*(CASE WHEN COALESCE(TCURF_CC.TFACT, TCURR_CC.TFACT, 0) = 0 THEN 1 ELSE COALESCE(TCURF_CC.TFACT, TCURR_CC.TFACT) END)
        WHEN "TCURR_CC"."UKURS" > 0 THEN ("VBAP"."NETWR"*COALESCE("TCURX"."TDEC",1))*(TCURR_CC.UKURS/CASE WHEN COALESCE(TCURF_CC.FFACT, TCURR_CC.FFACT, 0) = 0 THEN 1 ELSE COALESCE(TCURF_CC.FFACT, TCURR_CC.FFACT) END*CASE WHEN COALESCE(TCURF_CC.TFACT, TCURR_CC.TFACT, 0) = 0 THEN 1 ELSE COALESCE(TCURF_CC.TFACT, TCURR_CC.TFACT) END)  
    END AS "NETWR_CONVERTED"
    FROM "VBAP"
    LEFT JOIN "TCURR_CC" AS "TCURR_CC" ON 1=1
            AND "TCURR_CC"."SCHEMA" = "VBAP"."SCHEMA" -- Globale Anpassung 
            AND "TCURR_CC"."MANDT" = "VBAP"."MANDT"
            AND "TCURR_CC"."TCURR" = '<%=currency%>'
            AND "TCURR_CC"."FCURR" = "VBAP"."WAERK"
            AND "TCURR_CC"."KURST" = '<%=exchangeRateType%>'
            AND "VBAP"."ERDAT" >= "TCURR_CC"."VALID_START" AND "VBAP"."ERDAT" < "TCURR_CC"."VALID_END"
    LEFT JOIN "TCURF_CC" AS "TCURF_CC" ON 1=1
            AND "TCURR_CC"."SCHEMA" = TCURF_CC."SCHEMA" -- Globale Anpassung 
            AND "TCURR_CC"."MANDT" = "TCURF_CC"."MANDT"
            AND "TCURR_CC"."TCURR" = "TCURF_CC"."TCURR"
            AND "TCURR_CC"."FCURR" = "TCURF_CC"."FCURR"
            AND "TCURR_CC"."KURST" = "TCURF_CC"."KURST"
            AND "VBAP"."ERDAT" >= "TCURF_CC"."VALID_START" AND "VBAP"."ERDAT" < "TCURF_CC"."VALID_END"
    LEFT JOIN (
            SELECT "SCHEMA", -- Globale Anpassung Schema
                "TCURX"."CURRKEY"
                ,CAST("TCURX"."CURRDEC" AS INT) AS "CURRDEC"
                ,POWER(CAST(10 AS FLOAT),(2-"CURRDEC")) AS "TDEC" 
            FROM "TCURX") AS "TCURX" ON 1=1
            AND "TCURR_CC"."FCURR" = "TCURX"."CURRKEY" 
            AND TCURR_CC."SCHEMA" = TCURX."SCHEMA" -- Globale Anpassung Schema
);

