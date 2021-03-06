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


DROP TABLE IF EXISTS "O2C_NAME_MAPPING_COLUMNS";

CREATE TABLE "O2C_NAME_MAPPING_COLUMNS" AS
SELECT 
	"TABNAME" AS "TABLE_NAME",
	"FIELDNAME" AS "FIELD_NAME",
	"DDLANGUAGE" AS "LANGUAGE",
	"SCRTEXT_L" AS "PRETTY_NAME"
FROM 
	"LH_DD03M" -- globale Anpassung
	
UNION

SELECT 
	"TABNAME" AS "TABLE_NAME",
	"FIELDNAME" || '_TEXT' AS "FIELD_NAME",
	"DDLANGUAGE" AS "LANGUAGE",
	"SCRTEXT_L"|| ' (Text)' AS "PRETTY_NAME"
FROM 
	"LH_DD03M"
	
UNION

SELECT 
	"TABNAME" AS "TABLE_NAME",
	"FIELDNAME" || '_EUR' AS "FIELD_NAME",
	"DDLANGUAGE" AS "LANGUAGE",
	"SCRTEXT_L"|| ' (Euro)' AS "PRETTY_NAME"
FROM 
	"LH_DD03M"
	
UNION

SELECT 
	"TABNAME" AS "TABLE_NAME",
	"FIELDNAME" || '_CONVERTED' AS "FIELD_NAME",
	"DDLANGUAGE" AS "LANGUAGE",
	"SCRTEXT_L"|| ' (Converted)' AS "PRETTY_NAME"
FROM 
	"LH_DD03M"

UNION

SELECT 
	"TABNAME" AS "TABLE_NAME",
	'TS_' || "FIELDNAME" AS "FIELD_NAME",
	"DDLANGUAGE" AS "LANGUAGE",
	"SCRTEXT_L"|| ' (Timestamp)' AS "PRETTY_NAME"
FROM 
	"LH_DD03M"

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'ACTIVITY_EN',
	'E',
	'Activity (English)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'ACTIVITY_EN',
	'D',
	'Aktivität (Englisch)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'ACTIVITY_DE',
	'E',
	'Activity (German)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'ACTIVITY_DE',
	'D',
	'Aktivität (Deutsch)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'EVENTTIME',
	'E',
	'Timestamp'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'EVENTTIME',
	'D',
	'Zeitstempel'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'USER_NAME',
	'E',
	'User Name'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'USER_NAME',
	'D',
	'Nutzername'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'USER_TYPE',
	'E',
	'User Type'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'USER_TYPE',
	'D',
	'Nutzertyp'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_FIELD',
	'E',
	'Changed Field'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_FIELD',
	'D',
	'Geändertes Feld'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_TABLE',
	'E',
	'Changed Table'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_TABLE',
	'D',
	'Geänderte Tabelle'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_TABLE_TEXT_DE',
	'E',
	'Changed Table Text (German)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_TABLE_TEXT_DE',
	'D',
	'Geänderte Tabelle Text (Deutsch)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_TABLE_TEXT_EN',
	'E',
	'Changed Table Text (English)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_TABLE_TEXT_EN',
	'D',
	'Geänderte Tabelle Text (Englisch)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_FIELD_TEXT_DE',
	'E',
	'Changed Field Text (German)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_FIELD_TEXT_DE',
	'D',
	'Geändertes Feld Text (Deutsch)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_FIELD_TEXT_EN',
	'E',
	'Changed Field Text (English)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_FIELD_TEXT_EN',
	'D',
	'Geändertes Feld Text (Englisch)'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_FROM',
	'E',
	'Changed From'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_FROM',
	'D',
	'Geändert von'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_TO',
	'E',
	'Changed To'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGED_TO',
	'D',
	'Geändert nach'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGE_NUMBER',
	'E',
	'Change Number'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'CHANGE_NUMBER',
	'D',
	'Änderungsnummer'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'TRANSACTION_CODE',
	'E',
	'Transaction Code'

UNION

SELECT
	'_CEL_O2C_ACTIVITIES',
	'TRANSACTION_CODE',
	'D',
	'Transaktionscode'
;

-- Housekeeping Process 
DROP TABLE IF EXISTS "LH_DD03M";


 /*  Original -> Geht auf die Bretter, da hier ein alter statement noch ausgeführt werden müsste. 
UPDATE _CEL_O2C_ACTIVITIES AS ACT
SET CHANGED_FIELD_TEXT_EN = NM.PRETTY_NAME
FROM O2C_NAME_MAPPING_COLUMNS AS NM
WHERE 1=1
   AND ACT.CHANGED_TABLE = NM.TABLE_NAME
   AND ACT.CHANGED_FIELD = NM.FIELD_NAME
   AND NM."LANGUAGE" = 'E';

UPDATE _CEL_O2C_ACTIVITIES AS ACT
SET CHANGED_FIELD_TEXT_DE = NM.PRETTY_NAME
FROM O2C_NAME_MAPPING_COLUMNS AS NM
WHERE 1=1
   AND ACT.CHANGED_TABLE = NM.TABLE_NAME
   AND ACT.CHANGED_FIELD = NM.FIELD_NAME
   AND NM."LANGUAGE" = 'D';
*/