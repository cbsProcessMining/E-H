/*DESCRIPTION:
QPAM

*/
DROP VIEW IF EXISTS P2P_QPAM;

CREATE VIEW P2P_QPAM AS (
SELECT DISTINCT 
    QPAM.*,
    MAP."PRETTY_NAME", -- global job
    MAP."SC/PC", -- global job
    CAST(QPAM.E_DATUM AS DATE) AS TS_E_DATUM,
   CAST(QPAM.A_DATUM AS DATE) AS TS_A_DATUM
FROM QALS as QALS
    inner join QAVE ON 1=1
        AND QAVE."SCHEMA" = QALS."SCHEMA" -- global job
		AND QAVE.MANDANT = QALS.MANDANT
		AND QAVE.PRUEFLOS = QALS.PRUEFLOS
  	INNER JOIN _CEL_P2P_CASES AS CASES ON 1=1
        AND QALS."SCHEMA" = CASES."SCHEMA" -- global job
		AND QALS.MANDANT = CASES.MANDT
		AND QALS.EBELN = CASES.EBELN
		AND QALS.EBELP = CASES.EBELP
 inner join QPAM as QPAM on 1=1
    AND QAVE."SCHEMA" = QPAM."SCHEMA"
    AND "QAVE"."MANDANT" = QPAM."MANDT"
    AND  QAVE.VWERKS = "QPAM"."WERKS"
    AND QAVE.VKATART = "QPAM"."KATALOGART"
    AND QAVE.VAUSWAHLMG = QPAM.AUSWAHLMGE
	INNER JOIN "SCHEMA_xlsx_MD" AS MAP ON 1=1 -- global job
    and QPAM."SCHEMA" = MAP."SCHEMA"
where QPAM.KSP01 = '<%=primaryLanguageKey%>' 

);




