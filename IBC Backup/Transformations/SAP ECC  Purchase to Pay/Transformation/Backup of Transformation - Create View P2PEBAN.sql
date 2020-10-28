/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: P2P_EBAN

















2. Required Tables:
DD07T
DD07T
DD07T
EBAN
T161T
T163Y
_CEL_P2P_CASES

3. Required Columns:
DD07T.DDLANGUAGE
DD07T.DDTEXT
DD07T.DOMNAME
DD07T.DOMVALUE_L
DD07T.IFNULL
EBAN.*
EBAN.BADAT
EBAN.BEDAT
EBAN.BSART
EBAN.BSTYP
EBAN.BVDAT
EBAN.DAT01
EBAN.EBELN
EBAN.EBELP
EBAN.ERDAT
EBAN.ESTKZ
EBAN.FRGDT
EBAN.LFDAT
EBAN.MANDT
EBAN.PSTYP
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
primaryLanguageKey
*/
DROP VIEW IF EXISTS P2P_EBAN;

CREATE VIEW P2P_EBAN AS (
SELECT DISTINCT 
    EBAN.*,
    MAP."PRETTY_NAME", -- global job
    MAP."SC/PC", -- global job
	CAST(EBAN.BADAT AS DATE) AS TS_BADAT,
    CAST(EBAN.BEDAT AS DATE) AS TS_BEDAT,
    CAST(EBAN.BVDAT AS DATE) AS TS_BVDAT,
    CAST(EBAN.DAT01 AS DATE) AS TS_DAT01,
    CAST(EBAN.ERDAT AS DATE) AS TS_ERDAT,
    CAST(EBAN.FRGDT AS DATE) AS TS_FRGDT,
    CAST(EBAN.LFDAT AS DATE) AS TS_LFDAT,
    IFNULL(DD07T.DDTEXT,'') AS "ESTKZ_TEXT",
    IFNULL(DD07T_EBAN_BSTYP.DDTEXT,'') AS "BSTYP_TEXT",
    IFNULL(DD07T_EBAN_STATU.DDTEXT,'') AS "STATU_TEXT",
    IFNULL(T161T.BATXT,'') AS "BSTYP_TEXT1",
    IFNULL(T163Y.EPSTP,'') AS "PSTYP_TEXT2",
    IFNULL(T163Y.PTEXT,'') AS "PSTYP_TEXT3"
FROM 
    EBAN AS EBAN
    join "SCHEMA_xlsx_MD" as "MAP" on 
    EBAN."SCHEMA" = "MAP"."SCHEMA" -- global job
    /*INNER JOIN _CEL_P2P_CASES AS CASES ON 1=1
        AND EBAN.MANDT = CASES.MANDT
        AND EBAN.EBELN = CASES.EBELN
        AND EBAN.EBELP = CASES.EBELP*/ 
    -- Join removed as all PO Requisitions are needed for the Free-Text Order use case; please add the join in case you are not implementing the Free-Text Order use case
    LEFT JOIN DD07T  AS DD07T ON 1=1
        AND EBAN."SCHEMA" = DD07T."SCHEMA" -- global job
        AND EBAN.ESTKZ = DD07T.DOMVALUE_L
        AND DD07T.DOMNAME = 'ESTKZ'
        AND DD07T.DDLANGUAGE = '<%=primaryLanguageKey%>'
    LEFT JOIN DD07T AS DD07T_EBAN_BSTYP ON 1=1
        AND EBAN."SCHEMA" = DD07T_EBAN_BSTYP."SCHEMA" -- global job
        AND EBAN.BSTYP = DD07T_EBAN_BSTYP.DOMVALUE_L
        AND DD07T_EBAN_BSTYP.DOMNAME = 'EBSTYP'
        AND DD07T_EBAN_BSTYP.DDLANGUAGE = '<%=primaryLanguageKey%>'
    LEFT JOIN DD07T AS DD07T_EBAN_STATU ON 1=1
        AND DD07T_EBAN_STATU."SCHEMA" = EBAN."SCHEMA" -- global job
        AND DD07T_EBAN_STATU.DOMVALUE_L = EBAN.STATU
        AND DD07T_EBAN_STATU.DDLANGUAGE = '<%=primaryLanguageKey%>'
        AND DD07T_EBAN_STATU.DOMNAME = 'ASTAT'
    LEFT JOIN T161T AS T161T ON 1=1
        AND EBAN."SCHEMA" = T161T."SCHEMA" -- global job
        AND EBAN.MANDT = T161T.MANDT
        AND EBAN.BSART = T161T.BSART
        AND EBAN.BSTYP = T161T.BSTYP
        AND T161T.SPRAS = '<%=primaryLanguageKey%>'
    LEFT JOIN T163Y AS T163Y ON 1=1
        AND T163Y."SCHEMA" = EBAN."SCHEMA" -- global job
        AND EBAN.MANDT = T163Y.MANDT
        AND EBAN.PSTYP = T163Y.PSTYP
        AND T163Y.SPRAS = '<%=primaryLanguageKey%>'
);