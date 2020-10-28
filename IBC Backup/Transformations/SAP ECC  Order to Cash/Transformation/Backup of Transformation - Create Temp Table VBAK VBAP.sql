/*DESCRIPTION:
1. Transformation Description:
This transformation creates a temporary table with the following name: TMP_O2C_VBAK_VBAP













2. Required Tables:
VBAK
VBAP

3. Required Columns:
VBAK.BUKRS_VF
VBAK.KUNNR
VBAK.MANDT
VBAK.OBJNR
VBAK.VBAP
VBAK.VBELN
VBAK.VBTYP
VBAK.WAERK
VBAP.ERDAT
VBAP.ERNAM
VBAP.ERZET
VBAP.MANDT
VBAP.NETWR
VBAP.POSNR
VBAP.VBELN

4. Columns used for timestamp:
None

5. Parameters used in where clause:
orderDocSalesOrders

6. Parameters used in joins:
None
*/
-- Query 1
DROP TABLE IF EXISTS "TMP_O2C_VBAK_VBAP";
-- Query 2
CREATE TABLE "TMP_O2C_VBAK_VBAP" AS (
	SELECT
        MAP.* -- global job
        ,"VBAK"."MANDT"
        ,"VBAK"."VBELN"
        ,CAST("VBAP"."ERDAT" AS DATE) AS "ERDAT"
        ,"VBAP"."ERZET"
        ,"VBAK"."VBTYP"
        ,"VBAK"."OBJNR"
        ,"VBAP"."POSNR"
        ,"VBAP"."ERNAM"
        ,"VBAK"."WAERK"
        ,"VBAP"."NETWR"
        ,"VBAK"."BUKRS_VF"
        ,"VBAK"."KUNNR"
        ,"VBAK"."KKBER"
        ,"VBAK"."LIFSK"
        ,"VBAK"."FAKSK"
        ,"VBAP"."MATNR"
        ,"VBAP"."WERKS"
        ,VBAP.ZZDLZ -- Erweiterung für PS1090 WM Ableitung durchzuführen
        ,VBAP.ZZLFBEST -- Erweiterung für Aktivtäten Erweiterung im Changes Sales Order Item
        ,MAP."PRETTY_NAME" || "VBAK"."MANDT" || "VBAK"."VBELN" || "VBAP"."POSNR" AS "_CASE_KEY" -- globale Anpassung
        ,"VBAK"."MANDT" || "VBAK"."VBELN" AS "TABKEY_VBAK" 
	FROM "VBAK"	
    JOIN "VBAP" ON
        "VBAK"."SCHEMA" = VBAP."SCHEMA" -- global Job 
		AND "VBAK"."MANDT" = "VBAP"."MANDT"
		AND "VBAK"."VBELN" = "VBAP"."VBELN"
    JOIN "SCHEMA_xlsx_MD" as "MAP" on 
        VBAK."SCHEMA" = "MAP"."SCHEMA" -- global job
    WHERE 
        VBAK.VBTYP IN <%=orderDocSalesOrders%> -- Appending of additonal objects, orderDocSalesOrders is a protected object no modifiable.
    );


