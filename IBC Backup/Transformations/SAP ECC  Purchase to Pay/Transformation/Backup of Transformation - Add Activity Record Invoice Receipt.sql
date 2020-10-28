/*DESCRIPTION:
E+H specific logic (CPUDT vs PPDAT)
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
    ,"_ACTIVITY_KEY")
SELECT DISTINCT
    "E"."SCHEMA" as "SCHEMA" -- global job
    ,"E"."PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
    ,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
    ,E.EBELN AS "EBELN"
    ,E.EBELP AS "EBELP"
    ,'Erfasse Rechnungseingang' AS "ACTIVITY_DE"
    ,'Record Invoice Receipt' AS "ACTIVITY_EN"
    , CASE
        WHEN B."PPDAT" is not null THEN CAST(B."PPDAT" as DATE) + CAST(B.PPTME AS TIME) -- if "Vorerfasst-Feld" filled, take PPDAT+PPTME, else use standard logic
        ELSE CAST(B."CPUDT" AS DATE) + CAST(B."CPUTM" as TIME)
     END AS "EVENTTIME"
    ,1870 AS "_SORTING"
    ,"E"."PRETTY_NAME"||B."MANDT" || B."BUKRS" || B."BELNR" || B."GJAHR" -- global job
FROM 
    RSEG AS RSEG
    INNER JOIN TMP_P2P_EKKO_EKPO AS E ON 1=1
        AND RSEG."SCHEMA" = E."SCHEMA" -- global job
        AND RSEG.MANDT = E.MANDT
        AND RSEG.EBELN = E.EBELN
        AND RSEG.EBELP = E.EBELP
    INNER JOIN TMP_P2P_BKPF_BSEG AS B ON 1=1
        AND B."SCHEMA" = RSEG."SCHEMA" -- global job
        AND B.MANDT = RSEG.MANDT
        AND SUBSTRING(B.AWKEY,1,14) = RSEG.BELNR || CAST(RSEG.GJAHR AS VARCHAR(4))
WHERE 1=1
    AND B.KOART = 'K'  
    AND B.BLDAT IS NOT NULL;