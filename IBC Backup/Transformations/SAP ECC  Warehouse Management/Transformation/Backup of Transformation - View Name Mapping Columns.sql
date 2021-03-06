/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: WM_NAME_MAPPING_COLUMNS







2. Required Tables:
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
DROP TABLE IF EXISTS WM_NAME_MAPPING_COLUMNS;

CREATE TABLE WM_NAME_MAPPING_COLUMNS AS
SELECT DISTINCT
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"  AS PRETTY_NAME
FROM 
    "DD03M" -- globale Anpassung
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" || '_TEXT' AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Text)' AS PRETTY_NAME
FROM 
	"DD03M" -- globale Anpassung
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" || '_EUR' AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Euro)' AS PRETTY_NAME
FROM 
	"DD03M" -- globale Anpassung
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	'TS_' || "FIELDNAME" AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Timestamp)' AS PRETTY_NAME
FROM 
	"DD03M" -- globale Anpassung

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'ACTIVITY_EN',
	'E',
	'Activity (English)'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'ACTIVITY_EN',
	'D',
	'Aktivität (Englisch)'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'ACTIVITY_DE',
	'E',
	'Activity (German)'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'ACTIVITY_DE',
	'D',
	'Aktivität (Deutsch)'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'EVENTTIME',
	'E',
	'Timestamp'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'EVENTTIME',
	'D',
	'Zeitstempel'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_FIELD',
	'E',
	'Changed Field'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_FIELD',
	'D',
	'Geändertes Feld'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_TABLE',
	'E',
	'Changed Table'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_TABLE',
	'D',
	'Geänderte Tabelle'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_FROM',
	'E',
	'Changed From'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_FROM',
	'D',
	'Geändert von'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_TO',
	'E',
	'Changed To'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_TO',
	'D',
	'Geändert nach'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_NUMBER',
	'E',
	'Change Number'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'CHANGED_NUMBER',
	'D',
	'Änderungsnummer'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'TRANSACTION_CODE',
	'E',
	'Transaction Code'

UNION

SELECT
	'_CEL_WM_ACTIVITIES',
	'TRANSACTION_CODE',
	'D',
	'Transaktionscode'
;

