/*DESCRIPTION:
1. Transformation Description:
This transformation creates a temporary table with the following name: TMP_O2C_CDHDR_CDPOS













2. Required Tables:
CDHDR
CDPOS

3. Required Columns:
CDHDR.CDPOS
CDHDR.CHANGENR
CDHDR.MANDANT
CDHDR.OBJECTCLAS
CDHDR.OBJECTID
CDHDR.TCODE
CDHDR.UDATE
CDHDR.USERNAME
CDHDR.UTIME
CDPOS.CHANGENR
CDPOS.CHNGIND
CDPOS.FNAME
CDPOS.MANDANT
CDPOS.OBJECTCLAS
CDPOS.OBJECTID
CDPOS.TABKEY
CDPOS.TABNAME
CDPOS.VALUE_NEW
CDPOS.VALUE_OLD

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
-- Query 1
DROP TABLE IF EXISTS "TMP_O2C_CDHDR_CDPOS";

-- Query 2
CREATE TABLE "TMP_O2C_CDHDR_CDPOS" AS (
	SELECT
	"CDPOS"."MANDANT"
	,"CDPOS"."FNAME"
	,"CDPOS"."TABNAME"
	,"CDPOS"."TABKEY"
	,"CDPOS"."VALUE_OLD"
	,"CDPOS"."VALUE_NEW"
	,CAST("CDHDR"."UDATE" AS DATE) + CAST("CDHDR"."UTIME" AS TIME) AS "EVENTTIME"
	,"CDHDR"."CHANGENR"
	,"CDHDR"."TCODE"
	,"CDPOS"."OBJECTCLAS"
	,"CDPOS"."OBJECTID"
	,"CDHDR"."USERNAME"
	FROM "CDHDR" AS "CDHDR"
	JOIN "CDPOS" AS "CDPOS" ON
		"CDPOS"."MANDANT" = "CDHDR"."MANDANT" AND
		"CDPOS"."OBJECTCLAS" = "CDHDR"."OBJECTCLAS" AND
		"CDPOS"."OBJECTID" = "CDHDR"."OBJECTID" AND
		"CDPOS"."CHANGENR" = "CDHDR"."CHANGENR"
	WHERE "CDPOS"."CHNGIND" = 'U'
		AND "CDHDR"."UDATE" IS NOT NULL
		AND "CDPOS"."TABNAME" IN ('VBUK','VBAK','VBAP')) ;