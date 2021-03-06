/*DESCRIPTION:
1. Transformation Description:
This transformation creates the following activities: Cancel Service Entry Sheet, Record Goods Receipt, Record Service Entry Sheet, Cancel Goods Receipt, Record Invoice Receipt, Cancel Invoice Receipt

















2. Required Tables:
EKBE
MKPF
MSEG
TMP_P2P_EKKO_EKPO
USR02

3. Required Columns:
EKBE.BELNR
EKBE.CPUDT
EKBE.CPUTM
EKBE.EBELN
EKBE.EBELP
EKBE.ERNAM
EKBE.MANDT
EKBE.SHKZG
EKBE.VGABE
MKPF.MANDT
MKPF.MBLNR
MKPF.MJAHR
MKPF.TCODE2
MSEG.EBELN
MSEG.EBELP
MSEG.MANDT
MSEG.MBLNR
MSEG.MJAHR
TMP_P2P_EKKO_EKPO.EBELN
TMP_P2P_EKKO_EKPO.EBELP
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
EKBE.CPUDT
EKBE.CPUTM

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
INSERT INTO _CEL_P2P_ACTIVITIES(
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
    "SC/PC", -- global job
    "_CASE_KEY"
    ,"MANDT"
	,"EBELN"
	,"EBELP"
    ,"ACTIVITY_DE"
    ,"ACTIVITY_EN"
    ,"EVENTTIME"
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    ,"TRANSACTION_CODE"
    ,"_ACTIVITY_KEY") 
SELECT DISTINCT
    "E"."SCHEMA" as "SCHEMA" -- global job
    ,"E"."PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
    ,E._CASE_KEY AS "_CASE_KEY"
	,E.MANDT AS "MANDT"
	,E.EBELN AS "EBELN"
	,E.EBELP AS "EBELP"
	,CASE 
		WHEN EKBE.VGABE = '1' AND EKBE.SHKZG = 'S' THEN 'Erfasse Wareneingang' 
		WHEN EKBE.VGABE = '1' AND EKBE.SHKZG = 'H' THEN 'Storniere Wareneingang'
		WHEN EKBE.VGABE = '1' THEN  'Erfasse Wareneingang'
		WHEN EKBE.VGABE = '9' AND  EKBE.SHKZG = 'S' THEN 'Erfasse Leistungserfassungsblatt'
		WHEN EKBE.VGABE = '9' AND EKBE.SHKZG = 'H' THEN 'Storniere Leistungserfassungsblatt'
		WHEN EKBE.VGABE = '9' THEN 'Erfasse Leistungserfassungsblatt'
	--	WHEN EKBE.VGABE = '2' AND EKBE.SHKZG = 'S' THEN 'Erfasse Rechnungseingang' 
		WHEN EKBE.VGABE = '2' AND EKBE.SHKZG = 'H' THEN 'Storniere Rechnungseingang'
	--	WHEN EKBE.VGABE = '2' THEN  'Erfasse Rechnungseingang'
	END AS "ACTIVITY_DE"
	,CASE 
		WHEN EKBE.VGABE = '1' AND EKBE.SHKZG = 'S' THEN 'Record Goods Receipt'   
		WHEN EKBE.VGABE = '1' AND EKBE.SHKZG = 'H' THEN 'Cancel Goods Receipt'
		WHEN EKBE.VGABE = '1' THEN  'Record Goods Receipt'
		WHEN EKBE.VGABE = '9' AND  EKBE.SHKZG = 'S' THEN 'Record Service Entry Sheet' 
		WHEN EKBE.VGABE = '9' AND EKBE.SHKZG = 'H' THEN 'Cancel Service Entry Sheet'
		WHEN EKBE.VGABE = '9' THEN 'Record Service Entry Sheet'
		--WHEN EKBE.VGABE = '2' AND EKBE.SHKZG = 'S' THEN 'Record Invoice Receipt' 
		WHEN EKBE.VGABE = '2' AND EKBE.SHKZG = 'H' THEN 'Cancel Invoice Receipt'
	--	WHEN EKBE.VGABE = '2' THEN  'Record Invoice Receipt'
	END AS "ACTIVITY_EN"
	,CAST(EKBE.CPUDT AS DATE) + CAST(EKBE.CPUTM AS TIME) AS "EVENTTIME"
	,CASE
		WHEN EKBE.VGABE = '1' AND EKBE.SHKZG = 'S' THEN 1810
		WHEN EKBE.VGABE = '1' AND EKBE.SHKZG = 'H' THEN 1820
		WHEN EKBE.VGABE = '1' THEN  1830
		WHEN EKBE.VGABE = '9' AND  EKBE.SHKZG = 'S' THEN 1840
		WHEN EKBE.VGABE = '9' AND EKBE.SHKZG = 'H' THEN 1850
		WHEN EKBE.VGABE = '9' THEN  1860
	--	WHEN EKBE.VGABE = '2' AND EKBE.SHKZG = 'S' THEN 1870
		WHEN EKBE.VGABE = '2' AND EKBE.SHKZG = 'H' THEN 1880
	--	WHEN EKBE.VGABE = '2' THEN 1890
	END AS "_SORTING"
	,EKBE.ERNAM AS "USER_NAME"
	,USR02.USTYP AS "USER_TYPE"
    ,MKPF.TCODE2 AS "TRANSACTION_CODE"
    ,"E"."PRETTY_NAME"||EKBE.MANDT || EKBE.EBELN ||  EKBE.EBELP || EKBE.ZEKKN || EKBE.VGABE || EKBE.GJAHR || EKBE.BELNR || EKBE.BUZEI AS "_ACTIVITY_KEY" -- global job
FROM
	TMP_P2P_EKKO_EKPO AS E
	INNER JOIN EKBE AS EKBE ON
        E."SCHEMA" = EKBE."SCHEMA" AND -- global job
		E.MANDT = EKBE.MANDT AND
		E.EBELN = EKBE.EBELN AND
		E.EBELP = EKBE.EBELP
    LEFT JOIN MSEG AS MSEG ON
        EKBE."SCHEMA" = MSEG."SCHEMA" AND -- global job
        EKBE.MANDT = MSEG.MANDT AND
        EKBE.EBELN = MSEG.EBELN AND
        EKBE.EBELP = MSEG.EBELP AND
	    EKBE.BELNR = MSEG.MBLNR	
    LEFT JOIN MKPF AS MKPF ON
        MKPF."SCHEMA" = MSEG."SCHEMA" AND -- global job
    	MKPF.MANDT = MSEG.MANDT AND
        MKPF.MBLNR = MSEG.MBLNR AND
        MKPF.MJAHR = MSEG.MJAHR     
	LEFT JOIN USR02 AS USR02 ON
        USR02."SCHEMA" = EKBE."SCHEMA" AND -- global job
		USR02.MANDT = EKBE.MANDT AND
		USR02.BNAME = EKBE.ERNAM
WHERE
	EKBE.VGABE IN ('1','9','2');
