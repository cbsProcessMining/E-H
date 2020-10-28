/*DESCRIPTION:
1. Transformation Description:
This transformation creates the following activities: Update Order Confirmation, Send Order Confirmation





2. Required Tables:
DD07T
NAST
T685T
TMP_O2C_VBAK_VBAP
USR02

3. Required Columns:
DD07T.AVAILLANGUAGEKEYS
DD07T.DDLANGUAGE
DD07T.DOMNAME
DD07T.DOMVALUE_L
DD07T.MESSAGETYPES
DD07T.ORDERCONFIRMATION
NAST.AENDE
NAST.DATVR
NAST.KAPPL
NAST.KSCHL
NAST.MANDT
NAST.NACHA
NAST.OBJKY
NAST.SPRAS
NAST.UHRVR
NAST.USNAM
T685T.KAPPL
T685T.KSCHL
T685T.KVEWE
T685T.MANDT
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
NAST.DATVR
NAST.UHRVR

5. Parameters used in where clause:
messageTypes

6. Parameters used in joins:
availLanguageKeys
*/
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global job
    "PRETTY_NAME",-- global job
    "SC/PC", -- global job
	"_CASE_KEY",
	"ACTIVITY_DE",
	"ACTIVITY_EN",
	"EVENTTIME",
	"_SORTING",
	"USER_NAME",
	"USER_TYPE",
	"MANDT",
	"VBELN",
	"POSNR",
    "_ACTIVITY_KEY")

SELECT DISTINCT
    "V_ORDERS"."SCHEMA", -- global job
    V_ORDERS."PRETTY_NAME", -- global job
    "V_ORDERS"."SC/PC", -- global job
	"V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
	,CASE WHEN NAST.KSCHL IN <%=OrderConfirmation%> AND NAST.AENDE = 'X' THEN 'Ändere Bestellbestätigung' 
		WHEN NAST.KSCHL IN <%=OrderConfirmation%> THEN 'Sende Bestellbestätigung'
		ELSE 'Sende Nachricht: ' || T685T.VTEXT
	END AS "ACTIVITY_DE"
	,CASE WHEN NAST.KSCHL IN <%=OrderConfirmation%> AND NAST.AENDE = 'X' THEN 'Update Order Confirmation' 
		WHEN NAST.KSCHL IN <%=OrderConfirmation%> THEN 'Send Order Confirmation'
		ELSE 'Send Message: ' || T685T.VTEXT
	END AS "ACTIVITY_EN"
	, CAST(NAST.DATVR AS DATE) + CAST(NAST.UHRVR AS TIME) AS "EVENTTIME"
	,80 +
	CASE 
		WHEN NAST.KSCHL IN <%=OrderConfirmation%> AND NAST.AENDE = 'X' THEN 1 
		WHEN NAST.KSCHL IN <%=OrderConfirmation%> THEN 2
		ELSE 3
	END AS "_SORTING"
	,NAST.USNAM AS "USER_NAME"
	,USR02.USTYP AS "USER_TYPE"
	,V_ORDERS.MANDT AS "MANDT"
	,V_ORDERS.VBELN AS "VBELN"
	,V_ORDERS.POSNR AS "POSNR"
    ,V_ORDERS."PRETTY_NAME"||NAST.MANDT || NAST.KAPPL|| NAST.OBJKY || NAST.KSCHL|| NAST.PARNR AS "_ACTIVITY_KEY"
FROM 
	NAST AS NAST
	INNER JOIN TMP_O2C_VBAK_VBAP AS V_ORDERS ON 1=1
        AND "NAST"."SCHEMA" = "V_ORDERS"."SCHEMA" -- global job
		AND NAST.MANDT = V_ORDERS.MANDT 
		AND NAST.OBJKY = V_ORDERS.VBELN
        AND NAST.DATVR IS NOT NULL 
        AND NAST.KAPPL = 'V1' 
        AND NAST.KSCHL IN <%=OrderConfirmation%> -- changed from Data pool parameter "message types"
	LEFT JOIN DD07T AS DD07T ON 1=1
        AND "DD07T"."SCHEMA" = "NAST"."SCHEMA" -- global job
		AND DD07T.DOMVALUE_L = NAST.NACHA 
		AND DD07T.DOMNAME = 'NA_NACHA' 
		AND DD07T.DDLANGUAGE IN <%=availLanguageKeys%>
	LEFT JOIN USR02 AS USR02 ON 1=1
        AND "NAST"."SCHEMA" = "USR02"."SCHEMA" -- global job
		AND NAST.MANDT = USR02.MANDT 
		AND NAST.USNAM = USR02.BNAME
	LEFT JOIN T685T AS T685T ON 1=1
        AND "T685T"."SCHEMA" = "NAST"."SCHEMA" -- global job
		AND T685T.MANDT = NAST.MANDT 
		AND T685T.SPRAS = NAST.SPRAS 
		AND T685T.KAPPL = NAST.KAPPL 
		AND T685T.KSCHL = NAST.KSCHL;