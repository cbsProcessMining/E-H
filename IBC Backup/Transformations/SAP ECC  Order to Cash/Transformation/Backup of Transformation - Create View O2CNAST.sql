/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_NAST"













2. Required Tables:
DD07T
NAST
_CEL_O2C_CASES

3. Required Columns:
C.MANDT
C.VBELN
DD07T.DD07T
DD07T.IFNULL
DD07T.NAST
DD07T._CEL_O2C_CASES
DD07T_EKKO_NACHA.DDLANGUAGE
DD07T_EKKO_NACHA.DDTEXT
DD07T_EKKO_NACHA.DOMNAME
DD07T_EKKO_NACHA.DOMVALUE_L
NAST.MANDT
NAST.NACHA
NAST.OBJKY

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
primaryLanguageKey
*/
-- Query 1
DROP VIEW IF EXISTS "O2C_NAST";

-- Query 2
CREATE VIEW "O2C_NAST" AS (
	SELECT 
        "NAST".*,
        "PRETTY_NAME",-- global job
        "SC/PC", -- global job
        IFNULL("DD07T_EKKO_NACHA"."DDTEXT",'') AS "NACHA_TEXT"
	FROM "NAST" AS "NAST"
    join "SCHEMA_xlsx_MD" as "MAP" on 
    NAST."SCHEMA" = "MAP"."SCHEMA" -- global job
    LEFT JOIN "DD07T" AS "DD07T_EKKO_NACHA" ON 1=1
        AND "DD07T_EKKO_NACHA"."SCHEMA" = "NAST"."SCHEMA" -- global job
        AND "DD07T_EKKO_NACHA"."DOMVALUE_L" = "NAST"."NACHA" 
        AND "DD07T_EKKO_NACHA"."DOMNAME" = 'NA_NACHA'
        AND "DD07T_EKKO_NACHA"."DDLANGUAGE" = '<%=primaryLanguageKey%>'
    WHERE EXISTS(
        SELECT * 
        FROM "TMP_O2C_VBAK_VBAP" AS "C"
        WHERE 1=1
            AND NAST."SCHEMA" = "C"."SCHEMA" -- global job
            AND "NAST"."MANDT" = "C"."MANDT"
            AND "NAST"."OBJKY" = "C"."VBELN"
    )
);