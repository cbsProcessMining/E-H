/*DESCRIPTION:
E+H Specific (different Logic per Connection)
*/
-- ***************** PP1 011 Logic*****************************
-- E0007 	D	DOWN	Download MIKE II
-- E0039    D   HYD1	Transfer nach HYDRA

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
    ,'Übergabe an MES' AS "ACTIVITY_DE"
    ,'Download to MES' AS "ACTIVITY_EN"
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ESTAT=' || TJ30T_DE.ESTAT || '/'  || TJ30T_DE.TXT04 || ' - ' || TJ30T_DE.TXT30
	END AS ACTIVITY_DETAIL_DE 
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ESTAT=' || TJ30T_EN.ESTAT || '/' || TJ30T_EN.TXT04 || ' - ' || TJ30T_EN.TXT30
	END AS ACTIVITY_DETAIL_EN
	,CAST(JCDS.UDATE AS DATE) + CAST(JCDS.UTIME AS TIME) AS EVENTTIME
	, 25250 AS "_SORTING"
	,JCDS.USNAM AS "USER_NAME"
	,USR02.USTYP AS USER_TYPE 
    , A."SCHEMA" AS "SCHEMA"
    , MAP."PRETTY_NAME" AS PRETTY_NAME
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    JOIN "SCHEMA_xlsx_MD" as "MAP" on -- global job
        A."SCHEMA" = "MAP"."SCHEMA"
	JOIN JCDS AS JCDS ON 1=1
		AND JCDS.MANDT = A.MANDT
		AND JCDS.OBJNR= 'OR' || A.AUFNR
	LEFT JOIN TJ30T AS TJ30T_EN ON 1=1      -- adapted for E+H End User Status
        AND TJ30T_EN."SCHEMA" = "MAP"."SCHEMA"
        AND TJ30T_EN.STSMA = 'PP000001'
		AND TJ30T_EN.ESTAT = JCDS.STAT
		AND TJ30T_EN.SPRAS = 'E'  
	LEFT JOIN TJ30T AS TJ30T_DE ON 1=1      -- adapted for E+H End User Status
        AND TJ30T_DE."SCHEMA" = "MAP"."SCHEMA"
        AND TJ30T_DE.STSMA = 'PP000001'
		AND TJ30T_DE.ESTAT = JCDS.STAT
		AND TJ30T_DE.SPRAS = 'D'  
	LEFT JOIN USR02 AS USR02 ON 1=1
        AND USR02."SCHEMA" = "MAP"."SCHEMA"
		AND JCDS.MANDT=USR02.MANDT
		AND JCDS.USNAM=USR02.BNAME
WHERE 1=1
    AND "A"."PRETTY_NAME" = 'PP1011'
    AND	JCDS.STAT in ('E0007','E0039')
    AND JCDS.CHIND = 'I'; -- only consider initial status, no updates


-- ***************** PIN 020 Logic*****************************
-- I0048    E   DISB	Distributed to MES;
-- I0007    D   DRUC    Gedruckt 

-- Status DRUC soll nur dann wirken, wenn nicht DISB/I0048 und nicht RVER/I0047 (Relevant für Verteilung an MES) aktiv ist 

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
    , "SCHEMA"
    , "PRETTY_NAME"
    ,"TRANSACTION_CODE")
SELECT DISTINCT
	A._CASE_KEY
	,A.MANDT
	,A.AUFNR
	,A.POSNR
    ,'Übergabe an MES' AS "ACTIVITY_DE"
    ,'Download to MES' AS "ACTIVITY_EN"
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_DE.ISTAT || '/' || TJ02T_DE.TXT04 || ' - ' || TJ02T_DE.TXT30
	END AS ACTIVITY_DETAIL_DE 
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_EN.ISTAT || '/' || TJ02T_EN.TXT04 || ' - ' || TJ02T_EN.TXT30
	END AS ACTIVITY_DETAIL_EN
    ,CAST(JCDS.UDATE AS DATE) + CAST(JCDS.UTIME AS TIME) AS EVENTTIME
	,25250 + CAST(RIGHT(JCDS.STAT,4) AS INTEGER) AS "_SORTING"
	,JCDS.USNAM AS USER_NAME
	,USR02.USTYP AS USER_TYPE
    , A."SCHEMA" AS "SCHEMA"
    , MAP."PRETTY_NAME" AS PRETTY_NAME
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    JOIN "SCHEMA_xlsx_MD" as "MAP" on  -- global job
        A."SCHEMA" = "MAP"."SCHEMA"
	JOIN JCDS AS JCDS ON 1=1
		AND JCDS."SCHEMA" = A."SCHEMA"
        AND JCDS.MANDT = A.MANDT
		AND JCDS.OBJNR= 'OR' || A.AUFNR
	LEFT JOIN TJ02T AS TJ02T_EN ON 1=1
        AND TJ02T_EN."SCHEMA" = JCDS."SCHEMA"
		AND TJ02T_EN.ISTAT = JCDS.STAT
		AND TJ02T_EN.SPRAS = 'E'  
	LEFT JOIN TJ02T AS TJ02T_DE ON 1=1
        AND TJ02T_DE."SCHEMA" = JCDS."SCHEMA"
		AND TJ02T_DE.ISTAT = JCDS.STAT
		AND TJ02T_DE.SPRAS = 'D'  
	LEFT JOIN USR02 AS USR02 ON 1=1
        AND JCDS."SCHEMA" = USR02."SCHEMA"
		AND JCDS.MANDT=USR02.MANDT
		AND JCDS.USNAM=USR02.BNAME
