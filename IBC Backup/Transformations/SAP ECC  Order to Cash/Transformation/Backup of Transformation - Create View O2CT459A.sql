DROP VIEW IF EXISTS O2C_T459A;
CREATE VIEW "O2C_T459A" AS (
            SELECT T459A.*, MAP."PRETTY_NAME", MAP."SC/PC"
            FROM "T459A"
        join "SCHEMA_xlsx_MD" as "MAP" on 
        T459A."SCHEMA" = "MAP"."SCHEMA" -- global job

        );