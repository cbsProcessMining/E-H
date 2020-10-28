-- Please activate this activity in case delivery blocks that were set during sales order creation should be displayed as activities

-- Query 1: Default delivery block followed by delivery block changes
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "_CASE_KEY",
    "ACTIVITY_DE",
    "ACTIVITY_EN",
    "EVENTTIME",
    "_SORTING",
    "USER_NAME",
	"USER_TYPE",
    "CHANGED_TABLE",
    "CHANGED_FIELD",
    "CHANGED_TO",
    "MANDT",
    "VBELN",
    "POSNR",
    "_ACTIVITY_KEY")
SELECT
    "V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
    ,'Setze initiale Liefersperre' AS "ACTIVITY_DE"
    ,'Set Initial Delivery Block' AS "ACTIVITY_EN"
    ,CAST("V_ORDERS"."ERDAT" AS DATE) + CAST("V_ORDERS"."ERZET" AS TIME) AS "EVENTTIME"
    ,21 AS "SORTING"
    ,C."USERNAME" AS "USER_NAME"
	,"USR02"."USTYP" AS "USER_TYPE"
    ,C."TABNAME" AS "CHANGED_TABLE"
    ,C."FNAME" AS "CHANGED_FIELD"
    ,C."VALUE_OLD" AS "CHANGED_TO"
    ,V_ORDERS.MANDT AS "MANDT"
    ,V_ORDERS.VBELN AS "VBELN"
    ,V_ORDERS.POSNR AS "POSNR"
    ,V_ORDERS.MANDT || V_ORDERS.VBELN || V_ORDERS.POSNR AS "_ACTIVITY_KEY"
FROM "TMP_O2C_CDHDR_CDPOS" AS C
    INNER JOIN 
            (SELECT
                "MANDANT"
                ,"TABKEY"
                ,MIN(CHANGENR) AS CHANGENR
            FROM "TMP_O2C_CDHDR_CDPOS"
            WHERE 1=1
                AND "FNAME" = 'LIFSK'
                AND "TABNAME" = 'VBAK'
            GROUP BY "MANDANT","TABKEY") 
        AS "TMP_CHANGE" ON 1=1
        AND C.CHANGENR = "TMP_CHANGE".CHANGENR
        AND C.MANDANT = "TMP_CHANGE".MANDANT
        AND C.TABKEY = "TMP_CHANGE".TABKEY
        AND C."VALUE_OLD" IS NOT NULL
    INNER JOIN "TMP_O2C_VBAK_VBAP" AS "V_ORDERS" ON 1=1
        AND C."MANDANT" = "V_ORDERS"."MANDT"
        AND C."TABKEY" = "V_ORDERS"."TABKEY_VBAK"
    LEFT JOIN "USR02" AS "USR02" ON 1=1
		AND "USR02"."MANDT" = C."MANDANT"
		AND "USR02"."BNAME" = C."USERNAME";

-- Query 2: Default delivery blocks without following changes
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "_CASE_KEY",
    "ACTIVITY_DE",
    "ACTIVITY_EN",
    "EVENTTIME",
    "_SORTING",
    "USER_NAME",
	"USER_TYPE",
	"CHANGED_TABLE",
	"CHANGED_FIELD",
	"CHANGED_TO",
	"MANDT",
	"VBELN",
	"POSNR",
    "_ACTIVITY_KEY")
SELECT 
    "V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
    ,'Setze initiale Liefersperre' AS "ACTIVITY_DE"
    ,'Set Initial Delivery Block' AS "ACTIVITY_EN"
    ,CAST("V_ORDERS"."ERDAT" AS DATE) + CAST("V_ORDERS"."ERZET" AS TIME) AS "EVENTTIME"
    ,21 AS "SORTING"
    ,"TMP_CHANGE"."USERNAME" AS "USER_NAME"
	,"USR02"."USTYP" AS "USER_TYPE"
	,"TMP_CHANGE"."TABNAME" AS "CHANGED_TABLE"
	,"TMP_CHANGE"."FNAME" AS "CHANGED_FIELD"
	,"V_ORDERS"."LIFSK" AS "CHANGED_TO"
	,"V_ORDERS"."MANDT" AS "MANDT"
	,"V_ORDERS"."VBELN" AS "VBELN"
	,"V_ORDERS"."POSNR" AS "POSNR"
    ,"V_ORDERS"."MANDT" || "V_ORDERS"."VBELN" || "V_ORDERS"."POSNR" AS "_ACTIVITY_KEY"
FROM
    "TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
    LEFT JOIN "TMP_O2C_CDHDR_CDPOS" AS "TMP_CHANGE" ON 1=1
        AND "TMP_CHANGE"."MANDANT" = "V_ORDERS"."MANDT"
        AND "TMP_CHANGE"."TABKEY" = "V_ORDERS"."TABKEY_VBAK"
        AND "TMP_CHANGE"."TABNAME" = 'VBAK'
        AND "TMP_CHANGE"."FNAME" = 'LIFSK'
    LEFT JOIN "USR02" AS "USR02" ON
		"USR02"."MANDT" = "TMP_CHANGE"."MANDANT" AND
		"USR02"."BNAME" = "TMP_CHANGE"."USERNAME"
WHERE 1=1
    AND "V_ORDERS"."LIFSK" IS NOT NULL
    AND "TMP_CHANGE"."CHANGENR" IS NULL;