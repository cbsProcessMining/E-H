/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: P2P_LFM1















2. Required Tables:
EKKO
LFM1
_CEL_P2P_CASES

3. Required Columns:
EKKO.EBELN
EKKO.EKORG
EKKO.LIFNR
EKKO.MANDT
LFM1.*
LFM1.EKORG
LFM1.LIFNR
LFM1.MANDT
_CEL_P2P_CASES.EBELN
_CEL_P2P_CASES.MANDT

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
DROP VIEW IF EXISTS P2P_LFM1;

CREATE VIEW P2P_LFM1 AS
SELECT DISTINCT 
	LFM1.*,
    CASES."PRETTY_NAME", -- global job
    CASES."SC/PC", -- global job
    CAST(LFM1.ERDAT AS DATE) AS TS_ERDAT 
FROM 
	LFM1
	INNER JOIN EKKO ON 1=1
        AND LFM1."SCHEMA" = EKKO."SCHEMA" -- global job
		AND LFM1.MANDT = EKKO.MANDT
		AND LFM1.LIFNR = EKKO.LIFNR
		AND LFM1.EKORG = EKKO.EKORG
	INNER JOIN _CEL_P2P_CASES AS CASES ON 1=1
        AND EKKO."SCHEMA" = CASES."SCHEMA" -- global job
		AND EKKO.MANDT = CASES.MANDT
		AND EKKO.EBELN = CASES.EBELN
;