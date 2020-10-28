/*DESCRIPTION:
CBS: App






2. Required Tables:
MARC
VBAP
_CEL_O2C_CASES

3. Required Columns:
MARC.*
MARC.AUSDT
MARC.MANDT
MARC.MATNR
MARC.MMSTD
MARC.WERKS
VBAP.MANDT
VBAP.MATNR
VBAP.POSNR
VBAP.VBELN
VBAP.WERKS
_CEL_O2C_CASES.MANDT
_CEL_O2C_CASES.POSNR
_CEL_O2C_CASES.VBELN

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
-- Query 1
-- DROP TABLE IF EXISTS "O2C_KONV"; -- Änderung in View
DROP VIEW IF EXISTS "O2C_KONV_VBAP";
DROP VIEW IF EXISTS "O2C_KONV_VBRP";

-- Query 2
-- CREATE TABLE "O2C_KONV" AS (
-- Create View for conditions related to sales order items
CREATE VIEW "O2C_KONV_VBAP" AS (
	SELECT DISTINCT
    "KONV"."SCHEMA", -- global job
    V_ORDERS."PRETTY_NAME", -- global job
    V_ORDERS."SC/PC", -- global job
    "KONV"."MANDT"
    , "KONV"."KNUMV"
    , "KONV"."KPOSN"
    , "KONV"."KSCHL"
    , "KONV"."KDATU"
    , "KONV"."KINAK"
    , "KONV"."MWSK1"
    , "KONV"."KBETR"
    , "KONV"."KWERT"
    , "KONV"."WAERS"
    , "KONV"."KOAID"
    FROM "KONV" AS "KONV"
    JOIN O2C_VBAP AS V_ORDERS ON 1=1
        AND V_ORDERS."SCHEMA" = KONV."SCHEMA" -- global job
        AND V_ORDERS.MANDT = KONV.MANDT
        AND V_ORDERS.KNUMV = KONV.KNUMV
        AND V_ORDERS.POSNR = KONV.KPOSN
    
);

-- Create View for conditions related to Invoive items
CREATE VIEW "O2C_KONV_VBRP" AS (
	SELECT DISTINCT 
    "KONV"."SCHEMA", -- global job
    V_INV."PRETTY_NAME", -- global job
    V_INV."SC/PC", -- globa job
    "KONV"."MANDT"
    , "KONV"."KNUMV"
    , "KONV"."KPOSN"
    , "KONV"."KSCHL"
    , "KONV"."KDATU"
    , "KONV"."KINAK"
    , "KONV"."MWSK1"
    , "KONV"."KBETR"
    , "KONV"."KWERT"
    , "KONV"."WAERS"
    , "KONV"."KOAID"
    FROM "KONV" AS "KONV"
     join "SCHEMA_xlsx_MD" as "MAP" on 
    KONV."SCHEMA" = "MAP"."SCHEMA" -- global job
    JOIN "O2C_VBRP" AS V_INV ON 1=1
        AND V_INV."SCHEMA" = KONV."SCHEMA" -- global job
        AND V_INV.MANDT = KONV.MANDT
        AND V_INV.KNUMV = KONV.KNUMV
        AND V_INV.POSNR = KONV.KPOSN
);
