DROP VIEW IF EXISTS PP_AFVC;

CREATE VIEW PP_AFVC AS
SELECT DISTINCT	
     AFVC.*
     , MAP."PRETTY_NAME"
FROM PP_AFRU AS AFRU
    JOIN "SCHEMA_xlsx_MD" as "MAP" on 
        AFRU."SCHEMA" = "MAP"."SCHEMA" -- global job
	JOIN AFVC AS AFVC ON 1=1
        AND AFRU."SCHEMA" = AFVC."SCHEMA"
		AND AFRU.MANDT = AFVC.MANDT
		AND AFRU.AUFPL = AFVC.AUFPL
		AND AFRU.APLZL = AFVC.APLZL;