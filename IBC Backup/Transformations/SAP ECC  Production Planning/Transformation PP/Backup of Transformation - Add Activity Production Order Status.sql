INSERT INTO _CEL_PP_ACTIVITIES(
    "SCHEMA" -- global job
    , "PRETTY_NAME" -- global job
    ,"_CASE_KEY"
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
    ,"TRANSACTION_CODE")
SELECT DISTINCT
     A."SCHEMA" AS "SCHEMA" -- global job
    , MAP."PRETTY_NAME" AS PRETTY_NAME -- global job
    ,A._CASE_KEY
	,A.MANDT
	,A.AUFNR
	,A.POSNR
	,CASE
        WHEN JCDS.STAT = 'I0001' AND JCDS.CHIND = 'U' THEN 'Auftrag Stammdaten nachgelesen' 
        WHEN JCDS.STAT = 'I0007' AND JCDS.CHIND = 'U' THEN 'Auftrag Nachgedruckt' 
		WHEN COALESCE(JCDS.INACT,'') <> 'X' THEN 'Auftrag ' || TJ02T_DE.TXT30 || ' (' || "TJ02T_DE"."TXT04" || ')'
		WHEN JCDS.INACT ='X' THEN 'Auftrag ' || TJ02T_DE.TXT30 || ' zurückgenommen (' || "TJ02T_DE"."TXT04" || ')'
	END AS "ACTIVITY_DE"
	,CASE
        WHEN JCDS.STAT = 'I0001' AND JCDS.CHIND = 'U' THEN 'Order Re-Read Master Data'
        WHEN JCDS.STAT = 'I0007' AND JCDS.CHIND = 'U' THEN 'Order Reprinted'
		WHEN COALESCE(JCDS.INACT,'') <> 'X' THEN 'Order ' || TJ02T_EN.TXT30 || ' (' || "TJ02T_EN"."TXT04" || ')'
		WHEN JCDS.INACT ='X' THEN 'Order '|| TJ02T_EN.TXT30 || ' canceled (' || "TJ02T_EN"."TXT04" || ')'
	END AS "ACTIVITY_EN"
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_DE.ISTAT || '/' || TJ02T_DE.TXT04 || ' angelegt'
		WHEN JCDS.CHIND ='U' THEN 'ISTAT=' || TJ02T_DE.ISTAT || '/' || TJ02T_DE.TXT04 || ' geändert'
	END AS ACTIVITY_DETAIL_DE 
	,CASE
		WHEN JCDS.CHIND ='I' THEN 'ISTAT=' || TJ02T_EN.ISTAT || '/' || TJ02T_EN.TXT04 || ' inserted'
		WHEN JCDS.CHIND ='U' THEN 'ISTAT=' || TJ02T_EN.ISTAT || '/' || TJ02T_EN.TXT04 || ' updated'
	END AS ACTIVITY_DETAIL_EN
	,CAST(JCDS.UDATE AS DATE) + CAST(JCDS.UTIME AS TIME) AS EVENTTIME
	-- ,CASE JCDS.STAT
	--     WHEN 'I0001' THEN 25100
	--     WHEN 'I0002' THEN 25200
	--     WHEN 'I0003' THEN 25300
	--     WHEN 'I0004' THEN 25400
	--     WHEN 'I0012' THEN 25500
	--     WHEN 'I0043' THEN 25600
	--     WHEN 'I0045' THEN 25700
	--     WHEN 'I0046' THEN 25800
	--     WHEN 'I0055' THEN 25900
	--     WHEN 'I0076' THEN 26000
	--     WHEN 'I0115' THEN 26100
	--     WHEN 'I0361' THEN 26200
	--     WHEN 'I0485' THEN 26300
	--     WHEN 'I0510' THEN 26400
	--     ELSE 25000 + CAST(RIGHT(JCDS.STAT,4) AS INTEGER) 
	, 25000 + CAST(RIGHT(JCDS.STAT,4) AS INTEGER) "_SORTING"
	,"JCDS"."USNAM" AS "USER_NAME"
	,"USR02"."USTYP" AS USER_TYPE
    ,"JCDS"."CDTCODE" AS "TRANSACTION_CODE"
FROM TMP_PP_AUFK_AFKO_AFPO AS A
    JOIN "SCHEMA_xlsx_MD" as "MAP" on 
        A."SCHEMA" = "MAP"."SCHEMA" -- global job
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
WHERE
	JCDS.STAT IN ('I0012', 'I0043', 'I0009', 'I0115') -- Status in here will included inactive Status updates
    OR (JCDS.STAT IN ('I0001','I0002', 'I0003','I0004', 'I0007', 'I0009', 'I0010', 'I0043', 
    'I0045','I0046', 'I0055', 'I0074', 'I0076', 'I0115', 'I0340', 'I0420', 'I0421') 
    AND COALESCE(JCDS.INACT,'') <> 'X' ); -- exluding inactive status
--    AND JCDS.CHIND = 'I' -- Initial inserts only

-- SELECT * FROM JCDS WHERE JCDS.OBJNR= 'OR000067337615'

-- SELECT * FROM "_CEL_PP_ACTIVITIES" 
-- WHERE "_CEL_PP_ACTIVITIES"."_CASE_KEY" IN ('PP10110110000673376150001') 
-- ORDER BY _CASE_KEY, EVENTTIME, _SORTING;

-- SELECT * FROM "_CEL_PP_ACTIVITIES" 
-- WHERE "_CEL_PP_ACTIVITIES"."ACTIVITY_DE" LIKE '%Gesperrt%'
-- ORDER BY _CASE_KEY, EVENTTIME, _SORTING;


--SELECT * FROM TMP_PP_AUFK_AFKO_AFPO WHERE _CASE_KEY IN ('PP10110110000673376150001') 
--SELECT * FROM JCDS WHERE OBJNR = 'OR000067337615'
/* 
 *
 */
-- JCDS.STAT ---
--I0001	E	CRTD	Created
--I0002	E	REL	    Released
--I0003	E	MSCP	Capacity shortage
--I0004	E	MSPT	Material shortage
--I0007 E	PRT     Printed
--I0009	E	CNF    	Confirmed                       + INACT
--I0010 E   PCNF    Partially Confirmed
--I0012	E	DLV	    Delivered                       + INACT
--I0043	E	LKD	    Locked                          + INACT
--I0045	E	TECO	Technically completed
--I0046	E	CLSD	Closed
--I0055	E	RELR	Release rejected
--I0074	E	PDLV	Partially delivered
--I0076	E	DLFL	Deletion Flag
--I0115	E	CSER	Error in cost calculation       + INACT
--I0340	E	MACM	Material committed
--I0420	E	MANC	Mat.availability not checked
--I0421	E	CANC	Capacity avail.not checked

-- inital Celonis Status
--I0361	E	NEWQ	New quantity calculation
--I0485	E	NMAT	No material components
--I0510	E	QADJ	Operation Quantities Adjusted;