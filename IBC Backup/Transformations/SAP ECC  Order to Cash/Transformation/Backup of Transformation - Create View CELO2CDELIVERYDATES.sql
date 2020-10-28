/*DESCRIPTION:
1. Transformation Description:
This transformation creates a view with the following name: "_CEL_O2C_DELIVERY_DATES"



2. Required Tables:
CDHDR
CDHDR
CDHDR
CDHDR
CDHDR
CDHDR
CDHDR
CDHDR
CDHDR
CDPOS
CDPOS
CDPOS
CDPOS
CDPOS
CDPOS
CDPOS
CDPOS
CDPOS
CDPOS
LIPS
...
Contact App Store support for the complete list.

3. Required Columns:
CDHDR.CHANGENR
CDHDR.EDATU
CDHDR.ETENR
CDHDR.FNAME
CDHDR.IFNULL
CDHDR.MANDANT
CDHDR.MANDT
CDHDR.OBJECTCLAS
CDHDR.OBJECTID
CDHDR.POSNR
CDHDR.TABKEY
CDHDR.TO_NUMBER
CDHDR.UDATE
CDHDR.UTIME
CDHDR.VALUE_NEW
CDHDR.VALUE_OLD
CDHDR.VBELN
CDHDR.WADAT
CDPOS.CHANGENR
CDPOS.FNAME
...
Contact App Store support for the complete list.

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
/*Activate this view in case you want to calculate the Requested Goods Issue Date, the First Confirmed Goods Issue Date, and the Last Confirmed Goods Issue Date
 on SALES ORDER ITEM level as well as on DELIVERY ITEM level. Those dates might be relevant for the On Time Delivery use case, but not necessary.

If you decide to do so, you also need to add the view to the data model. The view can be joined on LIPS with the following link:
LIPS.MANDT = _CEL_O2C_DELIVERY_DATES.MANDT
LIPS.VBELN = _CEL_O2C_DELIVERY_DATES.DELIVERY
LIPS.POSNR = _CEL_O2C_DELIVERY_DATES.DELIVERY_ITEM

Logic of Planned Goods Issue Dates:

Note: A date change refers to a change in the field VBEP.WADAT
      A quantity change refers to a change in the field VBEP.BMENG
      The logic is only applicable to sales order items with a maximum of two schedule lines. Additional schedule lines are not considered.

----Requested Goods Issue Date----

Current date in field VBEP.WADAT on first schedule line (VBEP.ETENR='0001')

----First Confirmed Goods Issue Date----

The first confirmed date is the first date where a quantity bigger zero appeared on a schedule line. It is possible that a quantity had been confirmed 
on the first schedule line, but it was set back to 0 as and a new schedule line with a confirmed quantity was created, when the date couldn't be hold 
due to planning issues or other. Also on the second schedule line quantity changes can occur, e.g. if the customer changes his requested quantity. 
If the quantity was only changed on the second schedule line, then the first confirmed date is the first date that appeared after the last quantity change. 
If only date changes and no quantity changes occurred, then the first date on the line with a currently confirmed quantity is the first confirmed date.

1. If there was a quantity change on the first schedule line that does not have a confirmed quantity (mostly VBEP.ETENR='0001' and BMENG=0), then the first confirmed date is taken from this schedule line. If multiple quantity changes occurred, then the first quantity change is relevant:
1.1 If the first quantity change had a CDPOS.VALUE_OLD > 0 and if a date change was done, then take the CDPOS.VALUE_OLD of the first date change, else take the current date in field VBEP.WADAT of the first schedule line.
1.2 If the first quantity change set the quantity from 0 to a positive value and if a date change was done before the quantity change, then take the CDPOS.VALUE_NEW of this date change.
1.3 If the first quantity change set the quantity from 0 to a positive value and if a date change was done at the same time, then take the CDPOS.VALUE_NEW of this date change.
1.4 If the first quantity change set the quantity from 0 to a positive value and if a date change was done after the quantity change, then take the CDPOS.VALUE_OLD of this date change.
1.5 If the first quantity change set the quantity from 0 to a positive value and if no date change was done on the first line, then take the current date in field VBEP.WADAT of the first schedule line.
2. If there was no quantity change on the first schedule line (VBEP.ETENR='0001' and VBEP.BMENG=0), but a quantity change on the first schedule line with a currently confirmed quantity (mostly schedule line with VBEP.ETENR='0002' and VBEP.BMENG>0; could also be the VBEP.ETENR='0001' or other), then the first confirmed date is taken from this schedule line. If multiple quantity changes occurred, then the last change is relevant, as each quantity change on this line results in treating it like a new order:
2.1 If the last quantity change had a CDPOS.VALUE_OLD > 0 and if a date change was done before the quantity change, then take the CDPOS.VALUE_NEW of this date change.
2.2 If the last quantity change had a CDPOS.VALUE_OLD > 0 and if a date change was done at the same time, then take the CDPOS.VALUE_NEW of this date change.
2.3 If the last quantity change had a CDPOS.VALUE_OLD > 0 and if a date change was done after the quantity change, then take the CDPOS.VALUE_OLD of this date change.
2.4 If the last quantity change had a CDPOS.VALUE_OLD > 0 and if no date change was done on this schedule line, then take the current date in field VBEP.WADAT of the schedule line.
3. No quantity change on any schedule line, but the date changed on the first schedule line with a currently confirmed quantity (VBEP.BMENG>0), then take the CDPOS.VALUE_OLD of the first date change on this schedule line.
4. No quantity change and no date change occurred on any schedule line, then take the current date in field VBEP.WADAT of the first schedule line with a currently confirmed quantity (VBEP.BMENG>0).

----Last Confirmed Goods Issue Date----

Current date in field VBEP.WADAT of first schedule line with a currently confirmed quantity (VBEP.BMENG>0)

----Goods Issue Date----

Date of Goods Movement Document Creation

-----------------------------------------------------------------------*/
DROP TABLE IF EXISTS "CDPOS_First_Conf_GIDate";

