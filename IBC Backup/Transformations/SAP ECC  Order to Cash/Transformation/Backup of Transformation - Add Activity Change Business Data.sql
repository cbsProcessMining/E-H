/*DESCRIPTION:
1. Transformation Description:
This transformation creates the following activities: Inco Terms ( Part 1 ) (...), Payment Terms, Inco Terms ( Part 2 ) (...), Shipping Type, Freight Terms













2. Required Tables:
CDHDR
CDPOS
TMP_O2C_VBAK_VBAP
USR02

3. Required Columns:
CDHDR.CDHDR
CDHDR.CDPOS
CDHDR.CHANGENR
CDHDR.LTRIM
CDHDR.MANDANT
CDHDR.OBJECTCLAS
CDHDR.OBJECTID
CDHDR.TCODE
CDHDR.UDATE
CDHDR.USERNAME
CDHDR.USR02
CDHDR.UTIME
CDPOS.CHANGENR
CDPOS.CHNGIND
CDPOS.FNAME
CDPOS.MANDANT
CDPOS.OBJECTCLAS
CDPOS.OBJECTID
CDPOS.TABKEY
CDPOS.TABNAME
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
-- Query 1: Changes to business data for POSNR = '000000' --> Sales Order Header / all items
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
    "SC/PC", -- global job
	"_CASE_KEY",
	"ACTIVITY_EN",
    "ACTIVITY_DE",
	"EVENTTIME",
	"_SORTING",
	"USER_NAME",
	"USER_TYPE",
	"CHANGED_TABLE",
	"CHANGED_FIELD",
	"CHANGED_FROM",
	"CHANGED_TO",
	"CHANGE_NUMBER",
	"TRANSACTION_CODE",
	"MANDT",
	"VBELN",
	"POSNR",
    "_ACTIVITY_KEY")
SELECT
    "V_ORDERS"."SCHEMA", -- global job
    "V_ORDERS"."PRETTY_NAME", -- global job
    "V_ORDERS"."SC/PC", -- global job
	"V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
	,'Change ' || CASE 
    	WHEN "CDPOS"."FNAME" = 'BSTKD' THEN 'PO Number'
		WHEN "CDPOS"."FNAME" = 'BSTDK' THEN 'PO Date'
		WHEN "CDPOS"."FNAME" = 'VSART' THEN 'Shipping Type'
		WHEN "CDPOS"."FNAME" = 'SDABW' THEN 'Freight Terms'
		WHEN "CDPOS"."FNAME" = 'ZTERM' THEN 'Payment Terms'
		WHEN "CDPOS"."FNAME" = 'INCO1' THEN 'Inco Terms (Part 1)'
		WHEN "CDPOS"."FNAME" = 'INCO2' THEN 'Inco Terms (Part 2)'
        ELSE "CDPOS"."FNAME" -- if a change has occured on a field which has not been defined: Analye in Frontend and define name here
 	END AS  "ACTIVITY_EN"
    ,'Ändere ' || CASE 
        WHEN "CDPOS"."FNAME" = 'BSTKD' THEN 'PO Nummer'
        WHEN "CDPOS"."FNAME" = 'BSTDK' THEN 'PO Datum'
        WHEN "CDPOS"."FNAME" = 'VSART' THEN 'Versandart'
        WHEN "CDPOS"."FNAME" = 'SDABW' THEN 'Frachtbedingungen'
        WHEN "CDPOS"."FNAME" = 'ZTERM' THEN 'Zahlungsbedingungen'
        WHEN "CDPOS"."FNAME" = 'INCO1' THEN 'Inco Terms (Teil 1)'
        WHEN "CDPOS"."FNAME" = 'INCO2' THEN 'Inco Terms (Teil 2)'
        ELSE "CDPOS"."FNAME" -- if a change has occured on a field which has not been defined: Analye in Frontend and define name here
    END AS  "ACTIVITY_DE"
    ,CAST(CDHDR.UDATE AS DATE) + CAST(ISNULL(CAST(CDHDR.UTIME AS TIME), '23:59:59') AS TIME) AS "EVENTTIME"
	,50 + row_number() OVER (PARTITION BY V_ORDERS._CASE_KEY) AS "_SORTING"
	,"CDHDR"."USERNAME" AS "USER_NAME"
	,CASE
		WHEN "CDHDR"."USERNAME" = 'WF-BATCH' THEN 'B'
		ELSE "USR02"."USTYP"
	END AS "USER_TYPE"
	,"CDPOS"."TABNAME" AS "CHANGED_TABLE"
	,"CDPOS"."FNAME" AS "CHANGED_FIELD"
	,"CDPOS"."VALUE_OLD" AS "CHANGED_FROM"
    ,"CDPOS"."VALUE_NEW" AS "CHANGED_TO"
	,"CDPOS"."CHANGENR" AS "CHANGE_NUMBER"
	,"CDHDR"."TCODE" AS "TRANSACTION_CODE"
	,"V_ORDERS"."MANDT" AS "MANDT"
	,"V_ORDERS"."VBELN" AS "VBELN"
	,"V_ORDERS"."POSNR" AS "POSNR"
    ,"V_ORDERS"."PRETTY_NAME"||"CDHDR"."MANDANT" || "CDHDR"."OBJECTCLAS" || "CDHDR"."OBJECTID" || "CDHDR"."CHANGENR" AS "_ACTIVITY_KEY" -- global job
FROM
	"TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
	JOIN "CDPOS" AS "CDPOS" ON 1=1
        AND "CDPOS"."SCHEMA" = "V_ORDERS"."SCHEMA" -- global job
	    AND "CDPOS"."MANDANT" = "V_ORDERS"."MANDT"
	    AND "CDPOS"."TABKEY" = "V_ORDERS"."MANDT" || "V_ORDERS"."VBELN" || '000000' 
        AND "CDPOS"."CHNGIND" = 'U'
        -- AND "CDPOS"."FNAME" IN ('BSTKD', 'BSTDK', 'VSART', 'SDABW', 'ZTERM', 'INCO1', 'INCO2')
        AND "CDPOS"."TABNAME" = 'VBKD' 
	JOIN "CDHDR" AS "CDHDR" ON 1 = 1
        AND "CDPOS"."SCHEMA" = "CDHDR"."SCHEMA" -- global job
		AND "CDPOS"."MANDANT" = "CDHDR"."MANDANT"
		AND "CDPOS"."OBJECTCLAS" = "CDHDR"."OBJECTCLAS"
		AND "CDPOS"."OBJECTID" = "CDHDR"."OBJECTID"
		AND "CDPOS"."CHANGENR" = "CDHDR"."CHANGENR"
	LEFT JOIN "USR02" AS "USR02" ON 1 = 1
        AND "USR02"."SCHEMA" = "CDHDR"."SCHEMA" -- global job
		AND "USR02"."MANDT" = "CDHDR"."MANDANT" AND
		"USR02"."BNAME" = "CDHDR"."USERNAME";

-- Query 2: Changes to business data for POSNR <> POSNR --> Sales Order item specific
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
    "SC/PC", -- global job
	"_CASE_KEY",
	"ACTIVITY_EN",
    "ACTIVITY_DE",
	"EVENTTIME",
	"_SORTING",
	"USER_NAME",
	"USER_TYPE",
	"CHANGED_TABLE",
	"CHANGED_FIELD",
	"CHANGED_FROM",
	"CHANGED_TO",
	"CHANGE_NUMBER",
	"TRANSACTION_CODE",
	"MANDT",
	"VBELN",
	"POSNR",
    "_ACTIVITY_KEY")
SELECT
    "V_ORDERS"."SCHEMA", -- global job
    "V_ORDERS"."PRETTY_NAME", -- global job
    "V_ORDERS"."SC/PC", -- global job
	"V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
	,'Change ' || CASE 
    	WHEN "CDPOS"."FNAME" = 'BSTKD' THEN 'PO Number'
		WHEN "CDPOS"."FNAME" = 'BSTDK' THEN 'PO Date'
		WHEN "CDPOS"."FNAME" = 'VSART' THEN 'Shipping Type'
		WHEN "CDPOS"."FNAME" = 'SDABW' THEN 'Freight Terms'
		WHEN "CDPOS"."FNAME" = 'ZTERM' THEN 'Payment Terms'
		WHEN "CDPOS"."FNAME" = 'INCO1' THEN 'Inco Terms (Part 1)'
		WHEN "CDPOS"."FNAME" = 'INCO2' THEN 'Inco Terms (Part 2)'
        ELSE "CDPOS"."FNAME" -- if a change has occured on a field which has not been defined: Analye in Frontend and define name here
 	END AS  "ACTIVITY_EN"
    ,'Ändere ' || CASE 
        WHEN "CDPOS"."FNAME" = 'BSTKD' THEN 'PO Nummer'
        WHEN "CDPOS"."FNAME" = 'BSTDK' THEN 'PO Datum'
        WHEN "CDPOS"."FNAME" = 'VSART' THEN 'Versandart'
        WHEN "CDPOS"."FNAME" = 'SDABW' THEN 'Frachtbedingungen'
        WHEN "CDPOS"."FNAME" = 'ZTERM' THEN 'Zahlungsbedingungen'
        WHEN "CDPOS"."FNAME" = 'INCO1' THEN 'Inco Terms (Teil 1)'
        WHEN "CDPOS"."FNAME" = 'INCO2' THEN 'Inco Terms (Teil 2)'
        ELSE "CDPOS"."FNAME" -- if a change has occured on a field which has not been defined: Analye in Frontend and define name here
    END AS  "ACTIVITY_DE"
    ,CAST(CDHDR.UDATE AS DATE) + CAST(ISNULL(CAST(CDHDR.UTIME AS TIME), '23:59:59') AS TIME) AS "EVENTTIME"
	,50 + row_number() OVER (PARTITION BY V_ORDERS._CASE_KEY) AS "_SORTING"
	,"CDHDR"."USERNAME" AS "USER_NAME"
	,CASE
		WHEN "CDHDR"."USERNAME" = 'WF-BATCH' THEN 'B'
		ELSE "USR02"."USTYP"
	END AS "USER_TYPE"
	,"CDPOS"."TABNAME" AS "CHANGED_TABLE"
	,"CDPOS"."FNAME" AS "CHANGED_FIELD"
	,"CDPOS"."VALUE_OLD" AS "CHANGED_FROM"
    ,"CDPOS"."VALUE_NEW" AS "CHANGED_TO"
	,"CDPOS"."CHANGENR" AS "CHANGE_NUMBER"
	,"CDHDR"."TCODE" AS "TRANSACTION_CODE"
	,"V_ORDERS"."MANDT" AS "MANDT"
	,"V_ORDERS"."VBELN" AS "VBELN"
	,"V_ORDERS"."POSNR" AS "POSNR"
    ,"V_ORDERS"."PRETTY_NAME"||"CDHDR"."MANDANT" || "CDHDR"."OBJECTCLAS" || "CDHDR"."OBJECTID" || "CDHDR"."CHANGENR" AS "_ACTIVITY_KEY" -- global job
FROM
	"TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
	JOIN "CDPOS" AS "CDPOS" ON 1=1
        AND "CDPOS"."SCHEMA" = "V_ORDERS"."SCHEMA" -- global job
	    AND "CDPOS"."MANDANT" = "V_ORDERS"."MANDT"
	    AND "CDPOS"."TABKEY" = "V_ORDERS"."MANDT" || "V_ORDERS"."VBELN" || "V_ORDERS"."POSNR" 
        AND "CDPOS"."CHNGIND" = 'U'
        -- AND "CDPOS"."FNAME" IN ('BSTKD', 'BSTDK', 'VSART', 'SDABW', 'ZTERM', 'INCO1', 'INCO2')
        AND "CDPOS"."TABNAME" = 'VBKD' 
	JOIN "CDHDR" AS "CDHDR" ON 1 = 1
        AND "CDPOS"."SCHEMA" = "CDHDR"."SCHEMA" -- global job
		AND "CDPOS"."MANDANT" = "CDHDR"."MANDANT"
		AND "CDPOS"."OBJECTCLAS" = "CDHDR"."OBJECTCLAS"
		AND "CDPOS"."OBJECTID" = "CDHDR"."OBJECTID"
		AND "CDPOS"."CHANGENR" = "CDHDR"."CHANGENR"
	LEFT JOIN "USR02" AS "USR02" ON 1 = 1
        AND "USR02"."SCHEMA" = "CDHDR"."SCHEMA" -- global job
		AND "USR02"."MANDT" = "CDHDR"."MANDANT" AND
		"USR02"."BNAME" = "CDHDR"."USERNAME";