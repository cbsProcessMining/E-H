/*A mass transaction is a process of changing multiple master data entries at once in the system. Mass transaction of master records is required 
when there are a lot of existing master records and you need to change certain data fields in those records. For example, in multiple customer 
or material masters at one time. A mass transactions is triggered by a manual user, the updates of the different masters are then performed in 
the background. All those transactions are labeled by the manual user type 'A'. There is no automatic way to identify mass transactions. 
In this transformation, a heuristic is applied that labels transactions of the same activity and the same user name with user type 'R' in 
case it was performed within 20 seconds. Then it is assumed to be a mass transaction.

This transformation might take some time to execute as the complete activity table is scanned for activities happening in a certain timeframe.*/

------------------------------------------------------------------------

--The transformations need to be splitted since Vertica doesnt allow OR subqueries with exist
--logically it works like the following statement: ACTA."VBELN" <> ACTB."VBELN" OR (ACTA."VBELN" = ACTB."VBELN" AND ACTA."POSNR" <> ACTB.POSNR)

--Header Level
UPDATE "_CEL_O2C_ACTIVITIES" AS ACTA
SET USER_TYPE = 'R'
WHERE ACTA.USER_TYPE = 'A' 
    AND EXISTS(
    SELECT * FROM "_CEL_O2C_ACTIVITIES" AS ACTB 
    WHERE 1=1
        AND ACTA."ACTIVITY_EN" = ACTB."ACTIVITY_EN"
        AND ACTA."USER_NAME" = ACTB."USER_NAME"
        AND ABS(TIMESTAMPDIFF(ss, "ACTA"."EVENTTIME", "ACTB"."EVENTTIME")) <= 20
        AND ACTA."VBELN" <> ACTB."VBELN"
        AND ACTB.USER_TYPE  IN ('A','R')
);

--Item Level
UPDATE "_CEL_O2C_ACTIVITIES" AS ACTA
SET USER_TYPE = 'R'
WHERE ACTA.USER_TYPE = 'A' 
    AND EXISTS(
    SELECT * FROM "_CEL_O2C_ACTIVITIES" AS ACTB 
    WHERE 1=1
        AND ACTA."ACTIVITY_EN" = ACTB."ACTIVITY_EN"
        AND ACTA."USER_NAME" = ACTB."USER_NAME"
        AND ABS(TIMESTAMPDIFF(ss, "ACTA"."EVENTTIME", "ACTB"."EVENTTIME")) <= 20
        AND ACTA."VBELN" = ACTB."VBELN"
        AND ACTA."POSNR" <> ACTB.POSNR
        AND ACTB.USER_TYPE  IN ('A','R')
);