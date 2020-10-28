/*DESCRIPTION:
1. Transformation Description:
This transformation creates a table with the following name: O2C_NAME_MAPPING_COLUMNS













2. Required Tables:
DD03M
DD03M
DD03M
DD03M
DD03M

3. Required Columns:
DD03M.DDLANGUAGE
DD03M.FIELDNAME
DD03M.SCRTEXT_L
DD03M.TABNAME

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
UPDATE _CEL_O2C_ACTIVITIES AS ACT
SET CHANGED_FIELD_TEXT = NM."SCRTEXT_L" || ' (' || NM."FIELDNAME" || ')'
FROM DD03M AS NM
WHERE 1=1
    AND ACT."SCHEMA" = NM."SCHEMA" -- global job
   AND ACT.CHANGED_TABLE = NM.TABNAME
   AND ACT.CHANGED_FIELD = NM.FIELDNAME
   AND NM.DDLANGUAGE = '<%=primaryLanguageKey%>';