/* We need to consider table JSTO to find the correct status schema. Else, we would join EVERY E000* Status from TJ30 */

-- ***************** PP1 011 Logic*****************************
-- ***************** PIN 020 Logic*****************************
-- ***************** PIN 024 Logic*****************************
-- E0002  E  CRE  Create SO Item

INSERT INTO _CEL_PP_ACTIVITIES(
	"_CASE_KEY"
	,"MANDT"
	,"AUFNR"
	,"POSNR"
	,"ACTIVITY_DE"
	,"ACTIVITY_EN"
	,"ACTIVITY_DETAIL_DE"
	,"ACTIVITY_DETAIL_EN"
	,"EVENTTIME"
	,"_SORTING"
	,"USER_NAME"
	,"USER_TYPE"
    ,"SCHEMA"
    ,"PRETTY_NAME"
    ,"TRANSACTION_CODE")
SELECT DISTINCT
	A._CASE_KEY
	,A.MANDT
	,A.AUFNR
	,A.POSNR
    ,'Kundenauftragsposition angelegt' AS "ACTIVITY_DE"
    ,'Sales Order Item created' AS "ACTIVITY_EN"
	,TJ30T_DE.ESTAT || '/' || TJ30T_DE.TXT04 || '/' || TJ30T_DE.STSMA || ' - ' || TJ30T_DE.TXT30 AS ACTIVITY_DETAIL_DE 
	,TJ30T_EN.ESTAT || '/' || TJ30T_EN.TXT04 || '/' || TJ30T_EN.STSMA  || ' - ' || TJ30T_EN.TXT30 AS ACTIVITY_DETAIL_EN
	,DATE_TRUNC('MINUTES', CAST(JCDS.UDATE AS DATE) + CAST(JCDS.UTIME AS TIME) ) AS EVENTTIME
	,5000 AS "_SORTING"
	,JCDS.USNAM AS "USER_NAME"
	,USR02.USTYP AS USER_TYPE 
    ,A."SCHEMA" AS "SCHEMA"
    ,MAP."PRETTY_NAME" AS "PRETTY_NAME"
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    JOIN "SCHEMA_xlsx_MD" as "MAP" on  -- global job
        A."SCHEMA" = "MAP"."SCHEMA"
	JOIN JCDS AS JCDS ON 1=1
        AND JCDS."SCHEMA" = A."SCHEMA"
		AND JCDS.MANDT = A.MANDT
		AND JCDS.OBJNR= 'VB' || A.KDAUF || A.KDPOS
    JOIN JSTO AS JSTO ON 1=1
        AND JSTO."SCHEMA" = "JCDS"."SCHEMA"
        AND JSTO.MANDT = "JCDS"."MANDT"
        AND JSTO.OBJNR = "JCDS"."OBJNR"
	LEFT JOIN TJ30T AS TJ30T_EN ON 1=1
        AND TJ30T_EN."SCHEMA" = JCDS."SCHEMA"
		AND TJ30T_EN.ESTAT = JCDS.STAT
		AND TJ30T_EN.SPRAS = 'E' 
        AND TJ30T_EN.STSMA = JSTO.STSMA 
	LEFT JOIN TJ30T AS TJ30T_DE ON 1=1 
        AND TJ30T_DE."SCHEMA" = JCDS."SCHEMA"
	    AND TJ30T_DE.ESTAT = JCDS.STAT
	 	AND TJ30T_DE.SPRAS = 'D' 
        AND TJ30T_DE.STSMA = JSTO.STSMA  
	LEFT JOIN USR02 AS USR02 ON 1=1
        AND JCDS."SCHEMA" = USR02."SCHEMA"
	 	AND JCDS.MANDT=USR02.MANDT
		AND JCDS.USNAM=USR02.BNAME
WHERE 1=1
    --AND A._CASE_KEY = 'PIN0200200000657297690001'
    AND A.PRETTY_NAME IN ('PP1011', 'PIN020','PIN024')
    AND	JCDS.STAT = 'E0002'
    AND JCDS.CHIND = 'I'; --initial insert only

