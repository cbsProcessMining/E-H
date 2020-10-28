/*DESCRIPTION:
1. Transformation Description:
This transformation creates a table with the following name: O2C_NAME_MAPPING_TABLES













2. Required Tables:
DD02T

3. Required Columns:
DD02T.DDLANGUAGE
DD02T.DDTEXT
DD02T.TABNAME

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
UPDATE _CEL_O2C_ACTIVITIES AS ACT
SET CHANGED_TABLE_TEXT = NM.DDTEXT
FROM DD02T AS NM
WHERE 1=1
    AND ACT."SCHEMA" = NM."SCHEMA" -- global job   
   AND ACT.CHANGED_TABLE = NM.TABNAME
   AND NM.DDLANGUAGE = '<%=primaryLanguageKey%>';
 