/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_VBRP"













2. Required Tables:
LIPS
VBRP
_CEL_O2C_CASES

3. Required Columns:
CASES.MANDT
CASES.POSNR
CASES.VBELN
LIPS.LIPS
LIPS.MANDT
LIPS.POSNR
LIPS.VBELN
LIPS.VBRP
LIPS.VGBEL
LIPS.VGPOS
LIPS._CEL_O2C_CASES
VBRP.MANDT
VBRP.VGBEL
VBRP.VGPOS

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
Drop View if exists O2C_VBRP;

-- Query 2
CREATE VIEW "O2C_VBRP" AS(
    SELECT 
        "VBRP".*,
         MAP."PRETTY_NAME",-- global job
        MAP."SC/PC" -- global job
		FROM  "VBRP" AS "VBRP"
    join "SCHEMA_xlsx_MD" as "MAP" on 
    VBRP."SCHEMA" = "MAP"."SCHEMA" -- global job
    WHERE EXISTS(
        SELECT * 
        FROM "O2C_VBFA_V" AS "VBFA"
        WHERE VBFA.MANDT = VBRP.MANDT
            AND VBFA."SCHEMA" = VBRP."SCHEMA" -- global job
        	AND VBFA.VBELN = VBRP.VBELN
        	AND VBFA.POSNN = VBRP.POSNR
    )
);