--SELECT * from JCDS WHERE OBJNR = 'VB3000514275001600'

-- ***************** PP2 004 Logic*****************************
-- ***************** PP2 005 Logic*****************************
-- E0001  E  CRE  Create SO Item

INSERT INTO _CEL_PP_ACTIVITIES(
	"_CASE_KEY"
	,"MANDT"
	,"AUFNR"
	,"POSNR"
	,"ACTIVITY_DE"
	,"ACTIVITY_EN"
	,"ACTIVITY_DETAIL_DE"
	,"ACTIVITY_DETAIL_EN"
	,"EVENTTIME"
	,"_SORTING"
	,"USER_NAME"
	,"USER_TYPE"
    ,"SCHEMA"
    ,"PRETTY_NAME"
    ,"TRANSACTION_CODE")
SELECT DISTINCT
	A._CASE_KEY
	,A.MANDT
	,A.AUFNR
	,A.POSNR
    ,'Kundenauftragsposition angelegt' AS "ACTIVITY_DE"
    ,'Sales Order Item created' AS "ACTIVITY_EN"
	,TJ30T_DE.ESTAT || '/' || TJ30T_DE.TXT04 || '/' || TJ30T_DE.STSMA || ' - ' || TJ30T_DE.TXT30 AS ACTIVITY_DETAIL_DE 
	,TJ30T_EN.ESTAT || '/' || TJ30T_EN.TXT04 || '/' || TJ30T_EN.STSMA  || ' - ' || TJ30T_EN.TXT30 AS ACTIVITY_DETAIL_EN
	,DATE_TRUNC('MINUTES', CAST(JCDS.UDATE AS DATE) + CAST(JCDS.UTIME AS TIME) ) AS EVENTTIME
	,5000 AS "_SORTING"
	,JCDS.USNAM AS "USER_NAME"
	,USR02.USTYP AS USER_TYPE 
    ,A."SCHEMA" AS "SCHEMA"
    ,MAP."PRETTY_NAME" AS "PRETTY_NAME"
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    JOIN "SCHEMA_xlsx_MD" as "MAP" on  -- global job
        A."SCHEMA" = "MAP"."SCHEMA"
	JOIN JCDS AS JCDS ON 1=1
        AND JCDS."SCHEMA" = A."SCHEMA"
		AND JCDS.MANDT = A.MANDT
		AND JCDS.OBJNR= 'VB' || A.KDAUF || A.KDPOS
    JOIN JSTO AS JSTO ON 1=1
        AND JSTO."SCHEMA" = "JCDS"."SCHEMA"
        AND JSTO.MANDT = "JCDS"."MANDT"
        AND JSTO.OBJNR = "JCDS"."OBJNR"
	LEFT JOIN TJ30T AS TJ30T_EN ON 1=1
        AND TJ30T_EN."SCHEMA" = JCDS."SCHEMA"
		AND TJ30T_EN.ESTAT = JCDS.STAT
		AND TJ30T_EN.SPRAS = 'E' 
        AND TJ30T_EN.STSMA = JSTO.STSMA 
	LEFT JOIN TJ30T AS TJ30T_DE ON 1=1 
        AND TJ30T_DE."SCHEMA" = JCDS."SCHEMA"
	    AND TJ30T_DE.ESTAT = JCDS.STAT
	 	AND TJ30T_DE.SPRAS = 'D' 
        AND TJ30T_DE.STSMA = JSTO.STSMA  
	LEFT JOIN USR02 AS USR02 ON 1=1
        AND JCDS."SCHEMA" = USR02."SCHEMA"
	 	AND JCDS.MANDT=USR02.MANDT
		AND JCDS.USNAM=USR02.BNAME
WHERE 1=1
    AND A.PRETTY_NAME IN ('PP2004', 'PP2005')
    AND	JCDS.STAT = 'E0001'
    AND JCDS.CHIND = 'I'; --initial insert only