WHERE 1=1
    AND "A"."PRETTY_NAME" = 'PIN020'
    AND (JCDS.STAT = 'I0048' 
        OR ("JCDS"."STAT" = 'I0007' 
           AND NOT EXISTS ( 
                SELECT 1
                FROM JCDS 
                WHERE 1=1
                    AND JCDS."SCHEMA" = A."SCHEMA"
                    AND JCDS.MANDT = A.MANDT
                    AND JCDS.OBJNR= 'OR' || A.AUFNR
                    AND (JCDS.STAT in('I0048','I0047'))
                ) 
            )
        )
    AND JCDS.CHIND = 'I'; -- only consider initial status, no updates

-- ***************** PIN 024 Logic*****************************
-- E0015    E	DOWN	Download PDB
-- ACHTUNG Keine Änderungsbelege für Anwenderstatus in PIN024 aktiv!! Daten müssten aus JEST gelesen werden.
-- Da der Status aber immer dann gesetzt wird, wenn gedruckt wird, verwenden wir einfach den DRUC Status I0007
-- So erhalten wir natürlich keine manuall ausgelösten Events...

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
    ,'Übergabe an MES' AS "ACTIVITY_DE"
    ,'Download to MES' AS "ACTIVITY_EN"
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_DE.ISTAT || '/' || TJ02T_DE.TXT04 || ' - ' || TJ02T_DE.TXT30
	END AS ACTIVITY_DETAIL_DE 
	,CASE
        WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_DE.ISTAT || '/' || TJ02T_DE.TXT04 || ' - ' || TJ02T_DE.TXT30
	END AS ACTIVITY_DETAIL_EN
	,CAST(JCDS.UDATE AS DATE) + CAST(JCDS.UTIME AS TIME) AS EVENTTIME
	, 25250 AS "_SORTING"
	,JCDS.USNAM AS "USER_NAME"
	,"USR02"."USTYP" AS USER_TYPE 
    , A."SCHEMA" AS "SCHEMA"
    , MAP."PRETTY_NAME" AS PRETTY_NAME
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    JOIN "SCHEMA_xlsx_MD" as "MAP" on  -- global job
        A."SCHEMA" = "MAP"."SCHEMA"
	JOIN JCDS AS JCDS ON 1=1
		AND JCDS.MANDT = A.MANDT
		AND JCDS.OBJNR= 'OR' || A.AUFNR
	LEFT JOIN TJ02T AS TJ02T_EN ON 1=1
        AND TJ02T_EN."SCHEMA" = JCDS."SCHEMA"
		AND TJ02T_EN.ISTAT = JCDS.STAT
		AND TJ02T_EN.SPRAS = 'E'  
	LEFT JOIN TJ02T AS TJ02T_DE ON 1=1
        AND TJ02T_DE."SCHEMA" = JCDS."SCHEMA"
		AND TJ02T_DE.ISTAT = JCDS.STAT
		AND TJ02T_DE.SPRAS = 'D'  
	LEFT JOIN USR02 AS USR02 ON 1=1
		AND JCDS.MANDT=USR02.MANDT
		AND JCDS.USNAM=USR02.BNAME
WHERE 1=1
    AND "A"."PRETTY_NAME" = 'PIN024'
    AND	JCDS.STAT = 'I0007'
    AND JCDS.CHIND = 'I'; -- only consider initial status, no updates


-- ***************** PP2 004 Logic*****************************
-- I0048    E   DISB	Distributed to MES;

-- ZZDLDAT geht nicht, weil für den Fall 2 keine JCDS entries existieren UND weil es kein guter Zeitstempel ist.
-- Auch ier verwenden wir wieder den Status DRUC

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
    , "SCHEMA"
    , "PRETTY_NAME"
    ,"TRANSACTION_CODE")
