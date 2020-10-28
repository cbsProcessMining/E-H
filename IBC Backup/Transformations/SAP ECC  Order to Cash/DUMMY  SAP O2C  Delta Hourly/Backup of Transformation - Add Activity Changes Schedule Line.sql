/*DESCRIPTION:
1. Transformation Description:
This transformation creates the following activities: Change Confirmed Quantity, Change Confirmed Goods Issue Date, Change Requested Quantity, Change Requested Delivery Date, Change Material Availability Date, Change Requested Goods Issue Date, Change Confirmed Delivery Date





2. Required Tables:
CDHDR
CDPOS
TMP_O2C_VBAK_VBAP
USR02
VBEP

3. Required Columns:
CDHDR.CHANGENR
CDHDR.LTRIM
CDHDR.MANDANT
CDHDR.OBJECTCLAS
CDHDR.OBJECTID
CDHDR.TCODE
CDHDR.UDATE
CDHDR.USERNAME
CDHDR.UTIME
CDPOS.CHANGENR
CDPOS.CHNGIND
CDPOS.FNAME
CDPOS.MANDANT
CDPOS.OBJECTCLAS
CDPOS.OBJECTID
CDPOS.TABKEY
CDPOS.TABNAME
CDPOS.VALUE_NEW
CDPOS.VALUE_OLD
TMP_O2C_VBAK_VBAP.MANDT
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
CDHDR.UDATE
CDHDR.UTIME

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
INSERT INTO _CEL_O2C_ACTIVITIES (
	"_CASE_KEY",
	"ACTIVITY_DE",
	"ACTIVITY_EN",
	"EVENTTIME",
	"_SORTING",
	"USER_NAME",
	"USER_TYPE",
	"CHANGED_TABLE",
	"CHANGED_FIELD",
	"CHANGED_FROM",
	"CHANGED_TO",
	"CHANGED_FROM_FLOAT",
	"CHANGED_TO_FLOAT",
	"CHANGE_NUMBER",
	"TRANSACTION_CODE",
	"MANDT",
	"VBELN",
	"POSNR",
    "_ACTIVITY_KEY")
SELECT
	V_ORDERS._CASE_KEY AS _CASE_KEY
	, CASE    
 	    WHEN CDPOS.FNAME = 'EDATU' AND VBEP.BMENG = 0 THEN 'Ändere Angefragtes Lieferdatum'
        WHEN CDPOS.FNAME = 'EDATU' AND VBEP.BMENG > 0 THEN 'Ändere Bestätigtes Lieferdatum' 
 	    WHEN CDPOS.FNAME = 'MBDAT' THEN 'Ändere Materialbereitstellungsdatum'
 	    WHEN CDPOS.FNAME = 'WADAT' AND VBEP.BMENG = 0 THEN 'Ändere Angefragtes Warenausgangsdatum'
		WHEN CDPOS.FNAME = 'WADAT' AND VBEP.BMENG > 0 THEN 'Ändere Bestätigtes Warenausgangsdatum'
        WHEN CDPOS.FNAME = 'BMENG' AND VBEP.BMENG = 0 THEN 'Ändere Angefragte Warenausgangsmenge'
		WHEN CDPOS.FNAME = 'BMENG' AND VBEP.ETENR > 0 THEN 'Ändere Bestätigte Warenausgangsmenge'        
 	  END AS  ACTIVITY_DE
	, CASE 
		WHEN CDPOS.FNAME = 'EDATU' AND VBEP.BMENG = 0 THEN 'Change Requested Delivery Date'
        WHEN CDPOS.FNAME = 'EDATU' AND VBEP.BMENG > 0 THEN 'Change Confirmed Delivery Date'
 	    WHEN CDPOS.FNAME = 'MBDAT' THEN 'Change Material Availability Date'
 	    WHEN CDPOS.FNAME = 'WADAT' AND VBEP.BMENG = 0 THEN 'Change Requested Goods Issue Date'
 	    WHEN CDPOS.FNAME = 'WADAT' AND VBEP.BMENG > 0 THEN 'Change Confirmed Goods Issue Date'
        WHEN CDPOS.FNAME = 'BMENG' AND VBEP.BMENG = 0 THEN 'Change Requested Quantity'
		WHEN CDPOS.FNAME = 'BMENG' AND VBEP.BMENG > 0 THEN 'Change Confirmed Quantity'
 	  END AS  ACTIVITY_EN
	, CAST(CDHDR.UDATE AS DATE) + CAST(ISNULL(CAST(CDHDR.UTIME AS TIME), '23:59:59') AS TIME) AS "EVENTTIME"
	, CASE 
		WHEN CDPOS.FNAME = 'EDATU' AND VBEP.BMENG = 0 THEN 58
        WHEN CDPOS.FNAME = 'EDATU' AND VBEP.BMENG > 0 THEN 59
		WHEN CDPOS.FNAME = 'MBDAT' THEN 106
		WHEN CDPOS.FNAME = 'WADAT' AND VBEP.BMENG = 0 THEN 107
		WHEN CDPOS.FNAME = 'WADAT' AND VBEP.BMENG > 0 THEN 108
        WHEN CDPOS.FNAME = 'BMENG' AND VBEP.BMENG = 0 THEN 109
		WHEN CDPOS.FNAME = 'BMENG' AND VBEP.BMENG > 0 THEN 110
 	  END AS _SORTING
	, CDHDR.USERNAME AS USER_NAME
	, USR02.USTYP AS USER_TYPE
	, CDPOS.TABNAME AS CHANGED_TABLE
	, CDPOS.FNAME AS CHANGED_FIELD
	,"CDPOS"."VALUE_OLD" AS "CHANGED_FROM"
    ,"CDPOS"."VALUE_NEW" AS "CHANGED_TO"
	, NULL AS CHANGED_FROM_FLOAT
	, NULL AS CHANGED_TO_FLOAT
	, CDPOS.CHANGENR AS CHANGE_NUMBER
	, CDHDR.TCODE AS TRANSACTION_CODE
	, V_ORDERS.MANDT AS MANDT
	, V_ORDERS.VBELN AS VBELN
	, V_ORDERS.POSNR AS POSNR
    , "CDHDR"."MANDANT" || "CDHDR"."OBJECTCLAS" || "CDHDR"."OBJECTID" || "CDHDR"."CHANGENR" AS "_ACTIVITY_KEY"
FROM
    TMP_O2C_VBAK_VBAP AS V_ORDERS
	JOIN VBEP AS VBEP ON 1=1
		AND VBEP.VBELN = V_ORDERS.VBELN 
		AND VBEP.POSNR = V_ORDERS.POSNR	
        AND VBEP.MANDT = V_ORDERS.MANDT
	JOIN CDPOS AS CDPOS ON 1=1
	    AND CDPOS.MANDANT = VBEP.MANDT
	    AND CDPOS.TABKEY = VBEP.MANDT || VBEP.VBELN || VBEP.POSNR || VBEP.ETENR
        AND CDPOS.CHNGIND = 'U'
        AND CDPOS.FNAME IN ('EDATU','MBDAT', 'WADAT','BMENG')
        AND CDPOS.TABNAME = 'VBEP'
	JOIN CDHDR AS CDHDR ON 1=1
		AND CDPOS.MANDANT = CDHDR.MANDANT
		AND CDPOS.OBJECTCLAS = CDHDR.OBJECTCLAS
		AND CDPOS.OBJECTID = CDHDR.OBJECTID
		AND CDPOS.CHANGENR = CDHDR.CHANGENR
	LEFT JOIN USR02 AS USR02 ON 1=1
		AND USR02.MANDT = CDHDR.MANDANT 
		AND USR02.BNAME = CDHDR.USERNAME;