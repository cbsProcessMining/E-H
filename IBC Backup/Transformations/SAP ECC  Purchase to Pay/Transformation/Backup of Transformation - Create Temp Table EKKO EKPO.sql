/*DESCRIPTION:
1. Transformation Description:
This transformation creates a temporary table with the following name: TMP_P2P_EKKO_EKPO

















2. Required Tables:
EKKO
EKPO

3. Required Columns:
EKKO.AEDAT
EKKO.BSTYP
EKKO.BUKRS
EKKO.EBELN
EKKO.ERNAM
EKKO.LIFNR
EKKO.MANDT
EKKO.WAERS
EKKO.WKURS
EKPO.BANFN
EKPO.BNFPO
EKPO.EBELN
EKPO.EBELP
EKPO.KONNR
EKPO.KTPNR
EKPO.MANDT
EKPO.NETPR
EKPO.NETWR

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
DROP TABLE IF EXISTS TMP_P2P_EKKO_EKPO;

CREATE TABLE TMP_P2P_EKKO_EKPO AS(
	SELECT DISTINCT
       MAP.* -- global job
    	,EKKO.MANDT
	    ,EKKO.EBELN
    	,EKPO.EBELP
	    ,CAST(EKKO.AEDAT AS DATE) AS "AEDAT"
    	,EKKO.ERNAM
        ,EKPO.KONNR
    	,EKPO.KTPNR
    	,EKKO.BSTYP
    	,EKPO.BANFN
    	,EKPO.BNFPO
    	,EKKO.WAERS
    	,EKKO.LIFNR
    	,EKKO.BUKRS
    	,EKPO.NETWR
        ,EKPO.NETPR
    	,EKKO.WKURS
    	,EKKO.MANDT || EKKO.EBELN AS "TABKEY_EKKO"
    	,MAP."PRETTY_NAME" || EKKO.MANDT || EKKO.EBELN || EKPO.EBELP AS "_CASE_KEY"
    	,EKPO.MANDT || EKPO.BANFN || EKPO.BNFPO AS "TABKEY_EBAN"
    FROM 
        EKKO AS EKKO
    Join "SCHEMA_xlsx_MD" as "MAP" on 
    EKKO."SCHEMA" = "MAP"."SCHEMA" -- global job
    	JOIN EKPO AS EKPO ON
            EKKO."SCHEMA" = EKPO."SCHEMA"
    		AND EKKO.MANDT = EKPO.MANDT
    		AND EKKO.EBELN = EKPO.EBELN
    WHERE 
        EKKO.BSTYP = 'F'
);