-- Query 1
DELETE FROM"_CEL_O2C_ACTIVITIES"
WHERE "EVENTTIME" IS NULL OR "ACTIVITY_EN" IS NULL;

-- Query 2
DROP TABLE IF EXISTS "TMP_O2C_CDHDR_CDPOS";

-- Query 3
DROP TABLE IF EXISTS "TMP_O2C_VBAK_VBAP_QUOTES";

-- Query 4
DROP TABLE IF EXISTS "VBAP_CURR_TMP";

-- Query 5
DROP TABLE IF EXISTS "TMP_LIPS";

-- Query 6
DROP TABLE IF EXISTS "TMP_VBRP";
