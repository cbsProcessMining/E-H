DROP VIEW IF EXISTS "TGSBT";

Create VIEW "TGSBT" AS(
SELECT 
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_fff504b3-61e6-431a-9589-a0c8a1ccd3c6' AS "SCHEMA"
,"MANDT"
,"SPRAS"
,"GSBER"
,"GTEXT"
,"_CELONIS_CHANGE_DATE"
FROM "590652c7-87a4-46e6-a9e9-60c90cb7c4e3_fff504b3-61e6-431a-9589-a0c8a1ccd3c6"."TGSBT"
UNION ALL
SELECT 
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_f9111368-fa6e-436c-b891-ad340f7d20d8' AS "SCHEMA"
,"MANDT"
,"SPRAS"
,"GSBER"
,"GTEXT"
,"_CELONIS_CHANGE_DATE"
FROM "590652c7-87a4-46e6-a9e9-60c90cb7c4e3_f9111368-fa6e-436c-b891-ad340f7d20d8"."TGSBT"
UNION ALL
SELECT 
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_bd6565ee-257a-4349-b3a2-ad0dfa097db7' AS "SCHEMA"
,"MANDT"
,"SPRAS"
,"GSBER"
,"GTEXT"
,"_CELONIS_CHANGE_DATE"
FROM "590652c7-87a4-46e6-a9e9-60c90cb7c4e3_bd6565ee-257a-4349-b3a2-ad0dfa097db7"."TGSBT"
);