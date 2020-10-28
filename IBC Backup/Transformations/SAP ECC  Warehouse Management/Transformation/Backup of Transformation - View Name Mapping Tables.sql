/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: WM_NAME_MAPPING_TABLES







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

DROP TABLE IF EXISTS WM_NAME_MAPPING_TABLES;

CREATE TABLE WM_NAME_MAPPING_TABLES AS
SELECT
	DD02T.TABNAME AS TABLE_NAME,
	DD02T.DDLANGUAGE AS LANGUAGE,
	DD02T.DDTEXT AS PRETTY_NAME
FROM
	"DD02T"  as "DD02T"-- globale Anpassung
	
UNION
 
SELECT
	'_CEL_WM_ACTIVITIES',
	'D',
	'Aktivitäten'
	
UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'E',
	'Activities'
;

