DROP TABLE IF EXISTS "O2C_VBFA_V";

CREATE TABLE "O2C_VBFA_V" AS (
    SELECT
        "VBFA"."MANDT"
        ,"VBFA"."VBELV"
        ,"VBFA"."POSNV"
        ,"VBFA"."VBELN"
        ,"VBFA"."POSNN"
        ,"VBFA"."VBTYP_N"
        ,"VBFA"."ERDAT"
        ,"VBFA"."ERZET"
    FROM VBFA
    WHERE EXISTS(SELECT * FROM "TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
        WHERE 1=1
            AND "V_ORDERS"."MANDT" = "VBFA"."MANDT"
			AND "V_ORDERS"."VBELN" = "VBFA"."VBELV"
			AND "V_ORDERS"."POSNR" = "VBFA"."POSNV")
);

DROP TABLE IF EXISTS "O2C_VBFA_N";

CREATE TABLE "O2C_VBFA_N" AS (
    SELECT
        "VBFA"."MANDT"
        ,"VBFA"."VBELV"
        ,"VBFA"."POSNV"
        ,"VBFA"."VBELN"
        ,"VBFA"."POSNN"
        ,"VBFA"."VBTYP_N"
        ,"VBFA"."ERDAT"
        ,"VBFA"."ERZET"
    FROM VBFA
    WHERE EXISTS(SELECT * FROM "TMP_O2C_VBAK_VBAP" AS "V_ORDERS"
        WHERE 1=1
            AND "V_ORDERS"."MANDT" = "VBFA"."MANDT"
			AND "V_ORDERS"."VBELN" = "VBFA"."VBELN"
			AND "V_ORDERS"."POSNR" = "VBFA"."POSNN")
);