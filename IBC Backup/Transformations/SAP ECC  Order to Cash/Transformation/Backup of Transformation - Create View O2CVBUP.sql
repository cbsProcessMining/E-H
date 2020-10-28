DROP VIEW IF EXISTS "O2C_VBUP";

CREATE VIEW "O2C_VBUP" AS (
	SELECT 
        "MAP"."SCHEMA",
        "MAP"."PRETTY_NAME",
        MAP."SC/PC", -- global job
        "VBUP"."MANDT",
        "VBUP"."VBELN",
        "VBUP"."POSNR",
        "VBUP"."BESTA",
        "VBUP"."GBSTA"
    FROM "VBUP" AS "VBUP"
    join "SCHEMA_xlsx_MD" as "MAP" on 
    VBUP."SCHEMA" = "MAP"."SCHEMA" -- global job
    WHERE EXISTS(
        SELECT * 
        FROM "TMP_O2C_VBAK_VBAP" AS "C"
        WHERE 1=1
            AND "VBUP"."SCHEMA" = "C"."SCHEMA" -- global job
            AND "VBUP"."MANDT" = "C"."MANDT"
        	AND "VBUP"."VBELN" = "C"."VBELN"
        	AND "VBUP"."POSNR" = "C"."POSNR"
    )
);