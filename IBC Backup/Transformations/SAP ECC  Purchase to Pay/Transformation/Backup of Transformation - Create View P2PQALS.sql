/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: P2P_QALS















2. Required Tables:
QALS
_CEL_P2P_CASES

3. Required Columns:
QALS.*
QALS.EBELN
QALS.EBELP
QALS.MANDANT
_CEL_P2P_CASES.EBELN
_CEL_P2P_CASES.EBELP
_CEL_P2P_CASES.MANDT

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
DROP VIEW IF EXISTS P2P_QALS;

CREATE VIEW P2P_QALS AS (
SELECT DISTINCT 
    QALS.*,
    CASES."PRETTY_NAME", -- global job
    CASES."SC/PC", -- global job
    CAST(QALS.ENSTEHDAT AS DATE) AS TS_ENSTEHDAT,
    CAST(QALS.ERSTELDAT AS DATE) AS TS_ERSTELDAT,
    CAST(QALS.AENDERDAT AS DATE) AS TS_AENDERDAT,
    CAST(QALS.PASTRTERM AS DATE) AS TS_PASTRTERM,
    CAST(QALS.PAENDTERM AS DATE) AS TS_PAENDTERM,
    CAST(QALS.GUELTIGAB AS DATE) AS TS_GUELTIGAB,
    CAST(QALS.ZEUGNISBIS AS DATE) AS TS_ZEUGNISBIS,
    CAST(QALS.VFDAT AS DATE) AS TS_VFDAT,
    CAST(QALS.BUDAT AS DATE) AS TS_BUDAT,
    CAST(QALS.DABRZ AS DATE) AS TS_DABRZ
FROM QALS
	INNER JOIN _CEL_P2P_CASES AS CASES ON 1=1
        AND QALS."SCHEMA" = CASES."SCHEMA" -- global job
		AND QALS.MANDANT = CASES.MANDT
		AND QALS.EBELN = CASES.EBELN
		AND QALS.EBELP = CASES.EBELP
);