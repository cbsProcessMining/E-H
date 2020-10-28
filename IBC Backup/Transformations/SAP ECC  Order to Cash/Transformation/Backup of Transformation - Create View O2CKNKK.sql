/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_KNKK"













2. Required Tables:
KNKK
VBAK
_CEL_O2C_CASES

3. Required Columns:
C.MANDT
C.VBELN
KNKK.AEDAT
KNKK.AETXT
KNKK.CASHD
KNKK.DBMON
KNKK.DTREV
KNKK.ERDAT
KNKK.KKBER
KNKK.KNKK
KNKK.KUNNR
KNKK.MANDT
KNKK.NXTRV
KNKK.REVDB
KNKK.SBDAT
KNKK.UEDAT
KNKK.VBAK
KNKK._CEL_O2C_CASES
VBAK.KKBER
VBAK.KUNNR
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
-- Query 1
DROP VIEW IF EXISTS "O2C_KNKK";

-- Query 2
CREATE VIEW "O2C_KNKK" AS (
	SELECT 
        "KNKK".*,
        "MAP"."PRETTY_NAME", -- global job 
        "MAP"."SC/PC", -- global job
        CAST("KNKK"."AEDAT" AS DATE) AS "TS_AEDAT",
        CAST("KNKK"."AETXT" AS DATE) AS "TS_AETXT",
        CAST("KNKK"."CASHD" AS DATE) AS "TS_CASHD",
        CAST("KNKK"."DBMON" AS DATE) AS "TS_DBMON",
        CAST("KNKK"."DTREV" AS DATE) AS "TS_DTREV",
        CAST("KNKK"."ERDAT" AS DATE) AS "TS_ERDAT",
        CAST("KNKK"."NXTRV" AS DATE) AS "TS_NXTRV",
        CAST("KNKK"."REVDB" AS DATE) AS "TS_REVDB",
        CAST("KNKK"."SBDAT" AS DATE) AS "TS_SBDAT",
        CAST("KNKK"."UEDAT" AS DATE) AS "TS_UEDAT"
	FROM "KNKK" AS "KNKK"
    join "SCHEMA_xlsx_MD" as "MAP" on 
    KNKK."SCHEMA" = "MAP"."SCHEMA" -- global job
    WHERE EXISTS (
        SELECT * FROM "TMP_O2C_VBAK_VBAP" AS C
        WHERE "C"."MANDT" = "KNKK"."MANDT"
        AND "C"."KKBER" = "KNKK"."KKBER"
        AND "C"."KUNNR" = "KNKK"."KUNNR"
        AND "C"."SCHEMA" = "KNKK"."SCHEMA" -- global job
    )
);