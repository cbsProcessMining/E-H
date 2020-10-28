DROP VIEW IF EXISTS O2C_T459K;
CREATE VIEW "O2C_T459K" AS (
            SELECT T459K.*, MAP."PRETTY_NAME", MAP."SC/PC"
            FROM "T459K"
        join "SCHEMA_xlsx_MD" as "MAP" on 
        T459K."SCHEMA" = "MAP"."SCHEMA" -- global job

        );