CREATE TABLE "CDPOS_First_Conf_GIDate" AS (
    SELECT 
        "CDPOS"."SCHEMA",-- global job	
        MAP."PRETTY_NAME", -- global job
        MAP."SC/PC", -- global job
        CDPOS.MANDANT, 
        CDPOS.TABKEY, 
        CDPOS.VALUE_OLD, 
        CDPOS.VALUE_NEW, 
        CDPOS.FNAME, 
        CDPOS.CHANGENR, 
        CDHDR.OBJECTCLAS, 
        CDHDR.OBJECTID, 
        CAST(CDHDR.UDATE AS DATE) || ' ' || CAST(IFNULL(CAST(CDHDR.UTIME AS TIME), '23:59:59') AS TIME) AS EVENTTIME, 
        ROW_NUMBER() OVER(PARTITION BY CDPOS."SCHEMA", CDPOS.MANDANT, CDPOS.TABKEY ORDER BY TO_NUMBER(CDPOS.CHANGENR) ASC) AS ROWNUM -- global job
    FROM CDPOS AS CDPOS
    join "SCHEMA_xlsx_MD" as "MAP" on 
    CDPOS."SCHEMA" = "MAP"."SCHEMA" -- global job
    LEFT JOIN CDHDR AS CDHDR ON 1=1
        AND "CDPOS"."SCHEMA" = "CDHDR"."SCHEMA" -- global job
        AND CDPOS.MANDANT = CDHDR.MANDANT
        AND CDPOS.OBJECTCLAS = CDHDR.OBJECTCLAS
        AND CDPOS.OBJECTID = CDHDR.OBJECTID
        AND CDPOS.CHANGENR = CDHDR.CHANGENR
    WHERE CDPOS.FNAME = 'WADAT'
);

