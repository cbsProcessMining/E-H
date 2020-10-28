DROP VIEW IF EXISTS "O2C_VBFA_V";

CREATE VIEW "O2C_VBFA_V" AS (
    SELECT
        MAP.* -- global job
        ,"VBFA"."MANDT"
        ,"VBFA"."VBELV"
        ,"VBFA"."POSNV"
        ,"VBFA"."VBELN"
        ,"VBFA"."POSNN"
        ,"VBFA"."VBTYP_N"
        ,"VBFA"."ERDAT"
        ,"VBFA"."ERZET"
    FROM VBFA
    JOIN "SCHEMA_xlsx_MD" as "MAP" on -- global job
        VBFA."SCHEMA" = "MAP"."SCHEMA"
    WHERE EXISTS(SELECT * FROM TMP_O2C_VBAK_VBAP AS "V_ORDERS"
        WHERE 1=1
            AND "V_ORDERS"."SCHEMA" = VBFA."SCHEMA" -- global Job
            AND "V_ORDERS"."MANDT" = "VBFA"."MANDT"
			AND "V_ORDERS"."VBELN" = "VBFA"."VBELV"
			AND "V_ORDERS"."POSNR" = "VBFA"."POSNV"
            )
);

DROP VIEW IF EXISTS "O2C_VBFA_N";

CREATE VIEW "O2C_VBFA_N" AS (
    SELECT
        MAP.* -- global job
        ,"VBFA"."MANDT"
        ,"VBFA"."VBELV"
        ,"VBFA"."POSNV"
        ,"VBFA"."VBELN"
        ,"VBFA"."POSNN"
        ,"VBFA"."VBTYP_N"
        ,"VBFA"."ERDAT"
        ,"VBFA"."ERZET"
    FROM VBFA
    JOIN "SCHEMA_xlsx_MD" as "MAP" on -- global job
        VBFA."SCHEMA" = "MAP"."SCHEMA"
    WHERE EXISTS(SELECT * FROM TMP_O2C_VBAK_VBAP AS "V_ORDERS"
        WHERE 1=1
            AND "V_ORDERS"."MANDT" = "VBFA"."MANDT"
			AND "V_ORDERS"."VBELN" = "VBFA"."VBELN"
			AND "V_ORDERS"."POSNR" = "VBFA"."POSNN"
            AND V_ORDERS."SCHEMA" = VBFA."SCHEMA" -- Global Job
            )
    AND "VBFA"."VBTYP_V" = '<%=orderDocQuotes%>'
);