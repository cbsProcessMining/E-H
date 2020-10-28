/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_KNB1"













2. Required Tables:
KNB1
VBAK
_CEL_O2C_CASES

3. Required Columns:
C.MANDT
C.VBELN
KNB1.BUKRS
KNB1.DATLZ
KNB1.ERDAT
KNB1.KNB1
KNB1.KUNNR
KNB1.MANDT
KNB1.UPDAT
KNB1.VBAK
KNB1.VERDT
KNB1.ZINDT
KNB1._CEL_O2C_CASES
VBAK.BUKRS_VF
VBAK.KUNNR
VBAK.MANDT
VBAK.VBELN

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
-- Query 1
DROP VIEW IF EXISTS "O2C_KNB1";

-- Query 2
CREATE VIEW "O2C_KNB1" AS (
	SELECT 
        "KNB1".*,
        MAP."PRETTY_NAME",
        MAP."SC/PC", -- global job 
        CAST("KNB1"."DATLZ" AS DATE) AS "TS_DATLZ",
        CAST("KNB1"."ERDAT" AS DATE) AS "TS_ERDAT",
        CAST("KNB1"."UPDAT" AS DATE) AS "TS_UPDAT",
        CAST("KNB1"."VERDT" AS DATE) AS "TS_VERDT",
        CAST("KNB1"."ZINDT" AS DATE) AS "TS_ZINDT"
	FROM "KNB1" AS "KNB1"
    join "SCHEMA_xlsx_MD" as "MAP" on 
    KNB1."SCHEMA" = "MAP"."SCHEMA" -- global job
    WHERE EXISTS(
        SELECT * 
        FROM "TMP_O2C_VBAK_VBAP" AS "C"
        WHERE 1=1
            AND "C"."SCHEMA" = "KNB1"."SCHEMA" -- global job
           AND "C"."MANDT" = "KNB1"."MANDT"
        	AND "C"."KUNNR" = "KNB1"."KUNNR"
        	AND "C"."BUKRS_VF" = "KNB1"."BUKRS"
    )
);