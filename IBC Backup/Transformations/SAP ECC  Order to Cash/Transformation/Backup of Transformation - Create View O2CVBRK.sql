/*DESCRIPTION:
CBS: App






2. Required Tables:
MARC
VBAP
_CEL_O2C_CASES

3. Required Columns:
MARC.*
MARC.AUSDT
MARC.MANDT
MARC.MATNR
MARC.MMSTD
MARC.WERKS
VBAP.MANDT
VBAP.MATNR
VBAP.POSNR
VBAP.VBELN
VBAP.WERKS
_CEL_O2C_CASES.MANDT
_CEL_O2C_CASES.POSNR
_CEL_O2C_CASES.VBELN

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
-- Query 1
DROP VIEW IF EXISTS "O2C_VBRK";

-- Query 2
CREATE VIEW "O2C_VBRK" AS (
	SELECT DISTINCT 
    VBRK.*,
    O2C_VBRP."PRETTY_NAME", -- global job
    O2C_VBRP."SC/PC" -- global job
	FROM "VBRK"
    INNER JOIN "O2C_VBRP" ON 1=1
        AND "VBRK"."MANDT" = "O2C_VBRP"."MANDT"
        AND "VBRK"."VBELN" = "O2C_VBRP"."VBELN"
);