SELECT DISTINCT
	A._CASE_KEY
	,A.MANDT
	,A.AUFNR
	,A.POSNR
    , 'Übergabe an MES' AS "ACTIVITY_DE"
    , 'Download to MES' AS "ACTIVITY_EN"
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_DE.ISTAT || '/' || TJ02T_DE.TXT04 || ' - ' || TJ02T_DE.TXT30
	END AS ACTIVITY_DETAIL_DE 
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_EN.ISTAT || '/' || TJ02T_EN.TXT04 || ' - ' || TJ02T_EN.TXT30
	END AS ACTIVITY_DETAIL_EN
	,CAST(JCDS.UDATE AS DATE) + CAST(JCDS.UTIME AS TIME) AS EVENTTIME
	,25250 + CAST(RIGHT(JCDS.STAT,4) AS INTEGER) AS "_SORTING"
	,JCDS.USNAM AS "USER_NAME"
	,USR02.USTYP AS USER_TYPE
    , A."SCHEMA" AS "SCHEMA"
    , MAP."PRETTY_NAME" AS PRETTY_NAME
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    JOIN "SCHEMA_xlsx_MD" as "MAP" on  -- global job
        A."SCHEMA" = "MAP"."SCHEMA"
	LEFT JOIN JCDS AS JCDS ON 1=1                      -- changed from inner to left join
		AND JCDS."SCHEMA" = A."SCHEMA"
        AND JCDS.MANDT = A.MANDT
		AND JCDS.OBJNR= 'OR' || A.AUFNR
	LEFT JOIN TJ02T AS TJ02T_EN ON 1=1
        AND TJ02T_EN."SCHEMA" = JCDS."SCHEMA"
		AND TJ02T_EN.ISTAT = JCDS.STAT
		AND TJ02T_EN.SPRAS = 'E'  
	LEFT JOIN TJ02T AS TJ02T_DE ON 1=1
        AND TJ02T_EN."SCHEMA" = JCDS."SCHEMA"
		AND TJ02T_DE.ISTAT = JCDS.STAT
		AND TJ02T_DE.SPRAS = 'D'  
	LEFT JOIN USR02 AS USR02 ON 1=1
        AND JCDS."SCHEMA" = USR02."SCHEMA"
		AND JCDS.MANDT=USR02.MANDT
		AND JCDS.USNAM=USR02.BNAME
WHERE 1=1
    AND "A"."PRETTY_NAME" = 'PP2004'
    AND (JCDS.STAT = 'I0048' 
        OR ("JCDS"."STAT" = 'I0007' 
           AND NOT EXISTS ( 
                SELECT 1
                FROM JCDS 
                WHERE 1=1
                    AND JCDS."SCHEMA" = A."SCHEMA"
                    AND JCDS.MANDT = A.MANDT
                    AND JCDS.OBJNR= 'OR' || A.AUFNR
                    AND (JCDS.STAT in ('I0048','I0047'))
                ) 
            )
        )
    AND JCDS.CHIND = 'I'; -- only consider initial status, no updates


-- ***************** PP2 005 Logic*****************************
-- E0007    E	DOWN	Download TDB
-- I0048    E   DISB	Distributed to MES

-- Mal wieder keine JCDS Einträge für E0007, sdfasdgh+
-- Vorgehen wie oben auch. Prüfen auf Status DRUC.

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
    ,'Übergabe an MES' AS "ACTIVITY_DE"
    ,'Download to MES' AS "ACTIVITY_EN"
	,CASE
        WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_DE.ISTAT || '/' || TJ02T_DE.TXT04 || ' - ' || TJ02T_DE.TXT30
	END AS ACTIVITY_DETAIL_DE 
	,CASE
        WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_EN.ISTAT || '/' || TJ02T_EN.TXT04 || ' - ' || TJ02T_EN.TXT30
	END AS ACTIVITY_DETAIL_EN
	,CAST(JCDS.UDATE AS DATE) + CAST(JCDS.UTIME AS TIME) AS EVENTTIME
	, 25250 AS "_SORTING"
	,JCDS.USNAM AS "USER_NAME"
	,USR02.USTYP AS USER_TYPE 
    , A."SCHEMA" AS "SCHEMA"
    , MAP."PRETTY_NAME" AS PRETTY_NAME
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    JOIN "SCHEMA_xlsx_MD" as "MAP" on -- global job
        A."SCHEMA" = "MAP"."SCHEMA"
	JOIN JCDS AS JCDS ON 1=1
		AND JCDS.MANDT = A.MANDT
		AND JCDS.OBJNR= 'OR' || A.AUFNR
    LEFT JOIN TJ02T AS TJ02T_EN ON 1=1
        AND TJ02T_EN."SCHEMA" = JCDS."SCHEMA"
		AND TJ02T_EN.ISTAT = JCDS.STAT
		AND TJ02T_EN.SPRAS = 'E'  
	LEFT JOIN TJ02T AS TJ02T_DE ON 1=1
        AND TJ02T_DE."SCHEMA" = JCDS."SCHEMA"
		AND TJ02T_DE.ISTAT = JCDS.STAT
		AND TJ02T_DE.SPRAS = 'D' 
	LEFT JOIN USR02 AS USR02 ON 1=1
		AND JCDS.MANDT = USR02.MANDT
		AND JCDS.USNAM = USR02.BNAME
WHERE 1=1
    AND "A"."PRETTY_NAME" = 'PP2005'
    AND (JCDS.STAT = 'I0048' 
        OR ("JCDS"."STAT" = 'I0007' 
           AND NOT EXISTS ( 
                SELECT 1
                FROM JCDS
                WHERE 1=1
                    AND JCDS."SCHEMA" = A."SCHEMA"
                    AND JCDS.MANDT = A.MANDT
                    AND JCDS.OBJNR= 'OR' || A.AUFNR
                    AND (JCDS.STAT in ('I0048','I0047'))
                ) 
            )
        )
    AND JCDS.CHIND = 'I'; -- only consider initial status, no updates