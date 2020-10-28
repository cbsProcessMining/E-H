INSERT INTO "_CEL_PP_ACTIVITIES"(
    "SCHEMA" -- global job
    , "PRETTY_NAME" -- global job
    ,"_CASE_KEY"
    ,"MANDT"
    ,"AUFNR"
    ,"POSNR"
     ,"ACTIVITY_DE"
    ,"ACTIVITY_EN"
    ,"EVENTTIME"
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    -- ,"CHANGED_TABLE"
    -- ,"CHANGED_FIELD"
    -- ,"CHANGED_FROM"
    -- ,"CHANGED_TO"
    -- ,"CHANGE_NUMBER"
    -- ,"TRANSACTION_CODE"
    )
SELECT
    "TMP_PP_AUFK_AFKO_AFPO"."SCHEMA" AS "SCHEMA" -- global job
    ,"TMP_PP_AUFK_AFKO_AFPO"."PRETTY_NAME" AS "PRETTY_NAME" -- global job
    ,"TMP_PP_AUFK_AFKO_AFPO"."_CASE_KEY" AS "_CASE_KEY"
    ,"TMP_PP_AUFK_AFKO_AFPO"."MANDT" AS "MANDT"
    ,"TMP_PP_AUFK_AFKO_AFPO"."AUFNR"
    ,"TMP_PP_AUFK_AFKO_AFPO"."POSNR"
    ,CASE 
        WHEN LTAK.TRART = 'E' THEN -- Eingang
            CASE 
                WHEN CASE_QUIT > 0 AND CASE_STOR = 0 AND CASE_DIFF = 0 THEN 'Einlagerung voll quittiert (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR > 0 AND CASE_DIFF = 0 THEN 'Einlagerung teilquittiert mit Storno (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR = 0 AND CASE_DIFF > 0 THEN 'Einlagerung teilquittiert mit Differenzen (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR > 0 AND CASE_DIFF > 0 THEN 'Einlagerung teilquittiert mit Storno / Differenzen (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR > 0 AND CASE_DIFF > 0 THEN 'Einlagerung mit Storno / Differenzen (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR = 0 AND CASE_DIFF > 0 THEN 'Einlagerung mit Differenzen (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR > 0 AND CASE_DIFF = 0 THEN 'Einlagerung voll storniert (WM)'    
            END     
        WHEN LTAK.TRART = 'A' THEN -- Ausgang
            CASE 
                WHEN CASE_QUIT > 0 AND CASE_STOR = 0 AND CASE_DIFF = 0 THEN 'Kommissionierung voll quittiert (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR > 0 AND CASE_DIFF = 0 THEN 'Kommissionierung teilquittiert mit Storno (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR = 0 AND CASE_DIFF > 0 THEN 'Kommissionierung teilquittiert mit Differenzen (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR > 0 AND CASE_DIFF > 0 THEN 'Kommissionierung teilquittiert mit Storno / Differenzen (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR > 0 AND CASE_DIFF > 0 THEN 'Kommissionierung mit Storno / Differenzen (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR = 0 AND CASE_DIFF > 0 THEN 'Kommissionierung mit Differenzen (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR > 0 AND CASE_DIFF = 0 THEN 'Kommissionierung voll storniert (WM)'    
            END
    END AS "ACTIVITY_DE"
    ,CASE WHEN LTAK.TRART = 'E' THEN
            CASE 
                WHEN CASE_QUIT > 0 AND CASE_STOR = 0 AND CASE_DIFF = 0 THEN 'Put Away fully confirmed (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR > 0 AND CASE_DIFF = 0 THEN 'Put Away partially confirmed with cancellation (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR = 0 AND CASE_DIFF > 0 THEN 'Put Away partially confirmed with difference (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR > 0 AND CASE_DIFF > 0 THEN 'Put Away partially confirmed with cancellation / difference (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR > 0 AND CASE_DIFF > 0 THEN 'Put Away with cancellation / difference (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR = 0 AND CASE_DIFF > 0 THEN 'Put Away with Differenzen (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR > 0 AND CASE_DIFF = 0 THEN 'Put Away fully cancelled (WM)'    
            END     
        WHEN LTAK.TRART = 'A' THEN 
            CASE 
                WHEN CASE_QUIT > 0 AND CASE_STOR = 0 AND CASE_DIFF = 0 THEN 'Picking fully confirmed (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR > 0 AND CASE_DIFF = 0 THEN 'Picking partially confirmed with cancellation (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR = 0 AND CASE_DIFF > 0 THEN 'Picking partially confirmed with difference (WM)'
                WHEN CASE_QUIT > 0 AND CASE_STOR > 0 AND CASE_DIFF > 0 THEN 'Picking partially confirmed with cancellation / difference (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR > 0 AND CASE_DIFF > 0 THEN 'Picking with cancellation / difference (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR = 0 AND CASE_DIFF > 0 THEN 'Picking with Differenzen (WM)'
                WHEN CASE_QUIT = 0 AND CASE_STOR > 0 AND CASE_DIFF = 0 THEN 'Picking fully cancelled (WM)'      
            END
    END AS "ACTIVITY_DE"
    ,LTAP.LAST_QUIT AS "EVENTTIME"
    ,4198 AS "_SORTING"
    ,"LTAK"."BNAME" AS "USER_NAME"
    ,"USR02"."USTYP" AS "USER_TYPE"
    -- ,NULL AS "CHANGED_TABLE"
    -- ,NULL AS "CHANGED_FIELD"
    -- ,NULL AS "CHANGED_FROM"
    -- ,NULL AS "CHANGED_TO"
    -- ,NULL AS "CHANGE_NUMBER"
    -- ,NULL AS "TRANSACTION_CODE"
FROM    
    "TMP_PP_AUFK_AFKO_AFPO"
    INNER JOIN "LTAK" ON
        "TMP_PP_AUFK_AFKO_AFPO"."SCHEMA" = "LTAK"."SCHEMA" AND
        "TMP_PP_AUFK_AFKO_AFPO"."MANDT" = "LTAK"."MANDT" AND
        "TMP_PP_AUFK_AFKO_AFPO"."AUFNR" = right('000000000000' || "LTAK"."BENUM", 12) -- SAP difference in dataformat: AUFNR = CHAR12, BENUM = CHAR10
    LEFT JOIN "USR02"  ON
        "LTAK"."SCHEMA" = "USR02"."SCHEMA" AND
        "LTAK"."MANDT" = "USR02"."MANDT" AND
        "LTAK"."BNAME" = "USR02"."BNAME"
    INNER JOIN
        (
            SELECT
                LTAP."SCHEMA"
                , LTAP.MANDT
                , LTAP.LGNUM
                , LTAP.TANUM
                , COUNT(CASE 
                    WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA THEN 'QUIT'
                END) AS "CASE_Quit"
                , COUNT(CASE 
                    WHEN LTAP.PQUIT = 'X' AND LTAP.NSOLA = LTAP.NISTA + LTAP.NDIFA AND LTAP.KZDIF IS NOT NULL THEN 'DIFF'
                END) AS "CASE_DIFF"
                , COUNT(CASE 
                    WHEN LTAP.PQUIT = 'X' AND LTAP.NISTA = 0 AND LTAP.KZDIF IS NULL THEN 'STOR'
                END) AS "CASE_STOR"
                , MAX(CAST("LTAP"."QDATU" AS DATE) + CAST("LTAP"."QZEIT" AS TIME)) AS "LAST_QUIT"
            FROM LTAP
            GROUP BY
                LTAP.SCHEMA
                , LTAP.MANDT
                , LTAP.LGNUM
                , LTAP.TANUM
        ) AS LTAP ON
            LTAK."SCHEMA" = LTAP."SCHEMA"
            AND LTAK.MANDT = LTAP.MANDT
            AND LTAK.LGNUM = LTAP.LGNUM
            AND LTAK.TANUM = LTAP.TANUM
WHERE 
    "LTAK"."BETYP" = 'F' -- only relevent BETYP for starters
    AND LTAK.KQUIT = 'X'
;
