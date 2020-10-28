DROP VIEW IF EXISTS PP_MBEW;	

CREATE VIEW PP_MBEW AS
SELECT DISTINCT 
	MBEW.*
    , MAP."PRETTY_NAME"
FROM MBEW 
JOIN "SCHEMA_XLSX_MD" as "MAP" on -- global job
    MBEW."SCHEMA" = "MAP"."SCHEMA"
INNER JOIN MARC ON 1=1
    AND MARC."SCHEMA" = MBEW."SCHEMA"
    AND MARC.MATNR = MBEW.MATNR
    AND MARC.MANDT = MBEW.MANDT
    AND MARC.WERKS = MBEW.BWKEY
INNER JOIN PP_AFPO AS AFPO ON 1=1
    AND AFPO."SCHEMA" = MARC."SCHEMA"
    AND AFPO.MATNR = MARC.MATNR
    AND AFPO.MANDT = MARC.MANDT
    AND AFPO.DWERK = MARC.WERKS
    AND COALESCE(AFPO.BWTAR, 'BWTAR')=COALESCE(MBEW.BWTAR,'BWTAR');