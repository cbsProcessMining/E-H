/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: P2P_NAST

















2. Required Tables:
DD07T
NAST
_CEL_P2P_CASES

3. Required Columns:
DD07T.DDLANGUAGE
DD07T.DDTEXT
DD07T.DOMNAME
DD07T.DOMVALUE_L
DD07T.IFNULL
NAST.*
NAST.MANDT
NAST.NACHA
NAST.OBJKY
_CEL_P2P_CASES.EBELN
_CEL_P2P_CASES.MANDT

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
primaryLanguageKey
*/
DROP VIEW IF EXISTS P2P_NAST;

CREATE VIEW P2P_NAST AS
SELECT DISTINCT 
    NAST.*,
    CASES."PRETTY_NAME" -- global job
    ,CASES."SC/PC" -- globla job
    ,IFNULL(DD07T.DDTEXT,'') AS NACHA_TEXT,
    CAST(NAST.ERDAT AS DATE) AS TS_ERDAT,
    CAST(NAST.VSDAT AS DATE) AS TS_VSDAT,
    CAST(NAST.DATVR AS DATE) AS TS_DATVR,
    CAST(NAST.DATRE AS DATE) AS TS_DATRE
FROM 
    NAST
    INNER JOIN _CEL_P2P_CASES AS CASES ON 1=1
        AND NAST."SCHEMA" = CASES."SCHEMA" -- global job
        AND NAST.MANDT = CASES.MANDT
        AND NAST.OBJKY = CASES.EBELN
    LEFT JOIN DD07T AS DD07T ON 1=1
        AND DD07T."SCHEMA" = NAST."SCHEMA" -- global job
	    AND DD07T.DOMVALUE_L = NAST.NACHA 
	    AND DD07T.DOMNAME = 'NA_NACHA'
	    AND DD07T.DDLANGUAGE = '<%=primaryLanguageKey%>'
;