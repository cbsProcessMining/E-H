/*DESCRIPTION:
Creates a View of the standard SAP ECC table EINE, which contains the purchasing info record. Additionally, a few selected columns from the EINA table are joined to this view.
*/
DROP VIEW IF EXISTS P2P_EINE;

CREATE VIEW P2P_EINE AS (
SELECT
    EINE.*,
    CASES."PRETTY_NAME", -- global job
    CASES."SC/PC" -- global job
    ,EINA.UMREN
    ,EINA.UMREZ
    ,EINA.LIFNR
    ,EINA.MATNR
    ,IFNULL(MAKT.MAKTX,'') AS "MATNR_TEXT"
    ,EINA.MATKL
    ,IFNULL(T023T.WGBEZ,'') AS "MATKL_TEXT"
    ,EINA.LOEKZ AS EINA_LOEKZ
    ,EINA.MEINS
    ,CAST(EINE.ERDAT AS DATE) AS TS_ERDAT
    ,CAST(EINE.ANGDT AS DATE) AS TS_ANGDT
    ,CAST(EINE.AMODV AS DATE) AS TS_AMODV
    ,CAST(EINE.AMODB AS DATE) AS TS_AMODB
    ,CAST(EINE.DATLB AS DATE) AS TS_DATLB
    ,CAST(EINE.PRDAT AS DATE) AS TS_PRDAT
    ,IFNULL(T024E.EKOTX,'') AS "EKORG_TEXT"
    ,IFNULL(T001W.NAME1,'') AS "WERKS_TEXT"
    ,IFNULL(T024.EKNAM,'') AS "EKGRP_TEXT"
    -- additions for price analytics
       ,CASE 
		WHEN EINE.WAERS = '<%=currency%>' THEN EINE.NETPR*ISNULL(TCURX.TDEC,1) 
  		WHEN TCURR_CC.UKURS < 0 THEN (EINE.NETPR*ISNULL(TCURX.TDEC,1))*(1/ABS(TCURR_CC.UKURS)/(CASE WHEN COALESCE(TCURF_CC.FFACT, TCURR_CC.FFACT, 0) = 0 THEN 1 ELSE COALESCE(TCURF_CC.FFACT, TCURR_CC.FFACT) END))*(CASE WHEN COALESCE(TCURF_CC.TFACT, TCURR_CC.TFACT, 0) = 0 THEN 1 ELSE COALESCE(TCURF_CC.TFACT, TCURR_CC.TFACT) END)
		WHEN TCURR_CC.UKURS > 0 THEN (EINE.NETPR*ISNULL(TCURX.TDEC,1))*(TCURR_CC.UKURS/CASE WHEN COALESCE(TCURF_CC.FFACT, TCURR_CC.FFACT, 0) = 0 THEN 1 ELSE COALESCE(TCURF_CC.FFACT, TCURR_CC.FFACT) END*CASE WHEN COALESCE(TCURF_CC.TFACT, TCURR_CC.TFACT, 0) = 0 THEN 1 ELSE COALESCE(TCURF_CC.TFACT, TCURR_CC.TFACT) END)
	END AS NETPR_CONVERTED
    -- additions END
FROM 
    EINE AS EINE
    INNER JOIN _CEL_P2P_CASES AS CASES ON 1=1
        AND EINE."SCHEMA" = "CASES"."SCHEMA" -- global job
		AND EINE.MANDT = CASES.MANDT
		AND EINE.EBELN = CASES.EBELN
		AND EINE.EBELP = CASES.EBELP
    INNER JOIN EINA AS EINA ON 1=1
        AND EINE."SCHEMA" = "EINA"."SCHEMA" -- global job
        AND EINE.MANDT = EINA.MANDT
        AND EINE.INFNR = EINA.INFNR
    LEFT JOIN T024E AS T024E ON 1=1
        AND EINE."SCHEMA" = "T024E"."SCHEMA" -- global job
		AND EINE.MANDT = T024E.MANDT
		AND EINE.EKORG = T024E.EKORG
    LEFT JOIN T001W AS T001W ON 1=1
        AND EINE."SCHEMA" = "T001W"."SCHEMA" -- global job
		AND EINE.MANDT = T001W.MANDT
		AND EINE.WERKS = T001W.WERKS
    LEFT JOIN T024 AS T024 ON 1=1
        AND EINE."SCHEMA" = "T024"."SCHEMA" -- global job
		AND EINE.MANDT = T024.MANDT
		AND EINE.EKGRP = T024.EKGRP
    LEFT JOIN MAKT AS MAKT ON 1=1
        AND MAKT."SCHEMA" = "EINA"."SCHEMA" -- global job
        AND MAKT.MANDT = EINA.MANDT
        AND MAKT.MATNR = EINA.MATNR
        AND MAKT.SPRAS = '<%=primaryLanguageKey%>'
    LEFT JOIN T023T AS T023T ON 1=1
        AND EINA."SCHEMA" = "T023T"."SCHEMA" -- global job
		AND EINA.MANDT = T023T.MANDT
		AND EINA.MATKL = T023T.MATKL
		AND T023T.SPRAS = '<%=primaryLanguageKey%>' 
    	-- ADDED for price analytics EINE/EINA
    LEFT JOIN TCURR_CC AS TCURR_CC ON 1=1
        AND TCURR_CC."SCHEMA" = "CASES"."SCHEMA" -- global job
		AND TCURR_CC.MANDT = CASES.MANDT
		AND TCURR_CC.TCURR = '<%=currency%>'
		AND TCURR_CC.FCURR = CASES.WAERS                                             
		AND EINE.ERDAT >= TCURR_CC.VALID_START AND EINE.ERDAT < TCURR_CC.VALID_END
        AND TCURR_CC.KURST = '<%=exchangeRateType%>' 
    LEFT JOIN TCURF_CC AS TCURF_CC ON 1=1
        AND TCURR_CC."SCHEMA" = "TCURF_CC"."SCHEMA" -- global job
		AND TCURR_CC.MANDT = TCURF_CC.MANDT
		AND TCURR_CC.TCURR = TCURF_CC.TCURR
		AND TCURR_CC.FCURR = TCURF_CC.FCURR
		AND TCURR_CC.KURST = TCURF_CC.KURST
        AND EINE.ERDAT>= TCURF_CC.VALID_START	
		AND EINE.ERDAT < TCURF_CC.VALID_END
	LEFT JOIN (
		SELECT 
            "SCHEMA", -- global job 
			TCURX.CURRKEY
			,CAST(TCURX.CURRDEC AS INT) AS CURRDEC
			,POWER(CAST(10 AS FLOAT),(2-CURRDEC)) AS TDEC 
		FROM 
			TCURX) AS TCURX ON 1=1
		AND TCURR_CC.FCURR = TCURX.CURRKEY
        AND TCURR_CC."SCHEMA" = TCURX."SCHEMA" -- global job
    -- addition end
);
