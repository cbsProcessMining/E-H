INSERT INTO _CEL_P2P_ACTIVITIES (
    "SCHEMA", -- global job
    "PRETTY_NAME", -- global job
    "SC/PC", -- global job
    "_CASE_KEY"
    ,"MANDT"
    ,"EBELN"
    ,"EBELP"
    ,"ACTIVITY_DE"
    ,"ACTIVITY_EN"
    ,"EVENTTIME"
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    ,"CHANGED_TABLE"
    ,"CHANGED_FIELD"
    ,"CHANGED_FROM"
    ,"CHANGED_TO"
    ,"CHANGE_NUMBER"
    ,"TRANSACTION_CODE"
    ,"_ACTIVITY_KEY")
SELECT DISTINCT
    "E"."SCHEMA" as "SCHEMA" -- global job
    ,"E"."PRETTY_NAME" -- global job
    ,E."SC/PC" -- global job
    ,E._CASE_KEY AS "_CASE_KEY"
    ,E.MANDT AS "MANDT"
    ,E.EBELN AS "EBELN"
    ,E.EBELP AS "EBELP"
    ,CASE WHEN VALUE_OLD IS NOT NULL THEN 'Ändere gewünschtes Lieferdatum'
           ELSE 'Erfasse gewünschtes Lieferdatum'
    END AS "ACTIVITY_DE"
    ,CASE WHEN VALUE_OLD IS NOT NULL THEN 'Change requested delivery date'
           ELSE 'Set requested delivery date' 
    END AS "ACTIVITY_EN"
    ,CAST(CDHDR.UDATE AS DATE) + CAST(CDHDR.UTIME AS TIME) AS "EVENTTIME"
    ,CASE WHEN VALUE_OLD IS NOT NULL THEN 1520
            ELSE 1510
	END AS "_SORTING"
    ,CDHDR.USERNAME AS "USER_NAME"
    ,USR02.USTYP AS "USER_TYPE"
    ,CDPOS.TABNAME AS "CHANGED_TABLE"
    ,CDPOS.FNAME AS "CHANGED_FIELD"
    ,CDPOS.VALUE_OLD AS "CHANGED_FROM"
    ,CDPOS.VALUE_NEW AS "CHANGED_TO"
    ,CDHDR.CHANGENR AS "CHANGE_NUMBER"
    ,CDHDR.TCODE AS "TRANSACTION_CODE"
    ,"E"."PRETTY_NAME"||CDHDR."MANDANT" || CDHDR."OBJECTCLAS" || CDHDR."OBJECTID" || CDHDR."CHANGENR" AS "_ACTIVITY_KEY" -- global job

FROM
    CDPOS AS CDPOS
    JOIN EKET AS EKET on 1=1
        AND CDPOS."SCHEMA" = EKET."SCHEMA" -- global job
        AND CDPOS.TABKEY = EKET.MANDT || EKET.EBELN || EKET.EBELP || EKET.ETENR
    JOIN TMP_P2P_EKKO_EKPO AS E ON 1=1
        AND EKET."SCHEMA" = E."SCHEMA" -- global job
        AND EKET.MANDT = E.MANDT
        AND EKET.EBELN = E.EBELN
        AND EKET.EBELP = E.EBELP
    JOIN CDHDR AS CDHDR ON 1=1
        AND CDPOS."SCHEMA" = CDHDR."SCHEMA" -- global job
        AND CDPOS.MANDANT = CDHDR.MANDANT
        AND CDPOS.CHANGENR = CDHDR.CHANGENR
    LEFT JOIN USR02 AS USR02 ON 1=1
        AND USR02."SCHEMA" = CDHDR."SCHEMA" -- global job
        AND USR02.MANDT = CDHDR.MANDANT
        AND USR02.BNAME = CDHDR.USERNAME
WHERE
        CDPOS.TABNAME = 'EKET' AND
        CDPOS.FNAME  = 'EINDT'
;