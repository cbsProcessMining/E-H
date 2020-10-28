/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_VBEP"













2. Required Tables:
TVLST
VBEP
_CEL_O2C_CASES

3. Required Columns:
C.MANDT
C.POSNR
C.VBELN
TVLST.IFNULL
TVLST.LIFSP
TVLST.MANDT
TVLST.SPRAS
TVLST.TVLST
TVLST.VBEP
TVLST.VTEXT
TVLST._CEL_O2C_CASES
VBEP.BDDAT
VBEP.EDATU
VBEP.LDDAT
VBEP.LIFSP
VBEP.LRGDT
VBEP.MANDT
VBEP.MBDAT
VBEP.POSNR
VBEP.RSDAT
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
primaryLanguageKey
*/
-- Query 1
DROP VIEW IF EXISTS "O2C_VBEP";

-- Query 2
CREATE VIEW "O2C_VBEP" AS (
	SELECT 
        "VBEP".*,
        MAP."PRETTY_NAME", -- global job 
        MAP."SC/PC", -- global job
        CAST("VBEP"."BDDAT" AS DATE) AS "TS_BDDAT",
        CAST("VBEP"."EDATU" AS DATE) AS "TS_EDATU",
        CAST("VBEP"."LDDAT" AS DATE) AS "TS_LDDAT",
        CAST("VBEP"."LRGDT" AS DATE) AS "TS_LRGDT",
        CAST("VBEP"."MBDAT" AS DATE) AS "TS_MBDAT",
        CAST("VBEP"."RSDAT" AS DATE) AS "TS_RSDAT",
        CAST("VBEP"."TDDAT" AS DATE) AS "TS_TDDAT",
        CAST("VBEP"."WADAT" AS DATE) AS "TS_WADAT",
		IFNULL("TVLST"."VTEXT",'') AS "LIFSK_TEXT"
	FROM "VBEP" AS "VBEP"
    LEFT JOIN "TVLST" ON 1=1
        AND "VBEP"."SCHEMA" = "TVLST"."SCHEMA" -- global job
        AND "VBEP"."MANDT" = "TVLST"."MANDT" 
        AND "VBEP"."LIFSP" = "TVLST"."LIFSP" 
    join "SCHEMA_xlsx_MD" as "MAP" on 
    VBEP."SCHEMA" = "MAP"."SCHEMA" -- global job
    WHERE EXISTS(
        SELECT * 
        FROM "TMP_O2C_VBAK_VBAP" AS "C"
        WHERE 1=1
            AND "VBEP"."SCHEMA" = "C"."SCHEMA" -- global job
            AND "VBEP"."MANDT" = "C"."MANDT"
        	AND "VBEP"."VBELN" = "C"."VBELN" 
        	AND "VBEP"."POSNR" = "C"."POSNR"
    )
);