-- Help Table for insert, for  Multi Client System
DROP TABLE IF EXISTS "LH_DD03M";

Create Table "LH_DD03M" as
Select "TABNAME", "FIELDNAME", "DDLANGUAGE", "SCRTEXT_L" FROM (
Select 	"TABNAME" AS "TABNAME",
	"FIELDNAME" AS "FIELDNAME",
	"DDLANGUAGE" AS "DDLANGUAGE",
	"SCRTEXT_L" AS "SCRTEXT_L",
    ROW_NUMBER() OVER (PARTITION BY "TABNAME","FIELDNAME","DDLANGUAGE" ORDER BY "SCRTEXT_L" asc) AS "ROW_NUM"
FROM 
	"DD03M" where DDLANGUAGE in ('E','D')
) as "HELP" where "ROW_NUM" = 1;


DROP TABLE IF EXISTS PP_NAME_MAPPING_COLUMNS;

CREATE TABLE PP_NAME_MAPPING_COLUMNS AS
SELECT 
	"TABNAME" as TABLE_NAME,
	"FIELDNAME" as FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"  AS PRETTY_NAME
FROM 
	"LH_DD03M" -- globale Anpassung
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" || '_TEXT' as FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Text)' AS PRETTY_NAME
FROM 
	"LH_DD03M" -- globale Anpassung
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" || '_EUR' AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Euro)' AS PRETTY_NAME
FROM 
	"LH_DD03M" -- globale Anpassung
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" || '_CONVERTED' AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (<%=currency%>)' AS PRETTY_NAME
FROM 
	"LH_DD03M" -- globale Anpassung

UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	'TS_' || "FIELDNAME" AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Timestamp)' AS PRETTY_NAME
FROM 
	"LH_DD03M" -- globale Anpassung

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'ACTIVITY_EN',
	'E',
	'Activity (English)'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'ACTIVITY_EN',
	'D',
	'Aktivität (Englisch)'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'ACTIVITY_DE',
	'E',
	'Activity (German)'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'ACTIVITY_DE',
	'D',
	'Aktivität (Deutsch)'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'EVENTTIME',
	'E',
	'Timestamp'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'EVENTTIME',
	'D',
	'Zeitstempel'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_FIELD',
	'E',
	'Changed Field'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_FIELD',
	'D',
	'Geändertes Feld'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_TABLE',
	'E',
	'Changed Table'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_TABLE',
	'D',
	'Geänderte Tabelle'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_FROM',
	'E',
	'Changed From'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_FROM',
	'D',
	'Geändert von'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_TO',
	'E',
	'Changed To'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_TO',
	'D',
	'Geändert nach'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_NUMBER',
	'E',
	'Change Number'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_NUMBER',
	'D',
	'Änderungsnummer'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'TRANSACTION_CODE',
	'E',
	'Transaction Code'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'TRANSACTION_CODE',
	'D',
	'Transaktionscode'
;

-- Housekeeping Prozess
   DROP TABLE IF EXISTS "LH_DD03M";



/*
Old Version of Name Mapping

DROP VIEW IF EXISTS PP_NAME_MAPPING_COLUMNS;

CREATE VIEW PP_NAME_MAPPING_COLUMNS AS
SELECT 
	"TABNAME" as TABLE_NAME,
	"FIELDNAME" as FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"  AS PRETTY_NAME
FROM 
	DD03M
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" || '_TEXT' as FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Text)' AS PRETTY_NAME
FROM 
	DD03M
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" || '_EUR' AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Euro)' AS PRETTY_NAME
FROM 
	DD03M
	
UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	"FIELDNAME" || '_CONVERTED' AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (<%=currency%>)' AS PRETTY_NAME
FROM 
	DD03M

UNION

SELECT 
	"TABNAME" AS TABLE_NAME,
	'TS_' || "FIELDNAME" AS FIELD_NAME,
	"DDLANGUAGE" AS LANGUAGE,
	"SCRTEXT_L"|| ' (Timestamp)' AS PRETTY_NAME
FROM 
	DD03M

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'ACTIVITY_EN',
	'E',
	'Activity (English)'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'ACTIVITY_EN',
	'D',
	'Aktivität (Englisch)'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'ACTIVITY_DE',
	'E',
	'Activity (German)'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'ACTIVITY_DE',
	'D',
	'Aktivität (Deutsch)'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'EVENTTIME',
	'E',
	'Timestamp'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'EVENTTIME',
	'D',
	'Zeitstempel'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_FIELD',
	'E',
	'Changed Field'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_FIELD',
	'D',
	'Geändertes Feld'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_TABLE',
	'E',
	'Changed Table'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_TABLE',
	'D',
	'Geänderte Tabelle'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_FROM',
	'E',
	'Changed From'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_FROM',
	'D',
	'Geändert von'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_TO',
	'E',
	'Changed To'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_TO',
	'D',
	'Geändert nach'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_NUMBER',
	'E',
	'Change Number'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'CHANGED_NUMBER',
	'D',
	'Änderungsnummer'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'TRANSACTION_CODE',
	'E',
	'Transaction Code'

UNION

SELECT
	'_CEL_PP_ACTIVITIES',
	'TRANSACTION_CODE',
	'D',
	'Transaktionscode'
;


*/