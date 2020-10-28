INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
    "SC/PC",
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
SELECT
    "V_ORDERS"."SCHEMA"as "SCHEMA", -- global job
    "V_ORDERS"."PRETTY_NAME" as "PRETTY_NAME", -- global job
    "V_ORDERS"."SC/PC" as "SC/PC", -- global job
    "V_ORDERS"."_CASE_KEY" AS "_CASE_KEY"
    ,'Lege Auftrag an' AS "ACTIVITY_DE"
    ,'Create Sales Order' AS "ACTIVITY_EN"
    ,CAST("VBAK"."ERDAT" AS DATE) + CAST("VBAK"."ERZET" AS TIME) AS "EVENTTIME"
    ,11 AS "_SORTING"
    ,"V_ORDERS"."ERNAM" AS "USER_NAME"
    ,"USR02"."USTYP" AS "USER_TYPE"
    ,"V_ORDERS"."MANDT" AS "MANDT"
    ,"V_ORDERS"."VBELN" AS "VBELN"
    ,"V_ORDERS"."POSNR" AS "POSNR"
    , V_ORDERS."PRETTY_NAME" ||"V_ORDERS"."MANDT" || "V_ORDERS"."VBELN" AS "_ACTIVITY_KEY"
FROM
    "TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
    LEFT JOIN "VBAK" on 1=1
        AND V_ORDERS."SCHEMA" = "VBAK"."SCHEMA"
        AND "V_ORDERS"."MANDT" = "VBAK"."MANDT"
        AND "V_ORDERS"."VBELN" = "VBAK"."VBELN"
    LEFT JOIN "USR02" AS "USR02" ON
        "V_ORDERS"."MANDT" = "USR02"."MANDT" AND
        V_ORDERS."SCHEMA" = "USR02"."SCHEMA" AND 
        "V_ORDERS"."ERNAM" = "USR02"."BNAME";