DROP TABLE IF EXISTS "CDPOS_Last_Conf_GIDate";

CREATE TABLE "CDPOS_Last_Conf_GIDate" AS (
    SELECT 	
        "CDPOS"."SCHEMA", -- global job
        MAP."PRETTY_NAME", -- global job
        MAP."SC/PC", -- global job
        CDPOS.MANDANT, 
        CDPOS.TABKEY, 
        CDPOS.VALUE_OLD, 
        CDPOS.VALUE_NEW, 
        CDPOS.FNAME, 
        CDPOS.CHANGENR, 
        CDHDR.OBJECTCLAS, 
        CDHDR.OBJECTID, 
        CAST(CDHDR.UDATE AS DATE) || ' ' || CAST(IFNULL(CAST(CDHDR.UTIME AS TIME), '23:59:59') AS TIME) AS EVENTTIME, 
        ROW_NUMBER() OVER(PARTITION BY "CDPOS"."SCHEMA", CDPOS.MANDANT, CDPOS.TABKEY ORDER BY TO_NUMBER(CDPOS.CHANGENR) DESC) AS ROWNUM
    FROM CDPOS AS CDPOS
    join "SCHEMA_xlsx_MD" as "MAP" on 
    CDPOS."SCHEMA" = "MAP"."SCHEMA" -- global job
    LEFT JOIN CDHDR AS CDHDR ON 
        "CDPOS"."SCHEMA" = "CDHDR"."SCHEMA" -- Global job
        AND CDPOS.MANDANT = CDHDR.MANDANT
        AND CDPOS.OBJECTCLAS = CDHDR.OBJECTCLAS
        AND CDPOS.OBJECTID = CDHDR.OBJECTID
        AND CDPOS.CHANGENR = CDHDR.CHANGENR
    WHERE CDPOS.FNAME = 'WADAT'
);

-----------------------------------------------------------------------

DROP VIEW IF EXISTS "_CEL_O2C_DELIVERY_DATES";

