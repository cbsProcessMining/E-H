/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: P2P_MARA

















2. Required Tables:
EKPO
MARA
T179T
_CEL_P2P_CASES

3. Required Columns:
EKPO.EBELN
EKPO.EBELP
EKPO.MANDT
EKPO.MATNR
MARA.*
MARA.MANDT
MARA.MATNR
MARA.PRDHA
T179T.MANDT
T179T.PRODH
T179T.SPRAS
_CEL_P2P_CASES.EBELN
_CEL_P2P_CASES.EBELP
_CEL_P2P_CASES.MANDT

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
primaryLanguageKey
*/
DROP VIEW IF EXISTS P2P_MARA;

CREATE VIEW P2P_MARA AS
SELECT DISTINCT
	MARA.*,
    CASES."PRETTY_NAME", -- global job
    CASES."SC/PC", -- global job
    CAST(MARA.ERSDA AS DATE) AS TS_ERSDA,
    CAST(MARA.LAEDA AS DATE) AS TS_LAEDA, 
    CAST(MARA.DATAB AS DATE) AS TS_DATAB, 
    CAST(MARA.LIQDT AS DATE) AS TS_LIQDT, 
    CAST(MARA.MSTDE AS DATE) AS TS_MSTDE, 
    CAST(MARA.MSTDV AS DATE) AS TS_MSTDV 
FROM
	MARA
    INNER JOIN EKPO AS EKPO ON 1=1
        AND MARA."SCHEMA" = EKPO."SCHEMA" -- global job
        AND MARA.MATNR = EKPO.MATNR
        AND MARA.MANDT = EKPO.MANDT
    INNER JOIN _CEL_P2P_CASES AS CASES ON 1=1
        AND EKPO."SCHEMA" = CASES."SCHEMA" -- global job
		AND EKPO.MANDT = CASES.MANDT
        AND EKPO.EBELN = CASES.EBELN
        AND EKPO.EBELP = CASES.EBELP
    LEFT JOIN T179T AS T179T on 1=1
        AND T179T."SCHEMA" = MARA."SCHEMA" -- global job
	    AND T179T.MANDT = MARA.MANDT
	    AND T179T.SPRAS = '<%=primaryLanguageKey%>'
	    AND T179T.PRODH = MARA.PRDHA
;

