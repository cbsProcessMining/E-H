/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_LIPS"













2. Required Tables:
LIPS
_CEL_O2C_CASES
VBFA

3. Required Columns:
CASES.MANDT
CASES.POSNR
CASES.VBELN
LIPS.ERDAT
LIPS.LIPS
LIPS.MANDT
LIPS.POSNR
LIPS.VBELN
LIPS._CEL_O2C_CASES
VBFA.MANDT
VBFA.POSNN
VBFA.POSNV
VBFA.VBELN
VBFA.VBELV

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
-- Query No: 1
DROP VIEW IF EXISTS "O2C_LIPS";
-- Query No: 2
CREATE VIEW "O2C_LIPS" AS (
	SELECT
        "LIPS".*, 
        MAP."PRETTY_NAME",-- global job
        MAP."SC/PC", -- global job
        CAST("LIPS"."ERDAT" AS DATE) AS "TS_ERDAT"
	FROM "LIPS" AS "LIPS"
    JOIN O2C_VBAP AS VBAP ON
        LIPS.SCHEMA = VBAP.SCHEMA
        AND LIPS.MANDT = VBAP.MANDT
        AND LIPS.VGBEL = VBAP.VBELN
        AND LIPS.VGPOS = VBAP.POSNR
    JOIN "SCHEMA_xlsx_MD" as "MAP" on 
        LIPS."SCHEMA" = "MAP"."SCHEMA" -- global job
    -- WHERE EXISTS(
    --     SELECT * 
    --     FROM "O2C_VBFA_V" AS "VBFA"
    --     WHERE 1=1
    --         AND "VBFA"."SCHEMA" = "LIPS"."SCHEMA" -- global job
    --         AND	VBFA.MANDT = LIPS.MANDT
    --     	AND VBFA.VBELN = LIPS.VBELN
    --     	AND VBFA.POSNN = LIPS.POSNR
    -- )
 )
;



