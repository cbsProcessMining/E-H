/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "O2C_VBAP"













2. Required Tables:
MAKT
T001L
T001W
T023T
T179T
TVAGT
TVAPT
TVKMT
TVSTT
VBAP
_CEL_O2C_CASES
LIPS
TVRO
VBAP
VBAP
VBFA
VBFA
VBKD
VBKD
VBRP
...
Contact App Store support for the complete list.

3. Required Columns:
C.MANDT
C.POSNR
C.VBELN
LIPS.LFIMG
LIPS.MANDT
LIPS.POSNR
LIPS.VBELN
MAKT.IFNULL
MAKT.INCO1
MAKT.INCO2
MAKT.MAKT
MAKT.MAKTX
MAKT.MANDT
MAKT.MATNR
MAKT.POSNR
MAKT.SPRAS
MAKT.SUBSTR
MAKT.T001L
MAKT.T001W
MAKT.T023T
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
DROP TABLE IF EXISTS "O2C_VBAP";

-- Query 2 
CREATE TABLE "O2C_VBAP" AS (
	SELECT
        "VBAP".*,
        "V"."PRETTY_NAME", -- global job
        "V"."SC/PC", -- global job
        V."_CASE_KEY", -- global job
        CAST("VBAP"."ABDAT" AS DATE) AS "TS_ABDAT",
        CAST("VBAP"."AEDAT" AS DATE) AS "TS_AEDAT",
        CAST("VBAP"."ERDAT" AS DATE) AS "TS_ERDAT",
        CAST("VBAP"."STADAT" AS DATE) AS "TS_STADAT",
        CAST("VBAP"."STDAT" AS DATE) AS "TS_STDAT",
        IFNULL("MAKT"."MAKTX",'') AS "MATNR_TEXT",
        IFNULL("T023T"."WGBEZ",'') AS "MATKL_TEXT",
        IFNULL("T001W"."NAME1",'') AS "WERKS_TEXT",
        IFNULL("T001L"."LGOBE",'') AS "LGORT_TEXT",
        IFNULL("TVSTT"."VTEXT",'') AS "VSTEL_TEXT",
        IFNULL("TVKMT"."VTEXT",'') AS "KTGRM_TEXT",
        IFNULL("TVAPT"."VTEXT",'') AS "PSTYV_TEXT",
        IFNULL("TVAGT"."BEZEI",'') AS "ABGRU_TEXT",
        IFNULL("T179T"."VTEXT",'') AS "PRODH_TEXT",
        "VBAP_CURR_TMP"."NETWR_CONVERTED" AS "NETWR_CONVERTED",
        COALESCE("VBKD_1"."INCO1", "VBKD_2"."INCO1") AS "INCO1",  
        COALESCE("VBKD_1"."INCO2", "VBKD_2"."INCO2") AS "INCO2",
        "TVRO"."TRAZTD"/240000 AS "ROUTE_IN_DAYS"/*,
        TMP_LIPS.SUM_LFIMG AS "SUM_LFIMG",
        TMP_VBRP.SUM_FKIMG AS "SUM_FKIMG",
        TMP_VBRP.SUM_NETWR AS "SUM_NETWR"*/
	FROM "VBAP" AS "VBAP" 
        JOIN "TMP_O2C_VBAK_VBAP" AS "V" ON 1=1
            AND "VBAP"."SCHEMA" = "V"."SCHEMA" -- global job
        	AND "VBAP"."MANDT" = "V"."MANDT"
        	AND "VBAP"."VBELN" = "V"."VBELN"
        	AND "VBAP"."POSNR" = "V"."POSNR"
        LEFT JOIN "VBAP_CURR_TMP" AS "VBAP_CURR_TMP" ON 1=1
            AND "VBAP"."SCHEMA" = VBAP_CURR_TMP."SCHEMA" -- global job
            AND "VBAP"."MANDT" = "VBAP_CURR_TMP"."MANDT"
        	AND "VBAP"."VBELN" = "VBAP_CURR_TMP"."VBELN"
        	AND "VBAP"."POSNR" = "VBAP_CURR_TMP"."POSNR"  
		LEFT JOIN "MAKT" ON 1=1
            AND "VBAP"."SCHEMA" = "MAKT"."SCHEMA" -- global job
	    	AND "VBAP"."MANDT" = "MAKT"."MANDT"
			AND "VBAP"."MATNR" = "MAKT"."MATNR"
            AND "MAKT"."SPRAS" = '<%=primaryLanguageKey%>'
		LEFT JOIN "T001W" ON 1=1
            AND "VBAP"."SCHEMA" = "T001W"."SCHEMA" -- global job
			AND "VBAP"."MANDT" = "T001W"."MANDT"
			AND "VBAP"."WERKS" = "T001W"."WERKS"
		LEFT JOIN "T001L" ON 1=1
            AND "VBAP"."SCHEMA" = "T001L"."SCHEMA" -- global job
			AND "VBAP"."MANDT" = "T001L"."MANDT" 
			AND "VBAP"."WERKS" = "T001L"."WERKS"
			AND "VBAP"."LGORT" = "T001L"."LGORT"
		LEFT JOIN "TVSTT" ON 1=1
            AND "VBAP"."SCHEMA" = "TVSTT"."SCHEMA" -- global job
			AND "VBAP"."MANDT" = "TVSTT"."MANDT"
			AND "VBAP"."VSTEL" = "TVSTT"."VSTEL"
            AND "TVSTT"."SPRAS" = '<%=primaryLanguageKey%>'
		LEFT JOIN "TVKMT" ON 1=1
            AND "TVKMT"."SCHEMA" = "VBAP"."SCHEMA" -- global job
			AND "TVKMT"."MANDT"="VBAP"."MANDT"
            AND "TVKMT"."SPRAS" = '<%=primaryLanguageKey%>'
			AND "TVKMT"."KTGRM"="VBAP"."KTGRM"
		LEFT JOIN "TVAPT" ON 1=1
            AND "VBAP"."SCHEMA" = "TVAPT"."SCHEMA" -- global job
			AND "VBAP"."MANDT" = "TVAPT"."MANDT"
			AND "VBAP"."PSTYV" = "TVAPT"."PSTYV"
            AND "TVAPT"."SPRAS" = '<%=primaryLanguageKey%>'
		LEFT JOIN "TVAGT" ON 1=1
            AND "VBAP"."SCHEMA" = "TVAGT"."SCHEMA" -- global job
	    	AND "VBAP"."MANDT" = "TVAGT"."MANDT"
			AND "VBAP"."ABGRU" = "TVAGT"."ABGRU"
            AND "TVAGT"."SPRAS" = '<%=primaryLanguageKey%>'
		LEFT JOIN "T023T" AS "T023T" on 1=1
            AND "T023T"."SCHEMA" = "VBAP"."SCHEMA" -- global job
	    	AND "T023T"."MANDT" = "VBAP"."MANDT"
            AND "T023T"."SPRAS" = '<%=primaryLanguageKey%>'
	    	AND "T023T"."MATKL" = "VBAP"."MATKL"
        LEFT JOIN "T179T" AS "T179T" on 1=1
            AND "T179T"."SCHEMA" = "VBAP"."SCHEMA" -- global job
	    	AND "T179T"."MANDT" = "VBAP"."MANDT"
            AND "T179T"."SPRAS" = '<%=primaryLanguageKey%>'
	    	AND "T179T"."PRODH" = "VBAP"."PRODH"
		LEFT JOIN (SELECT "SCHEMA", MANDT, VBELN, POSNR, INCO1, INCO2 FROM VBKD WHERE VBKD.POSNR <> '000000') AS VBKD_1 
            ON "VBAP"."SCHEMA" = VBKD_1."SCHEMA" -- global job
            AND VBAP.MANDT = VBKD_1.MANDT
   			AND VBAP.VBELN = VBKD_1.VBELN
   			AND VBAP.POSNR = VBKD_1.POSNR
  		LEFT JOIN (SELECT "SCHEMA", MANDT, VBELN, POSNR, INCO1, INCO2 FROM VBKD WHERE VBKD.POSNR = '000000') AS VBKD_2 
            ON "VBAP"."SCHEMA" = VBKD_2."SCHEMA" -- global 
            AND VBAP.MANDT = VBKD_2.MANDT
   			AND VBAP.VBELN = VBKD_2.VBELN
 	    LEFT JOIN "TVRO" AS "TVRO" ON 1=1
            AND "VBAP"."SCHEMA" = "TVRO"."SCHEMA" -- global job
  			AND "VBAP"."MANDT" = "TVRO"."MANDT"
  			AND "VBAP"."ROUTE" = "TVRO"."ROUTE"
        /*LEFT JOIN TMP_LIPS ON 1=1
			AND TMP_LIPS.MANDT = VBAP.MANDT 
         	AND TMP_LIPS.VBELN = VBAP.VBELN 
         	AND TMP_LIPS.POSNR = VBAP.POSNR
        LEFT JOIN TMP_VBRP ON 1=1
			AND TMP_VBRP.MANDT = VBAP.MANDT 
         	AND TMP_VBRP.VBELN = VBAP.VBELN 
         	AND TMP_VBRP.POSNR = VBAP.POSNR*/
);

