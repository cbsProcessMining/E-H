DROP VIEW IF EXISTS WM_MARA;

CREATE VIEW WM_MARA AS 
SELECT DISTINCT 
  MAP."PRETTY_NAME",
  MARA.*
 FROM 
    MARA 
    JOIN "SCHEMA_XLSX_MD" AS "MAP" ON
        MARA."SCHEMA" = "MAP"."SCHEMA"
;