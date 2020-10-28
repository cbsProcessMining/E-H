/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: O2C_MARC







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
DROP VIEW IF EXISTS O2C_MARC;	
		
CREATE VIEW O2C_MARC AS
SELECT
     MARC.*,
     MAP."PRETTY_NAME",
     MAP."SC/PC",
     CAST("MARC"."MMSTD" AS DATE) AS "TS_MMSTD",
     CAST("MARC"."AUSDT" AS DATE) AS "TS_AUSDT"
FROM MARC
join "SCHEMA_xlsx_MD" as "MAP" on 
MARC."SCHEMA" = "MAP"."SCHEMA" -- global job
WHERE EXISTS(
        SELECT * 
        FROM "TMP_O2C_VBAK_VBAP" AS "C"
        WHERE 1=1
            AND "MARC"."SCHEMA" = C."SCHEMA" -- global job
            AND MARC.MANDT = C.MANDT
            AND MARC.MATNR = C.MATNR
            AND MARC.WERKS = C.WERKS
    )
;