CREATE VIEW "_CEL_O2C_DELIVERY_DATES" AS (
SELECT DISTINCT
    VBFA_DEL."SCHEMA", -- global job
    VBFA_DEL."PRETTY_NAME", -- global job
    VBFA_DEL."SC/PC", -- global job
	VBFA_DEL.MANDT AS MANDT,
    VBFA_DEL.VBELV AS SALES_DOCUMENT,
    VBFA_DEL.POSNV AS SALES_DOCUMENT_ITEM,
    LIPS.VBELN AS DELIVERY,
    LIPS.POSNR AS DELIVERY_ITEM,
    CAST(VBEP_R.WADAT AS DATE) AS REQUESTED_GI_DATE,
 	CASE
 	 WHEN TO_NUMBER(CASE WHEN CDPOS_Q_R.VALUE_OLD LIKE '%-' THEN CONCAT('-',REPLACE(LTRIM(CDPOS_Q_R.VALUE_OLD),'-','')) ELSE CDPOS_Q_R.VALUE_OLD END) > 0
 	 THEN COALESCE(CAST(CDPOS_R.VALUE_OLD AS DATE),CAST(VBEP_R.WADAT AS DATE))
 	 WHEN TO_NUMBER(CASE WHEN CDPOS_Q_R.VALUE_NEW LIKE '%-' THEN CONCAT('-',REPLACE(LTRIM(CDPOS_Q_R.VALUE_NEW),'-','')) ELSE CDPOS_Q_R.VALUE_NEW END) > 0 AND CDPOS_R_B.EVENTTIME < CDPOS_Q_R.EVENTTIME
 	 THEN COALESCE(CAST(CDPOS_R_B.VALUE_NEW AS DATE),CAST(VBEP_R.WADAT AS DATE))
	 WHEN TO_NUMBER(CASE WHEN CDPOS_Q_R.VALUE_NEW LIKE '%-' THEN CONCAT('-',REPLACE(LTRIM(CDPOS_Q_R.VALUE_NEW),'-','')) ELSE CDPOS_Q_R.VALUE_NEW END) > 0 AND CDPOS_R_S.EVENTTIME = CDPOS_Q_R.EVENTTIME
 	 THEN COALESCE(CAST(CDPOS_R_S.VALUE_NEW AS DATE),CAST(VBEP_R.WADAT AS DATE))
 	 WHEN TO_NUMBER(CASE WHEN CDPOS_Q_R.VALUE_NEW LIKE '%-' THEN CONCAT('-',REPLACE(LTRIM(CDPOS_Q_R.VALUE_NEW),'-','')) ELSE CDPOS_Q_R.VALUE_NEW END) > 0 AND CDPOS_R_A.EVENTTIME > CDPOS_Q_R.EVENTTIME
 	 THEN COALESCE(CAST(CDPOS_R_A.VALUE_OLD AS DATE),CAST(VBEP_R.WADAT AS DATE))	 
 	 WHEN TO_NUMBER(CASE WHEN CDPOS_Q_R.VALUE_OLD LIKE '%-' THEN CONCAT('-',REPLACE(LTRIM(CDPOS_Q_R.VALUE_OLD),'-','')) ELSE CDPOS_Q_R.VALUE_OLD END) + TO_NUMBER(CDPOS_Q_R.VALUE_NEW) > 0
	 THEN CAST(VBEP_R.WADAT AS DATE) 	 
 	 ELSE COALESCE(CAST(CDPOS_C_B.VALUE_NEW AS DATE),CAST(CDPOS_C_S.VALUE_NEW AS DATE),CAST(CDPOS_C_A.VALUE_OLD AS DATE),
	               CAST(CDPOS_C.VALUE_OLD AS DATE),CAST(VBEP_C.WADAT AS DATE))
 	END AS FIRST_CONFIRMED_GI_DATE,
    CAST(VBEP_C.WADAT AS DATE) AS LAST_CONFIRMED_GI_DATE,
	CAST(VBFA_GI.ERDAT AS DATE) || ' ' || CAST(VBFA_GI.ERZET AS TIME) AS GOODS_ISSUE_DATE

FROM VBAP 
    INNER JOIN LIPS AS LIPS ON 1=1
    AND "LIPS"."SCHEMA" = "VBAP"."SCHEMA" -- global job
    AND LIPS.MANDT = VBAP.MANDT
    AND LIPS.VBELN = VBAP.VBELN
    AND LIPS.POSNR = VBAP.POSNR
   
  --Select Delivery Documents with subsequent Goods Movement Documents
    INNER JOIN O2C_VBFA_V AS VBFA_DEL ON
        "LIPS"."SCHEMA" = VBFA_DEL."SCHEMA" AND -- global job
		LIPS.MANDT = VBFA_DEL.MANDT AND
		LIPS.VBELN = VBFA_DEL.VBELN AND
		LIPS.POSNR = VBFA_DEL.POSNN
    LEFT JOIN VBFA AS VBFA_GI ON
        "LIPS"."SCHEMA" = VBFA_GI."SCHEMA" AND -- global job
		LIPS.MANDT = VBFA_GI.MANDT AND
		LIPS.VBELN = VBFA_GI.VBELV AND
		LIPS.POSNR = VBFA_GI.POSNV
  
  --Select Schedule Line for Requested Date
    LEFT JOIN (
     			SELECT 
                    "SCHEMA",-- global job
					MANDT, 
					VBELN, 
					POSNR, 
					ETENR, 
					WADAT, 
					EDATU
    			FROM VBEP AS VBEP 
    			WHERE VBEP.ETENR = '0001'
    		  ) AS VBEP_R ON
     	VBAP.MANDT = VBEP_R.MANDT
        AND "VBAP"."SCHEMA" = "VBEP_R"."SCHEMA" -- global job
    	AND VBAP.VBELN = VBEP_R.VBELN
    	AND VBAP.POSNR = VBEP_R.POSNR 
  
  --Select Schedule Line for Confirmed Date   	
    LEFT JOIN (
    			SELECT "SCHEMA", -- global job 
					MANDT, 
					VBELN, 
					POSNR, 
					ETENR, 
					WADAT, 
					ROW_NUMBER() OVER(PARTITION BY "SCHEMA", MANDT, VBELN, POSNR ORDER BY TO_NUMBER(ETENR) ASC) AS ROWNUM 
    			FROM VBEP AS VBEP 
    			WHERE VBEP.BMENG > 0
    		  ) AS VBEP_C ON
              VBAP."SCHEMA" = VBEP_C."SCHEMA" 
		AND VBAP.MANDT = VBEP_C.MANDT
		AND VBAP.VBELN = VBEP_C.VBELN
		AND VBAP.POSNR = VBEP_C.POSNR 
		AND VBEP_C.ROWNUM = 1
   
   --Select Change Entry for Confirmed Quantity on Schedule Line for Requested Date
   LEFT JOIN (
  				SELECT 
                    "CDPOS"."SCHEMA", -- global job	
					CDPOS.MANDANT, 
  					CDPOS.TABKEY, 
  					CDPOS.VALUE_OLD, 
  					CDPOS.VALUE_NEW, 
  					CDPOS.FNAME, 
  					CDPOS.CHANGENR, 
  					CDHDR.OBJECTCLAS, 
  					CDHDR.OBJECTID, 
  					CAST(CDHDR.UDATE AS DATE) || ' ' || CAST(IFNULL(CAST(CDHDR.UTIME AS TIME), '23:59:59') AS TIME) AS EVENTTIME, 
  					ROW_NUMBER() OVER(PARTITION BY "CDPOS"."SCHEMA", CDPOS.MANDANT, CDPOS.TABKEY ORDER BY TO_NUMBER(CDPOS.CHANGENR) ASC) AS ROWNUM
  				FROM CDPOS AS CDPOS
  				LEFT JOIN CDHDR AS CDHDR ON
                    "CDPOS"."SCHEMA" = "CDHDR"."SCHEMA"-- global job
				    AND CDPOS.MANDANT = CDHDR.MANDANT
					AND CDPOS.OBJECTCLAS = CDHDR.OBJECTCLAS
					AND CDPOS.OBJECTID = CDHDR.OBJECTID
					AND CDPOS.CHANGENR = CDHDR.CHANGENR 
  				WHERE CDPOS.FNAME = 'BMENG'
				AND TO_NUMBER(CASE WHEN CDPOS.VALUE_OLD LIKE '%-' THEN CONCAT('-',REPLACE(LTRIM(CDPOS.VALUE_OLD),'-','')) ELSE CDPOS.VALUE_OLD END) + TO_NUMBER(CASE WHEN CDPOS.VALUE_NEW LIKE '%-' THEN CONCAT('-',REPLACE(LTRIM(CDPOS.VALUE_NEW),'-','')) ELSE CDPOS.VALUE_NEW END) > 0
  			  ) AS CDPOS_Q_R ON
          VBEP_R."SCHEMA" = CDPOS_Q_R."SCHEMA" and -- global job      
		VBEP_R.MANDT = CDPOS_Q_R.MANDANT
		AND (VBEP_R.MANDT || VBEP_R.VBELN || VBEP_R.POSNR || VBEP_R.ETENR) = CDPOS_Q_R.TABKEY
		AND CDPOS_Q_R.ROWNUM = 1

   --Select Change Entry for Confirmed Quantity on Schedule Line for Confirmed Date
    LEFT JOIN (
  				SELECT 	CDPOS."SCHEMA", -- global job
					CDPOS.MANDANT, 
  					CDPOS.TABKEY, 
  					CDPOS.VALUE_OLD, 
  					CDPOS.VALUE_NEW, 
  					CDPOS.FNAME, 
  					CDPOS.CHANGENR, 
  					CDHDR.OBJECTCLAS, 
  					CDHDR.OBJECTID, 
  					CAST(CDHDR.UDATE AS DATE) || ' ' || CAST(IFNULL(CAST(CDHDR.UTIME AS TIME), '23:59:59') AS TIME) AS EVENTTIME, 
  					ROW_NUMBER() OVER(PARTITION BY "CDPOS"."SCHEMA", CDPOS.MANDANT, CDPOS.TABKEY ORDER BY TO_NUMBER(CDPOS.CHANGENR) DESC) AS ROWNUM
  				FROM CDPOS AS CDPOS
  				LEFT JOIN CDHDR AS CDHDR ON 
                    "CDPOS"."SCHEMA" = CDHDR."SCHEMA" -- global job
				AND	CDPOS.MANDANT = CDHDR.MANDANT
					AND CDPOS.OBJECTCLAS = CDHDR.OBJECTCLAS
					AND CDPOS.OBJECTID = CDHDR.OBJECTID
					AND CDPOS.CHANGENR = CDHDR.CHANGENR 
  				WHERE CDPOS.FNAME = 'BMENG'
				AND TO_NUMBER(CASE WHEN CDPOS.VALUE_NEW LIKE '%-' THEN CONCAT('-',REPLACE(LTRIM(CDPOS.VALUE_NEW),'-','')) ELSE CDPOS.VALUE_NEW END) > 0
  			  ) AS CDPOS_Q_C ON
            VBEP_C."SCHEMA" = CDPOS_Q_C."SCHEMA" -- global job
		AND VBEP_C.MANDT = CDPOS_Q_C.MANDANT
		AND (VBEP_C.MANDT || VBEP_C.VBELN || VBEP_C.POSNR || VBEP_C.ETENR) = CDPOS_Q_C.TABKEY
		AND CDPOS_Q_C.ROWNUM = 1
   
   --Select Change Entry for First Confirmed GI Date on Schedule Line for Requested Date: Quantity Change from a quantity > 0
   LEFT JOIN "CDPOS_First_Conf_GIDate" AS CDPOS_R ON 1=1
        AND VBEP_R."SCHEMA" = CDPOS_R."SCHEMA" -- global job
		AND VBEP_R.MANDT = CDPOS_R.MANDANT
		AND (VBEP_R.MANDT || VBEP_R.VBELN || VBEP_R.POSNR || VBEP_R.ETENR) = CDPOS_R.TABKEY
		AND CDPOS_R.ROWNUM = 1
		
   --Select Change Entry for First Confirmed GI Date on Schedule Line for Requested Date: Date Change before Quantity Change 
   LEFT JOIN "CDPOS_Last_Conf_GIDate" AS CDPOS_R_B ON 1=1
        AND VBEP_R."SCHEMA" = CDPOS_R_B."SCHEMA" -- global job
		AND VBEP_R.MANDT = CDPOS_R_B.MANDANT
		AND (VBEP_R.MANDT || VBEP_R.VBELN || VBEP_R.POSNR || VBEP_R.ETENR) = CDPOS_R_B.TABKEY
		AND CDPOS_R_B.EVENTTIME < CDPOS_Q_R.EVENTTIME
		AND CDPOS_R_B.ROWNUM = 1
		
   --Select Change Entry for First Confirmed GI Date on Schedule Line for Requested Date: Date Change after Quantity Change 
   LEFT JOIN "CDPOS_First_Conf_GIDate" AS CDPOS_R_A ON 1=1
        AND VBEP_R."SCHEMA" = CDPOS_R_A."SCHEMA" -- global job
		AND VBEP_R.MANDT = CDPOS_R_A.MANDANT
		AND (VBEP_R.MANDT || VBEP_R.VBELN || VBEP_R.POSNR || VBEP_R.ETENR) = CDPOS_R_A.TABKEY
		AND CDPOS_R_A.EVENTTIME > CDPOS_Q_R.EVENTTIME
		AND CDPOS_R_A.ROWNUM = 1
		
   --Select Change Entry for First Confirmed GI Date on Schedule Line for Requested Date: Date Change and Quantity Change at same time
   LEFT JOIN "CDPOS_First_Conf_GIDate" AS CDPOS_R_S ON 1=1
        AND VBEP_R."SCHEMA" = CDPOS_R_S."SCHEMA" -- global job
		AND VBEP_R.MANDT = CDPOS_R_S.MANDANT
		AND (VBEP_R.MANDT || VBEP_R.VBELN || VBEP_R.POSNR || VBEP_R.ETENR) = CDPOS_R_S.TABKEY
		AND CDPOS_R_S.EVENTTIME = CDPOS_Q_R.EVENTTIME
		AND CDPOS_R_S.ROWNUM = 1

--Select Change Entry for First Confirmed GI Date on Schedule Line for Confirmed Date: Date Change before Quantity Change 
   LEFT JOIN "CDPOS_Last_Conf_GIDate" AS CDPOS_C_B ON 1=1
        AND VBEP_C."SCHEMA" = CDPOS_C_B."SCHEMA" -- global job
		AND VBEP_C.MANDT = CDPOS_C_B.MANDANT
		AND (VBEP_C.MANDT || VBEP_C.VBELN || VBEP_C.POSNR || VBEP_C.ETENR) = CDPOS_C_B.TABKEY
		AND CDPOS_C_B.EVENTTIME < CDPOS_Q_C.EVENTTIME
		AND CDPOS_C_B.ROWNUM = 1
		
   --Select Change Entry for First Confirmed GI Date on Schedule Line for Requested Date: Date Change after Quantity Change 
   LEFT JOIN "CDPOS_First_Conf_GIDate" AS CDPOS_C_A ON 1=1
        AND VBEP_C."SCHEMA" = CDPOS_C_A."SCHEMA" -- global job
		AND VBEP_C.MANDT = CDPOS_C_A.MANDANT
		AND (VBEP_C.MANDT || VBEP_C.VBELN || VBEP_C.POSNR || VBEP_C.ETENR) = CDPOS_C_A.TABKEY
		AND CDPOS_C_A.EVENTTIME > CDPOS_Q_C.EVENTTIME
		AND CDPOS_C_A.ROWNUM = 1
		
   --Select Change Entry for First Confirmed GI Date on Schedule Line for Requested Date: Date Change and Quantity Change at same time
   LEFT JOIN "CDPOS_First_Conf_GIDate" AS CDPOS_C_S ON 1=1
        AND VBEP_C."SCHEMA" = CDPOS_C_S."SCHEMA" -- global job
		AND VBEP_C.MANDT = CDPOS_C_S.MANDANT
		AND (VBEP_C.MANDT || VBEP_C.VBELN || VBEP_C.POSNR || VBEP_C.ETENR) = CDPOS_C_S.TABKEY
		AND CDPOS_C_S.EVENTTIME = CDPOS_Q_C.EVENTTIME
		AND CDPOS_C_S.ROWNUM = 1
		
   --Select Change Entry for First Confirmed GI Date on Schedule Line for Confirmed Date   
   LEFT JOIN "CDPOS_First_Conf_GIDate" AS CDPOS_C ON 1=1
        AND VBEP_C."SCHEMA" = CDPOS_C."SCHEMA" -- global job
		AND VBEP_C.MANDT = CDPOS_C.MANDANT
		AND (VBEP_C.MANDT || VBEP_C.VBELN || VBEP_C.POSNR || VBEP_C.ETENR) = CDPOS_C.TABKEY	
		AND CDPOS_C.ROWNUM = 1

WHERE VBFA_GI.VBTYP_N = 'R'
);