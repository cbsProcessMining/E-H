/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: P2P_MSEG















2. Required Tables:
EKPO
MSEG

3. Required Columns:
EKPO.EBELN
EKPO.EBELP
EKPO.MANDT
MSEG.*
MSEG.EBELN
MSEG.EBELP
MSEG.MANDT

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
DROP VIEW IF EXISTS P2P_MSEG;

CREATE VIEW P2P_MSEG AS
SELECT DISTINCT
	MSEG.*,
    MAP."PRETTY_NAME", -- global job
    MAP."SC/PC", -- global job
    CAST(MSEG.VFDAT AS DATE) AS TS_VFDAT,
    CAST(MSEG.DABRBZ AS DATE) AS TS_DABRBZ,
    CAST(MSEG.DABRZ AS DATE) AS TS_DABRZ,
    CAST(MSEG.HSDAT AS DATE) AS TS_HSDAT,
    CAST(MSEG.BUDAT_MKPF AS DATE) AS TS_BUDAT_MKPF,
    CAST(MSEG.CPUDT_MKPF AS DATE) AS TS_CPUDT_MKPF
FROM 
	MSEG AS MSEG
    join "SCHEMA_xlsx_MD" as "MAP" on 
    MSEG."SCHEMA" = "MAP"."SCHEMA" -- global job
	INNER JOIN EKPO AS EKPO ON 1=1
		AND MSEG.MANDT = EKPO.MANDT
		AND MSEG.EBELN = EKPO.EBELN
		AND MSEG.EBELP = EKPO.EBELP
;
