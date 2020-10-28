/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: P2P_MARC

















2. Required Tables:
EKPO
MARC
_CEL_P2P_CASES

3. Required Columns:
EKPO.EBELN
EKPO.EBELP
EKPO.MANDT
EKPO.MATNR
EKPO.WERKS
MARC.*
MARC.MANDT
MARC.MATNR
MARC.WERKS
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
DROP VIEW IF EXISTS P2P_MARC;

CREATE VIEW P2P_MARC AS
SELECT DISTINCT 
	MARC.*,
    CASES."PRETTY_NAME", -- global job
    CASES."SC/PC" -- global job
FROM 
	MARC AS MARC
	INNER JOIN EKPO AS EKPO ON 1=1
        AND MARC."SCHEMA" = EKPO."SCHEMA" --  global job
		AND MARC.MANDT = EKPO.MANDT
		AND MARC.MATNR = EKPO.MATNR
		AND MARC.WERKS = EKPO.WERKS
	INNER JOIN _CEL_P2P_CASES AS CASES ON 1=1   
        AND EKPO."SCHEMA" = CASES."SCHEMA"  -- global job
		AND EKPO.MANDT = CASES.MANDT
		AND EKPO.EBELN = CASES.EBELN
		AND EKPO.EBELP = CASES.EBELP
;