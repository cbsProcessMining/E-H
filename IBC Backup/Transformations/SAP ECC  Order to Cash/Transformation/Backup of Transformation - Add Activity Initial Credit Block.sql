-- Please activate this activity in case credit holds that were set during sales order creation should be displayed as activities

-- Query 1: Default credit holds followed by credit checks (credit check status changed)
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
    "SC/PC", -- global job
    "_CASE_KEY",
    "ACTIVITY_DE",
    "ACTIVITY_EN",
    "EVENTTIME",
    "_SORTING",
    "CHANGED_TABLE",
    "CHANGED_FIELD",
    "MANDT",
    "VBELN",
    "POSNR",
    "_ACTIVITY_KEY")
SELECT 
    "V_ORDERS"."SCHEMA" as "SCHEMA", -- global job
    "V_ORDERS"."PRETTY_NAME", -- global job
    "V_ORDERS"."SC/PC", -- global job
    "V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
    ,'Setze initiale Kreditsperre' AS "ACTIVITY_DE"
    ,'Set Initial Credit Block' AS "ACTIVITY_EN"
    ,CAST("V_ORDERS"."ERDAT" AS DATE) + CAST("V_ORDERS"."ERZET" AS TIME) AS "EVENTTIME"
    ,21 AS "SORTING"
    ,C."TABNAME" AS "CHANGED_TABLE"
    ,C."FNAME" AS "CHANGED_FIELD"
    ,V_ORDERS.MANDT AS "MANDT"
    ,V_ORDERS.VBELN AS "VBELN"
    ,V_ORDERS.POSNR AS "POSNR"
    , V_ORDERS."PRETTY_NAME"|| V_ORDERS.MANDT || V_ORDERS.VBELN || V_ORDERS.POSNR AS "_ACTIVITY_KEY" -- global job
FROM "TMP_O2C_CDHDR_CDPOS" AS C
    INNER JOIN 
            (SELECT
                "SCHEMA", -- global job
                "MANDANT"
                ,"TABKEY"
                ,MIN(CHANGENR) AS CHANGENR
            FROM "TMP_O2C_CDHDR_CDPOS"
            WHERE 1=1
                AND "FNAME" = 'CMGST'
                AND "TABNAME" = 'VBUK'
            GROUP BY "SCHEMA", "MANDANT","TABKEY") -- global job
        AS "TMP_CHANGE" ON 1=1
        AND C."SCHEMA" = "TMP_CHANGE"."SCHEMA" -- global job
        AND C.CHANGENR = "TMP_CHANGE".CHANGENR
        AND C.MANDANT = "TMP_CHANGE".MANDANT
        AND C.TABKEY = "TMP_CHANGE".TABKEY
        AND C."VALUE_OLD" = 'B'
    INNER JOIN "TMP_O2C_VBAK_VBAP" AS "V_ORDERS" ON 1=1
        AND C."SCHEMA" = "V_ORDERS"."SCHEMA" -- global job
        AND C."MANDANT" = "V_ORDERS"."MANDT"
        AND C."TABKEY" = "V_ORDERS"."TABKEY_VBAK";

-- Query 2: Default Credit Holds without following Credit Checks (Sales Order might have been rejected or not released)
INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global JOB
    "PRETTY_NAME", -- global job
    "SC/PC", -- global job
    "_CASE_KEY",
    "ACTIVITY_DE",
    "ACTIVITY_EN",
    "EVENTTIME",
    "_SORTING",
    "CHANGED_TABLE",
    "CHANGED_FIELD",
    "MANDT",
    "VBELN",
    "POSNR",
    "_ACTIVITY_KEY")
SELECT
    "V_ORDERS"."SCHEMA", -- global job
    "V_ORDERS"."PRETTY_NAME", -- global job
    "V_ORDERS"."SC/PC", -- global job
    "V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
    ,'Setze initiale Kreditsperre' AS "ACTIVITY_DE"
    ,'Set Initial Credit Block' AS "ACTIVITY_EN"
    ,CAST("V_ORDERS"."ERDAT" AS DATE) + CAST("V_ORDERS"."ERZET" AS TIME) AS "EVENTTIME"
    ,21 AS "SORTING"
    ,"TMP_CHANGE"."TABNAME" AS "CHANGED_TABLE"
    ,"TMP_CHANGE"."FNAME" AS "CHANGED_FIELD"
    ,V_ORDERS.MANDT AS "MANDT"
    ,V_ORDERS.VBELN AS "VBELN"
    ,V_ORDERS.POSNR AS "POSNR"
    ,V_ORDERS."PRETTY_NAME"||V_ORDERS.MANDT || V_ORDERS.VBELN || V_ORDERS.POSNR AS "_ACTIVITY_KEY" -- global job
FROM
    "TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
    LEFT JOIN "TMP_O2C_CDHDR_CDPOS" AS "TMP_CHANGE" ON 1=1
        AND "TMP_CHANGE"."SCHEMA" = V_ORDERS."SCHEMA" -- global job
        AND "TMP_CHANGE"."MANDANT" = "V_ORDERS"."MANDT"
        AND "TMP_CHANGE"."TABKEY" = "V_ORDERS"."TABKEY_VBAK"
        AND "TMP_CHANGE"."TABNAME" = 'VBUK'
        AND "TMP_CHANGE"."FNAME" = 'CMGST'
    JOIN VBUK AS VBUK ON 1=1
        AND "VBUK"."SCHEMA" = V_ORDERS."SCHEMA" -- global job
        AND VBUK.MANDT = V_ORDERS.MANDT
        AND VBUK.VBELN = V_ORDERS.VBELN
WHERE 1=1
    AND VBUK.CMGST = 'B'
    AND "TMP_CHANGE"."CHANGENR" IS NULL;