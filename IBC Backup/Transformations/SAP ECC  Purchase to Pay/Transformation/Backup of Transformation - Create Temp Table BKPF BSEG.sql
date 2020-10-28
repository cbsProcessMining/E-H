/*DESCRIPTION:
1. Transformation Description:
This transformation creates a temporary table with the following name: TMP_P2P_BKPF_BSEG

















2. Required Tables:
BKPF
BSEG

3. Required Columns:
BKPF.AWKEY
BKPF.BELNR
BKPF.BLDAT
BKPF.BUDAT
BKPF.BUKRS
BKPF.CPUDT
BKPF.CPUTM
BKPF.GJAHR
BKPF.MANDT
BKPF.TCODE
BKPF.USNAM
BSEG.AUGBL
BSEG.AUGDT
BSEG.AUGGJ
BSEG.BELNR
BSEG.BSCHL
BSEG.BUKRS
BSEG.BUZEI
BSEG.GJAHR
BSEG.KOART
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
DROP TABLE IF EXISTS TMP_P2P_BKPF_BSEG;

CREATE TABLE TMP_P2P_BKPF_BSEG AS (
SELECT DISTINCT
     MAP.* -- global job
    ,BSEG.MANDT
    ,BKPF.BUKRS
    ,BKPF.BELNR
  	,CAST(BKPF."BLDAT" AS DATE) AS "BLDAT"
  	,CAST(BKPF."BUDAT" AS DATE) AS "BUDAT"
  	,BSEG.ZLSCH
  	,BSEG.ZLSPR
  	,BSEG.ZBD1T
 	,BSEG.ZBD2T
  	,BSEG.ZFBDT
  	,BSEG.ZBD3T
    ,BSEG.GJAHR
  	,BSEG.BUZEI
    ,BKPF.AWKEY
    ,BSEG.AUGBL
    ,BSEG.AUGDT
    ,CAST(BKPF."CPUDT" AS DATE) AS "CPUDT"
	,CAST(BKPF."CPUTM" AS TIME) AS "CPUTM"
    ,BKPF.TCODE
    ,BKPF.USNAM
    ,BSEG.KOART
    ,BSEG.MANDT || BSEG.BUKRS || BSEG.BELNR || BSEG.GJAHR || BSEG.BUZEI AS "TABKEY_BSEG"
    ,BSEG.MANDT || BSEG.BUKRS || BSEG.BELNR || BSEG.GJAHR AS "TABKEY_BKPF"
  	,BSEG.ZTERM
  	,BSEG.AUGGJ
    ,"BKPF"."PPDAT" -- enhanced to E+H need regarding "record inovice receipt"
    ,CAST("BKPF"."PPTME" AS TIME) AS "PPTME" -- enhanced to E+H need regarding "record inovice receipt"
    ,BKPF.WAERS -- add WAERS for cuurency translation RESG-WWBTR
FROM 
    BKPF AS BKPF
    join "SCHEMA_xlsx_MD" as "MAP" on 
    BKPF."SCHEMA" = "MAP"."SCHEMA" -- global job
    JOIN BSEG AS BSEG ON 1=1
        AND BKPF."SCHEMA" = BSEG."SCHEMA" -- global job
    	AND BKPF.MANDT = BSEG.MANDT
    	AND BKPF.BUKRS = BSEG.BUKRS
    	AND BKPF.GJAHR = BSEG.GJAHR 
    	AND BKPF.BELNR = BSEG.BELNR
WHERE 1=1
    AND BSEG.BSCHL = '31'
);