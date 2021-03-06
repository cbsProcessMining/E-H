INSERT INTO _CEL_PP_ACTIVITIES (
	"_CASE_KEY"
	,"MANDT"
	,"AUFNR"
	,"POSNR"
	,"ACTIVITY_DE"
	,"ACTIVITY_EN"
	,"EVENTTIME"
	,"_SORTING"
	,"USER_NAME"
	,"USER_TYPE"
    , "SCHEMA"
    , "PRETTY_NAME")
SELECT DISTINCT 
	A._CASE_KEY
	,A.MANDT
	,A.AUFNR
	,A.POSNR
	,'Erste Rückmeldung' AS "ACTIVITY_DE"
	,'First confirmation' AS "ACTIVITY_EN"
	,CAST(AFRU.IEDD AS DATE) + CAST(AFRU.IEDZ AS TIME) AS EVENTTIME
	,25000
	,AFRU.ERNAM AS USER_NAME
	,USR02.USTYP AS USER_TYPE
    , A."SCHEMA" AS "SCHEMA"
    , A."PRETTY_NAME" AS "PRETTY_NAME"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
	JOIN AFRU AS AFRU ON 1=1
        AND AFRU."SCHEMA" = A."SCHEMA"
		AND AFRU.MANDT = A.MANDT
		AND AFRU.AUFNR = A.AUFNR		
	JOIN (
		SELECT AFRU."SCHEMA", AFRU.MANDT, AFRU.AUFNR,MIN(AFRU.RUECK || AFRU.RMZHL) AS MIN_RUECK_RMZHL
		FROM AFRU AS AFRU 
		JOIN (
			SELECT AFRU."SCHEMA", AFRU.MANDT, AFRU.AUFNR, MIN(CAST(AFRU.IEDD AS DATE) + CAST(AFRU.IEDZ AS TIME)) AS MIN_TS
			FROM AFRU 
			WHERE 1=1 
				AND AFRU.IEDD IS NOT NULL 
				AND AFRU.IEDZ IS NOT NULL
				AND COALESCE(AFRU.STOKZ,'') <> 'X'	
			GROUP BY AFRU."SCHEMA",AFRU.MANDT,AFRU.AUFNR) AFRU_TMP ON 1=1 
				AND AFRU_TMP."SCHEMA" = AFRU."SCHEMA" 
                AND AFRU_TMP.MANDT = AFRU.MANDT 
				AND AFRU_TMP.AUFNR = AFRU.AUFNR 
				AND AFRU_TMP.MIN_TS = CAST(AFRU.IEDD AS DATE) + CAST(AFRU.IEDZ AS TIME)
				AND COALESCE(AFRU.STOKZ,'') <> 'X'	
		GROUP BY AFRU."SCHEMA", AFRU.MANDT, AFRU.AUFNR) AFRU_TMP2 ON 1=1
            AND AFRU_TMP2."SCHEMA" = AFRU."SCHEMA"
			AND AFRU_TMP2.MANDT = AFRU.MANDT 
			AND AFRU_TMP2.AUFNR = AFRU.AUFNR
			AND AFRU_TMP2.MIN_RUECK_RMZHL = AFRU.RUECK || AFRU.RMZHL	
	LEFT JOIN USR02 AS USR02 ON 1=1
        AND AFRU."SCHEMA" = USR02."SCHEMA"
		AND AFRU.MANDT=USR02.MANDT
		AND AFRU.ERNAM=USR02.BNAME
WHERE 1=1
	AND COALESCE(AFRU.STOKZ,'') <> 'X';
	
-- Query No: 2
INSERT INTO _CEL_PP_ACTIVITIES (
	"_CASE_KEY"
	,"MANDT"
	,"AUFNR"
	,"POSNR"
	,"ACTIVITY_DE"
	,"ACTIVITY_EN"
	,"EVENTTIME"
	,"_SORTING"
	,"USER_NAME"
	,"USER_TYPE"
    ,"SCHEMA"
    , "PRETTY_NAME")
SELECT DISTINCT 
	A._CASE_KEY
	,A.MANDT
	,A.AUFNR
	,A.POSNR
	,'Letzte Rückmeldung' AS "ACTIVITY_DE"
	,'Last confirmation' AS "ACTIVITY_EN"
    ,CAST(AFRU.IEDD AS DATE) + CAST(AFRU.IEDZ AS TIME) AS EVENTTIME
	,290 AS "_SORTING"
	,AFRU.ERNAM AS USER_NAME
	,USR02.USTYP AS USER_TYPE
    , A."SCHEMA" AS "SCHEMA"
    , A."PRETTY_NAME" AS "PRETTY_NAME"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
	JOIN AFRU AS AFRU ON 1=1 
        AND AFRU."SCHEMA" = A."SCHEMA"
		AND AFRU.MANDT = A.MANDT
		AND AFRU.AUFNR = A.AUFNR		
	JOIN (
		SELECT AFRU."SCHEMA", AFRU.MANDT, AFRU.AUFNR,MAX(AFRU.RUECK || AFRU.RMZHL) AS MAX_RUECK_RMZHL
		FROM AFRU AS AFRU 
		JOIN (
			SELECT AFRU."SCHEMA", AFRU.MANDT, AFRU.AUFNR, MAX(CAST(AFRU.IEDD AS DATE) + CAST(AFRU.IEDZ AS TIME)) AS MAX_TS
			FROM AFRU 
			WHERE 1=1
				AND AFRU.IEDD IS NOT NULL 
				AND AFRU.IEDZ IS NOT NULL
				AND COALESCE(AFRU.STOKZ,'') <> 'X'
			GROUP BY AFRU."SCHEMA",AFRU.MANDT,AFRU.AUFNR) AFRU_TMP ON 1=1 
				AND AFRU_TMP."SCHEMA" = AFRU."SCHEMA"
                AND AFRU_TMP.MANDT = AFRU.MANDT 
				AND AFRU_TMP.AUFNR = AFRU.AUFNR 
				AND AFRU_TMP.MAX_TS = CAST(AFRU.IEDD AS DATE) + CAST(AFRU.IEDZ AS TIME)
				AND COALESCE(AFRU.STOKZ,'') <> 'X'	
		GROUP BY AFRU."SCHEMA",AFRU.MANDT, AFRU.AUFNR) AFRU_TMP2 ON 1=1 
			AND AFRU_TMP2."SCHEMA" = AFRU."SCHEMA"
            AND AFRU_TMP2.MANDT = AFRU.MANDT 
			AND AFRU_TMP2.AUFNR = AFRU.AUFNR
			AND AFRU_TMP2.MAX_RUECK_RMZHL = AFRU.RUECK || AFRU.RMZHL	
	LEFT JOIN USR02 AS USR02 ON 1=1
        AND AFRU."SCHEMA" = USR02."SCHEMA"
		AND AFRU.MANDT=USR02.MANDT
		AND AFRU.ERNAM=USR02.BNAME
WHERE 1=1
	AND COALESCE(AFRU.STOKZ,'') <> 'X';