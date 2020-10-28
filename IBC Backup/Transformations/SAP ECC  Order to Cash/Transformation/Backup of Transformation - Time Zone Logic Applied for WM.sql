Select V_ORDERS.PRETTY_NAME, V_ORDERS._CASE_KEY,  LTAP.QDATU, LTAP.QZEIT, "USR02"."BNAME", "USR02"."TZONE", "TTZR"."UTCDIFF", TTZR.UTCSIGN,

CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME) AS "EVENTTIME"
,       
 case  TTZR.UTCSIGN 
            when  '+'
            THEN case when cast(TIMESTAMPADD(mi,minute("TTZR"."UTCDIFF"),TIMESTAMPADD(hh, hour("TTZR"."UTCDIFF")-1, (CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME)))) -- for UTC+1 Time Zone has to be added 
            when '-'
            THEN TIMESTAMPADD(mi,-minute("TTZR"."UTCDIFF"),TIMESTAMPADD(hh,-hour("TTZR"."UTCDIFF")+1, (CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME)))) -- for UTC+1 Time Zone has to be subtracted
    end as "EVENTTIME_MOD"
   
FROM
    "TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
    JOIN "VBFA" AS "VBFA" ON 1=1
        AND "V_ORDERS"."SCHEMA" = "VBFA"."SCHEMA" -- global job
        AND "V_ORDERS"."MANDT" = "VBFA"."MANDT"
        AND "V_ORDERS"."VBELN" = "VBFA"."VBELV"
        AND "V_ORDERS"."POSNR" = "VBFA"."POSNV"
    JOIN "LIPS" AS "LIPS" ON 1=1
        AND "VBFA"."SCHEMA" = "LIPS"."SCHEMA" -- global job
        AND "VBFA"."MANDT" = "LIPS"."MANDT"
        AND "VBFA"."VBELN" = "LIPS"."VBELN"
        AND "VBFA"."POSNN" = "LIPS"."POSNR" 
    JOIN "LIKP" AS "LIKP" ON 1=1
        AND "LIPS"."SCHEMA" = "LIKP"."SCHEMA" -- global job
        AND "LIPS"."MANDT" = "LIKP"."MANDT"
        AND "LIPS"."VBELN" = "LIKP"."VBELN"  
    JOIN "LTAP" AS LTAP ON 1 = 1
        AND "LTAP"."SCHEMA" = "LIPS"."SCHEMA" -- global job 
        AND LTAP.MANDT = LIPS.MANDT
        AND LTAP.VBELN = "LIPS"."VBELN"
        AND LTAP.POSNR = "LIPS"."POSNR"
    LEFT JOIN "USR02" AS "USR02" ON 1=1
        AND "LIKP"."SCHEMA" = "USR02"."SCHEMA" -- global job
        AND "LIKP"."MANDT" = "USR02"."MANDT"
        AND "LIKP"."ERNAM" = "USR02"."BNAME"
    LEFT JOIN TTZZ as TTZZ on 1 = 1
        AND USR02."SCHEMA" = TTZZ."SCHEMA"
        AND USR02."TZONE" = TTZZ.TZONE
    LEFT JOIN TTZR AS TTZR ON 1 = 1
        AND "TTZZ"."SCHEMA" = TTZR."SCHEMA"
        AND "TTZZ"."ZONERULE" = TTZR."ZONERULE"
   WHERE 
    "LTAP"."PQUIT" = 'X' AND USR02.TZONE is not null





