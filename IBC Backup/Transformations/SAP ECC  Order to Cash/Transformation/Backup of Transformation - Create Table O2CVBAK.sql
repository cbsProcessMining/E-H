/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_VBAK"













2. Required Tables:
DD07T
DD07T
T001
T014T
T024B
TSPAT
TVAK
TVAKT
TVAUT
TVFST
TVGRT
TVKBT
TVKOT
TVLST
TVSBT
TVTWT
VBAK
_CEL_O2C_CASES
VBKD

3. Required Columns:
C.MANDT
C.VBELN
DD07T.DD07T
DD07T.IFNULL
DD07T.INCO1
DD07T.INCO2
DD07T.MANDT
DD07T.POSNR
DD07T.T001
DD07T.T014T
DD07T.T024B
DD07T.TSPAT
DD07T.TVAK
DD07T.TVAKT
DD07T.TVAUT
DD07T.TVFST
DD07T.TVGRT
DD07T.TVKBT
DD07T.TVKOT
DD07T.TVLST
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
primaryLanguageKey
*/
-- Query No: 1
DROP TABLE IF EXISTS "O2C_VBAK";

-- Query No: 2
CREATE TABLE "O2C_VBAK" AS (
SELECT 
    "VBAK".*,
    MAP."PRETTY_NAME",
    MAP."SC/PC", -- global job
    CAST("VBAK"."ERDAT" AS DATE) AS "TS_ERDAT",
    CAST("VBAK"."ANGDT" AS DATE) AS "TS_ANGDT",
    CAST("VBAK"."HB_RESDATE" AS DATE) AS "TS_HB_RESDATE",
    CAST("VBAK"."AEDAT" AS DATE) AS "TS_AEDAT",
    CAST("VBAK"."GWLDT" AS DATE) AS "TS_GWLDT",
    CAST("VBAK"."DAT_FZAU" AS DATE) AS "TS_DAT_FZAU",
    CAST("VBAK"."AUDAT" AS DATE) AS "TS_AUDAT",
    CAST("VBAK"."FMBDAT" AS DATE) AS "TS_FMBDAT",
    CAST("VBAK"."ABHOD" AS DATE) AS "TS_ABHOD",
    CAST("VBAK"."BSTDK" AS DATE) AS "TS_BSTDK",
    CAST("VBAK"."MAHDT" AS DATE) AS "TS_MAHDT",
    CAST("VBAK"."CMNUP" AS DATE) AS "TS_CMNUP",
    CAST("VBAK"."HB_EXPDATE" AS DATE) AS "TS_HB_EXPDATE",
    CAST("VBAK"."GUEBG" AS DATE) AS "TS_GUEBG",
    CAST("VBAK"."GUEEN" AS DATE) AS "TS_GUEEN",
    CAST("VBAK"."CMNGV" AS DATE) AS "TS_CMNGV",
    CAST("VBAK"."BNDDT" AS DATE) AS "TS_BNDDT",
    CAST("VBAK"."CMFRE" AS DATE) AS "TS_CMFRE",
    CAST("VBAK"."VDATU" AS DATE) AS "TS_VDATU",
    IFNULL("DD07T_VBTYP"."DDTEXT",'') AS "VBTYP_TEXT",
    IFNULL("TVAKT"."BEZEI",'') AS "AUART_TEXT",
    IFNULL("DD07T_KLIMP"."DDTEXT",'') AS "KLIMP_TEXT",
    IFNULL("TVLST"."VTEXT",'') AS "LIFSP_TEXT",
    IFNULL("TVKOT"."VTEXT",'') AS "VKORG_TEXT",
    IFNULL("TVTWT"."VTEXT",'') AS "VTWEG_TEXT",
    IFNULL("TVKBT"."BEZEI",'') AS "VKBUR_TEXT",
    IFNULL("T014T"."KKBTX",'') AS "KKBER_TEXT",
    IFNULL("T001"."BUTXT",'') AS "BUKRS_TEXT",
    IFNULL("TVSBT"."VTEXT",'') AS "VSBED_TEXT"
    -- VBKD_1.INCO1 AS "INCO1",  
    -- VBKD_1.INCO2 AS "INCO2"
FROM 
    "VBAK" AS "VBAK"
    join "SCHEMA_xlsx_MD" as "MAP" on 
    VBAK."SCHEMA" = "MAP"."SCHEMA" -- global job
    LEFT JOIN "TVAKT" AS "TVAKT" ON 1=1
        AND "VBAK"."SCHEMA" = "TVAKT"."SCHEMA" -- global job
        AND "VBAK"."MANDT" = "TVAKT"."MANDT"
    	AND "VBAK"."AUART" = "TVAKT"."AUART"
        AND "TVAKT"."SPRAS" = '<%=primaryLanguageKey%>' 
    LEFT JOIN "TVLST" ON 1=1
        AND "VBAK"."SCHEMA" = "TVLST"."SCHEMA" -- global job
    	AND "VBAK"."MANDT" = "TVLST"."MANDT"
    	AND "VBAK"."LIFSK" = "TVLST"."LIFSP"
        AND "TVLST"."SPRAS" = '<%=primaryLanguageKey%>'
    LEFT JOIN "TVKOT" ON 1=1
        AND "VBAK"."SCHEMA" = "TVKOT"."SCHEMA" -- global job
    	AND "VBAK"."MANDT"="TVKOT"."MANDT"
    	AND "VBAK"."VKORG" = "TVKOT"."VKORG"
        AND "TVKOT"."SPRAS" = '<%=primaryLanguageKey%>'
    LEFT JOIN "TVTWT" ON 1=1
        AND "VBAK"."SCHEMA" = "TVTWT"."SCHEMA" -- global job
    	AND "VBAK"."MANDT" = "TVTWT"."MANDT"
    	AND "VBAK"."VTWEG" = "TVTWT"."VTWEG"
        AND "TVTWT"."SPRAS" = '<%=primaryLanguageKey%>'
    LEFT JOIN "TVKBT" ON 1=1
        AND "VBAK"."SCHEMA" = "TVKBT"."SCHEMA" -- global job
    	AND "VBAK"."MANDT" = "TVKBT"."MANDT"
    	AND "VBAK"."VKBUR" = "TVKBT"."VKBUR"
        AND "TVKBT"."SPRAS" = '<%=primaryLanguageKey%>'
    LEFT JOIN "TVSBT" on 1 = 1
        AND VBAK."SCHEMA" = TVSBT."SCHEMA"
        AND VBAK."MANDT" = TVSBT.MANDT 
        AND VBAK.VSBED = TVSBT.VSBED 
        AND TVSBT.SPRAS = '<%=primaryLanguageKey%>'
    LEFT JOIN "T014T" ON 1=1
    	AND "VBAK"."MANDT" = "T014T"."MANDT"
        AND "VBAK"."SCHEMA" = "T014T"."SCHEMA" -- global job
    	AND "VBAK"."KKBER" = "T014T"."KKBER"
        AND "T014T"."SPRAS" = '<%=primaryLanguageKey%>'
    LEFT JOIN "DD07T" AS "DD07T_VBTYP" ON 1=1
        AND DD07T_VBTYP."SCHEMA" = "VBAK"."SCHEMA" -- global job
    	AND "DD07T_VBTYP"."DOMVALUE_L" = "VBAK"."VBTYP"
    	AND "DD07T_VBTYP"."DOMNAME" = 'VBTYP'
    	AND "DD07T_VBTYP"."DDLANGUAGE" = '<%=primaryLanguageKey%>'
    LEFT JOIN "TVAK" AS "TVAK" ON 1=1
        AND "VBAK"."SCHEMA" = "TVAK"."SCHEMA" -- global job
    	AND "VBAK"."MANDT" = "TVAK"."MANDT" 
    	AND "VBAK"."AUART" = "TVAK"."AUART" 
    LEFT JOIN "DD07T" AS "DD07T_KLIMP" ON 1=1
        AND DD07T_KLIMP."SCHEMA" = "TVAK"."SCHEMA" -- global job
    	AND "DD07T_KLIMP"."DOMVALUE_L" = "TVAK"."KLIMP" 
    	AND "DD07T_KLIMP"."DOMNAME" = 'KLIMP'
    	AND "DD07T_KLIMP"."DDLANGUAGE" = '<%=primaryLanguageKey%>'
    LEFT JOIN "T001" ON 1=1
        AND "VBAK"."SCHEMA" = "T001"."SCHEMA" -- global job
        AND "VBAK"."MANDT" = "T001"."MANDT"
        AND "VBAK"."BUKRS_VF" = "T001"."BUKRS"
	-- LEFT JOIN (SELECT  "SCHEMA", MANDT, VBELN, POSNR, INCO1, INCO2 FROM VBKD WHERE VBKD.POSNR = '000000') AS VBKD_1 ON
    --     VBAK.MANDT = VBKD_1.MANDT
   	-- 	AND VBAK.VBELN = VBKD_1.VBELN
    --     AND "VBAK"."SCHEMA" = VBKD_1."SCHEMA" -- global job
    WHERE EXISTS(
        SELECT * 
        FROM "TMP_O2C_VBAK_VBAP" AS "C"
        WHERE 1=1
            AND "VBAK"."MANDT" = "C"."MANDT"
            AND "VBAK"."VBELN" = "C"."VBELN"
            AND "VBAK"."SCHEMA" = "C"."SCHEMA" -- global job
    )
);

