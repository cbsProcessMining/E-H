/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_KNA1"













2. Required Tables:
KNA1
VBAK
_CEL_O2C_CASES

3. Required Columns:
C.MANDT
C.VBELN
KNA1.ERDAT
KNA1.KNA1
KNA1.KUNNR
KNA1.MANDT
KNA1.UPDAT
KNA1.VBAK
KNA1._CEL_O2C_CASES
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
DROP VIEW IF EXISTS "O2C_KNA1";

-- Query 2
CREATE VIEW "O2C_KNA1" AS (
	SELECT 
        "KNA1".*,
        MAP."PRETTY_NAME", -- global job
        MAP."SC/PC", -- global job 
        CAST("KNA1"."ERDAT" AS DATE) AS "TS_ERDAT",
        CAST("KNA1"."UPDAT" AS DATE) AS "TS_UPDAT",
        T077X.TXT30 as "KTOKD_TEXT"
	FROM "KNA1" AS "KNA1"
    join "SCHEMA_xlsx_MD" as "MAP" on 
    KNA1."SCHEMA" = "MAP"."SCHEMA" -- global job
    join T077X as "T077X" on 
    KNA1."SCHEMA" = "T077X"."SCHEMA" AND 
    KNA1."MANDT" = "T077X"."MANDT" AND 
    KNA1."KTOKD" = "T077X"."KTOKD"
       WHERE EXISTS(
        SELECT * 
        FROM "TMP_O2C_VBAK_VBAP" AS "C"
        WHERE 1=1
            AND "C"."MANDT" = "KNA1"."MANDT"
        	AND "C"."KUNNR" = "KNA1"."KUNNR"
            AND "C"."SCHEMA" = "KNA1"."SCHEMA" -- global job
    )
);
