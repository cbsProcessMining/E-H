/*
This activity is based on the order confirmations that come from the table AFRU. An activity here is defined as the operation number concatenated with the work centre,
and the timestamps (Start and End) are defined as the first start datetime (AFRU.ISDD||AFRU.ISDZ) and the final end datetime (AFRU.IEDD||AFRU.IEDZ)

Note: Start and End times are not always recorded in a customer's system. If this is the case, then only bring in the relevant eventtime, which is usually the final confirmation time. 
It is important that you validate this with the customer's data set. 

*/
INSERT INTO _CEL_PP_ACTIVITIES(
	"_CASE_KEY"
	,"MANDT"
	,"AUFNR"
	,"POSNR"
	,"ACTIVITY_DE"
	,"ACTIVITY_EN"
    ,"START_TIME"
	,"EVENTTIME"
    ,"VORNR"
    ,"WORK_CENTRE"
    ,"WORK_CENTRE_TEXT"
    ,"OPERATION_TEXT"
	,"_SORTING"
    ,"VAT"
    ,"SCRAP"
    ,"YIELD"
	,"USER_NAME"
	,"USER_TYPE"
    , "SCHEMA"
    , "PRETTY_NAME")
SELECT DISTINCT
	A._CASE_KEY AS _CASE_KEY
    ,A.MANDT
	,A.AUFNR
	,A.POSNR
	,AFVC.VORNR  AS ACTIVITY_DE
	,AFVC.VORNR  AS ACTIVITY_EN
    ,AFRU_1.START_TIME AS START_TIME
    ,AFRU_1.END_TIME AS EVENTTIME
    ,AFVC.VORNR AS VORNR
    ,CRHD.ARBPL AS WORK_CENTRE
    ,CRTX.KTEXT AS WORK_CENTRE_TEXT
    ,AFVC.LTXA1 AS "OPERATION_TEXT"
    ,30000 + AFVC.VORNR AS "_SORTING"
    ,AFRU_2.VAT AS "VAT"
    ,AFRU_3.SCRAP AS "SCRAP"
    ,AFRU_3.YIELD AS "YIELD"
    ,AFRU.ERNAM AS "USER_NAME"
	,USR02.USTYP AS USER_TYPE 
    , A."SCHEMA" AS "SCHEMA"
    , A."PRETTY_NAME" AS "PRETTY_NAME"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    INNER JOIN AFRU AS AFRU ON 1=1
        AND AFRU."SCHEMA" = A."SCHEMA"
		AND AFRU.MANDT = A.MANDT
		AND AFRU.AUFNR = A.AUFNR
		AND AFRU.STOKZ IS NULL  
    LEFT JOIN USR02 AS USR02 ON 1=1
        AND AFRU."SCHEMA" = USR02."SCHEMA"
		AND AFRU.MANDT=USR02.MANDT
		AND AFRU.ERNAM=USR02.BNAME   
    LEFT JOIN AFVC AS AFVC ON 1=1 
        AND AFRU."SCHEMA" = AFVC."SCHEMA"
		AND AFRU.MANDT = AFVC.MANDT
		AND AFRU.AUFPL = AFVC.AUFPL
		AND AFRU.APLZL = AFVC.APLZL
    LEFT JOIN CRHD AS CRHD ON 1=1
        AND CRHD."SCHEMA" = AFRU."SCHEMA"
        AND CRHD.MANDT = AFRU.MANDT 
        AND CRHD.OBJID = AFRU.ARBID
    JOIN CRTX AS CRTX ON 1=1
        AND CRTX."SCHEMA" = CRHD."SCHEMA"
		AND CRTX.MANDT = CRHD.MANDT
		AND CRTX.OBJID = CRHD.OBJID
		AND CRTX.OBJTY = CRHD.OBJTY
		AND CRTX.SPRAS = '<%=primaryLanguageKey%>'
    INNER JOIN 
    (SELECT DISTINCT 
    "SCHEMA",
    MANDT,
    RUECK,
    MIN(CAST(AFRU.ISDD AS DATE)+CAST(AFRU.ISDZ AS TIME)) AS "START_TIME",
    MAX(CAST(AFRU.IEDD AS DATE)+CAST(AFRU.IEDZ AS TIME)) AS "END_TIME"
    FROM AFRU
    WHERE AFRU.STZHL = '00000000'
    GROUP BY "SCHEMA", MANDT, RUECK
   ) AS AFRU_1 ON 1=1 
        AND AFRU_1."SCHEMA" = AFRU."SCHEMA"
        AND AFRU_1.MANDT = AFRU.MANDT
        AND AFRU_1.RUECK = AFRU.RUECK
       -- AND AFRU_1.START_TIME = CAST(AFRU.ISDD AS DATE)+CAST(AFRU.ISDZ AS TIME)
        -- AND AFRU_1.END_TIME = CAST(AFRU.IEDD AS DATE)+CAST(AFRU.IEDZ AS TIME)
    INNER JOIN 
    (SELECT DISTINCT 
    "SCHEMA"
    ,MANDT
    ,RUECK
    ,SUM(CASE WHEN AFRU.STZHL = '00000000' THEN 1.0 ELSE -1.0 END *(
             CASE WHEN AFRU.ILE01 = 'H' THEN AFRU.ISM01
                    WHEN AFRU.ILE01 IN('10', 'TAG') THEN AFRU.ISM01*24.0
                    WHEN AFRU.ILE01 = 'MIN' THEN AFRU.ISM01/60.0
                    WHEN AFRU.ILE01 = 'MON' THEN AFRU.ISM01*30.436875*24.0
                    WHEN AFRU.ILE01 = 'S' THEN AFRU.ISM01/3600.0
                    WHEN AFRU.ILE01 = 'WCH' THEN AFRU.ISM01*7.0*24.0
                    WHEN AFRU.ILE01 = 'Z16' THEN AFRU.ISM01/3.6
                    WHEN AFRU.ILE01 = 'JHR' THEN AFRU.ISM01*365.0*24.0
                  ELSE 0.0
             END
             +
             CASE WHEN AFRU.ILE02 ='H' THEN AFRU.ISM02
                    WHEN AFRU.ILE02 IN('10', 'TAG') THEN AFRU.ISM02*24.0
                    WHEN AFRU.ILE02 = 'MIN' THEN AFRU.ISM02/60.0
                    WHEN AFRU.ILE02 = 'MON' THEN AFRU.ISM02*30.436875*24.0
                    WHEN AFRU.ILE02 = 'S' THEN AFRU.ISM02/3600.0
                    WHEN AFRU.ILE02 = 'WCH' THEN AFRU.ISM02*7.0*24.0
                    WHEN AFRU.ILE02 = 'Z16' THEN AFRU.ISM02/3.6
                    WHEN AFRU.ILE02 = 'JHR' THEN AFRU.ISM02*365.0*24.0
                  ELSE 0.0
             END
             +
             CASE WHEN AFRU.ILE03 IN( 'H') THEN AFRU.ISM03
                    WHEN AFRU.ILE03 IN('10', 'TAG') THEN AFRU.ISM03*24.0
                    WHEN AFRU.ILE03 = 'MIN' THEN AFRU.ISM03/60.0
                    WHEN AFRU.ILE03 = 'MON' THEN AFRU.ISM03*30.436875*24.0
                    WHEN AFRU.ILE03 = 'S' THEN AFRU.ISM03/3600.0
                    WHEN AFRU.ILE03 = 'WCH' THEN AFRU.ISM03*7.0*24.0
                    WHEN AFRU.ILE03 = 'Z16' THEN AFRU.ISM03/3.6
                    WHEN AFRU.ILE03 = 'JHR' THEN AFRU.ISM03*365.0*24.0
                  ELSE 0.0
             END
             +
             CASE WHEN AFRU.ILE04 IN( 'H') THEN AFRU.ISM04
                    WHEN AFRU.ILE04 IN('10', 'TAG') THEN AFRU.ISM04*24.0
                    WHEN AFRU.ILE04 = 'MIN' THEN AFRU.ISM04/60.0
                    WHEN AFRU.ILE04 = 'MON' THEN AFRU.ISM04*30.436875*24.0
                    WHEN AFRU.ILE04 = 'S' THEN AFRU.ISM04/3600.0
                    WHEN AFRU.ILE04 = 'WCH' THEN AFRU.ISM04*7.0*24.0
                    WHEN AFRU.ILE04 = 'Z16' THEN AFRU.ISM04/3.6
                    WHEN AFRU.ILE04 = 'JHR' THEN AFRU.ISM04*365.0*24.0
                  ELSE 0.0
             END
             +
             CASE WHEN AFRU.ILE05 IN( 'H') THEN AFRU.ISM05
                    WHEN AFRU.ILE05 IN('10', 'TAG') THEN AFRU.ISM05*24.0
                    WHEN AFRU.ILE05 = 'MIN' THEN AFRU.ISM05/60.0
                    WHEN AFRU.ILE05 = 'MON' THEN AFRU.ISM05*30.436875*24.0
                    WHEN AFRU.ILE05 = 'S' THEN AFRU.ISM05/3600.0
                    WHEN AFRU.ILE05 = 'WCH' THEN AFRU.ISM05*7.0*24.0
                    WHEN AFRU.ILE05 = 'Z16' THEN AFRU.ISM05/3.6
                    WHEN AFRU.ILE05 = 'JHR' THEN AFRU.ISM05*365.0*24.0
                  ELSE 0.0
             END
             +
             CASE WHEN AFRU.ILE06 IN( 'H') THEN AFRU.ISM06
                    WHEN AFRU.ILE06 IN('10', 'TAG') THEN AFRU.ISM06*24.0
                    WHEN AFRU.ILE06 = 'MIN' THEN AFRU.ISM06/60.0
                    WHEN AFRU.ILE06 = 'MON' THEN AFRU.ISM06*30.436875*24.0
                    WHEN AFRU.ILE06 = 'S' THEN AFRU.ISM06/3600.0
                    WHEN AFRU.ILE06 = 'WCH' THEN AFRU.ISM06*7.0*24.0
                    WHEN AFRU.ILE06 = 'Z16' THEN AFRU.ISM06/3.6
                    WHEN AFRU.ILE06 = 'JHR' THEN AFRU.ISM06*365.0*24.0
                  ELSE 0.0
             END)) AS VAT
             /*note that the Value adding time (VAT) and how it is stored in one's SAP system can vary across companies. This is how it has been stored 
             in the past at previous customers, however some only store it in one column of AFRU, eg. ISM03. Make sure to validate this, as well as Set-up time
             labour time, machine time, etc. with the customer. If they store this data somewhere, then it is possible to add this into the activities table. */
    FROM AFRU
        GROUP BY "SCHEMA", MANDT, RUECK) AS AFRU_2 ON 1=1 
        AND AFRU_2."SCHEMA" = AFRU."SCHEMA"
        AND AFRU_2.MANDT = AFRU.MANDT
        AND AFRU_2.RUECK = AFRU.RUECK
     INNER JOIN 
    (SELECT DISTINCT
    "SCHEMA"
    ,MANDT
    ,RUECK
    ,SUM(AFRU.XMNGA) AS "SCRAP"
    ,SUM(AFRU.LMNGA) AS "YIELD"
    FROM "AFRU"
    GROUP BY "SCHEMA", MANDT, RUECK
    ) AS AFRU_3 ON 1=1
        AND AFRU_3."SCHEMA" = AFRU."SCHEMA"
        AND AFRU_3.MANDT = AFRU.MANDT
        AND AFRU_3.RUECK = AFRU.RUECK

ORDER BY _SORTING ASC