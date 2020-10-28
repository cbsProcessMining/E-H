/*DESCRIPTION:
1. Transformation Description:
This transformation creates an activity with the following name: Create Picking













2. Required Tables:
LIKP
LIPS
TMP_O2C_VBAK_VBAP
USR02

3. Required Columns:
LIKP.ERNAM
LIKP.KODAT
LIKP.KOUHR
LIKP.MANDT
LIKP.NOW
LIKP.VBELN
LIPS.MANDT
LIPS.VBELN
LIPS.VGBEL
LIPS.VGPOS
TMP_O2C_VBAK_VBAP.MANDT
TMP_O2C_VBAK_VBAP.POSNR
TMP_O2C_VBAK_VBAP.VBELN
TMP_O2C_VBAK_VBAP._CASE_KEY
USR02.BNAME
USR02.MANDT
USR02.USTYP

4. Columns used for timestamp:
LIKP.KODAT
LIKP.KOUHR

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
INSERT INTO _CEL_O2C_ACTIVITIES (
    "_CASE_KEY"
    ,"ACTIVITY_DE"
    ,"ACTIVITY_EN"
    ,"EVENTTIME"
    ,"_SORTING"
    ,"USER_NAME"
    ,"USER_TYPE"
    ,"MANDT"
    ,"VBELN"
    ,"POSNR"
    ,"_ACTIVITY_KEY")
SELECT DISTINCT 
    V_ORDERS._CASE_KEY AS "_CASE_KEY"    
    ,'Kommissionierung erstellt' AS "ACTIVITY_DE"
    ,'Create Picking' AS "ACTIVITY_EN"
    ,CAST(LIKP.KODAT AS DATE) + CAST(LIKP.KOUHR AS TIME) AS "EVENTTIME" 
    ,39 AS "_SORTING" 
    ,LIKP.ERNAM AS "USER_NAME" 
    ,USR02.USTYP AS "USER_TYPE" 
    ,V_ORDERS.MANDT AS "MANDT"
    ,V_ORDERS.VBELN AS "VBELN"
    ,V_ORDERS.POSNR AS "POSNR"
    ,LIKP.MANDT || LIKP.VBELN  AS "_ACTIVITY_KEY"
FROM TMP_O2C_VBAK_VBAP AS V_ORDERS 
    JOIN LIPS AS LIPS ON 
        LIPS.MANDT = V_ORDERS.MANDT AND
        LIPS.VGBEL = V_ORDERS.VBELN AND
        LIPS.VGPOS = V_ORDERS.POSNR
    JOIN LIKP AS LIKP ON 
        LIPS.MANDT = LIKP.MANDT AND
        LIPS.VBELN = LIKP.VBELN
    LEFT JOIN USR02 AS USR02 ON 
        LIKP.MANDT = USR02.MANDT AND
        LIKP.ERNAM = USR02.BNAME
WHERE (LENGTH(CAST(LIKP.KODAT AS DATE) || ' ' || CAST(LIKP.KOUHR AS TIME)) = 19) 
;