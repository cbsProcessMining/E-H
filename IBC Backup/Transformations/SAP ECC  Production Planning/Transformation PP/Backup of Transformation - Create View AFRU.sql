DROP VIEW IF EXISTS PP_AFRU;
		
CREATE VIEW PP_AFRU AS
SELECT DISTINCT
     AFRU.*
     , MAP."PRETTY_NAME"
FROM PP_AUFK AS AUFK
    JOIN "SCHEMA_xlsx_MD" as "MAP" on 
        AUFK."SCHEMA" = "MAP"."SCHEMA" -- global job
    JOIN AFRU AS AFRU ON 1=1
	    AND AFRU."SCHEMA" = AUFK."SCHEMA"
        AND AFRU.MANDT = AUFK.MANDT
	    AND AFRU.AUFNR = AUFK.AUFNR
	    AND AFRU.STOKZ IS NULL;

-- SELECT "MANDT", "AUFPL", "APLZL", "SCHEMA" FROM PP_AFRU WHERE MANDT = '005' AND AUFPL = '0001858846' AND APLZL = '00000001' AND "SCHEMA" = '590652c7-87a4-46e6-a9e9-60c90cb7c4e3_897d99cb-b81d-4da1-b3da-d6c986f854bf'
-- SELECT "MANDT", "AUFPL", "APLZL", "SCHEMA", COUNT("MANDT" || "AUFPL" || "APLZL" || "SCHEMA") FROM AFRU GROUP BY "MANDT", "AUFPL", "APLZL", "SCHEMA" ORDER BY COUNT("MANDT" || "AUFPL" || "APLZL" || "SCHEMA") DESC