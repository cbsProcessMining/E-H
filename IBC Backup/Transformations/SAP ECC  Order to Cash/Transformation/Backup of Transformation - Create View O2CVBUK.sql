DROP VIEW IF EXISTS "O2C_VBUK";

CREATE VIEW "O2C_VBUK" AS(
SELECT
    "VBUK"."SCHEMA" AS "SCHEMA", -- global job
    MAP."PRETTY_NAME" AS "PRETTY_NAME", -- global job
    MAP."SC/PC", -- global job
    "VBUK"."MANDT" AS "MANDT",
    "VBUK"."VBELN" AS "VBELN",
    "VBUK"."BESTK" AS "BESTK",
    "VBUK"."GBSTK" AS "GBSTK",
    "VBUK"."CMGST" AS "CMGST" 
FROM 
    "VBUK" AS "VBUK"
join "SCHEMA_xlsx_MD" as "MAP" on 
    VBUK."SCHEMA" = "MAP"."SCHEMA" -- global job
    WHERE EXISTS(
        SELECT * 
        FROM "TMP_O2C_VBAK_VBAP" AS "C"
        WHERE "VBUK"."MANDT" = "C"."MANDT"
            AND "VBUK"."VBELN" = "C"."VBELN"
            AND "VBUK"."SCHEMA" = C."SCHEMA" -- global job
    )
);
