-- Drop all Extraction Tables
Drop Table if Exists BKPF;
Drop Table if exists  "TMP_P2P_EKKO_EKPO";
Drop Table if Exists BSEG;
Drop Table if Exists CDHDR;
Drop Table if Exists CDPOS;
Drop Table if Exists DD02T;
Drop Table if Exists DD03M;
Drop Table if Exists DD07T;
Drop Table if Exists EBAN;
Drop Table if Exists EINA;
Drop Table if Exists EINE;
Drop Table if Exists EKBE;
Drop Table if Exists EKES;
Drop Table if Exists EKET;
Drop Table if Exists EKKO;
Drop Table if Exists EKPO;
Drop Table if Exists LFA1;
Drop Table if Exists LFB1;
Drop Table if Exists LFM1;
Drop Table if Exists MAKT;
Drop Table if Exists MARA;
Drop Table if Exists MARC;
Drop Table if Exists MKPF;
Drop Table if Exists MSEG;
Drop Table if Exists NAST;
Drop Table if Exists QALS;
Drop Table if Exists QAVE;
Drop Table if Exists RBKP;
Drop Table if Exists RSEG;
Drop Table if Exists T001;
Drop Table if Exists T001L;
Drop Table if Exists T001W;
Drop Table if Exists T008T;
Drop Table if Exists T023T;
Drop Table if Exists T024;
Drop Table if Exists T024E;
Drop Table if Exists T161T;
Drop Table if Exists T161U;
Drop Table if Exists T163I;
Drop Table if Exists T163Y;
Drop Table if Exists T16FE;
Drop Table if Exists T179T;
Drop Table if Exists T685T;
Drop Table if Exists TCURF;
Drop Table if Exists TCURR;
Drop Table if Exists TCURV;
Drop Table if Exists TCURX;
Drop Table if Exists USR02;
--Additional Tables
Drop Table if exists TCURF_CC;
Drop Table if exists TCURR_CC;
Drop Table if exists "_CEL_P2P_ACTIVITIES";
Drop table if exists "_CEL_P2P_CASES";
drop table if exists "_CEL_P2P_ACTIVITY_MASTER_DATA";
Drop Table if exists "TMP_CEL_P2P_ACTIVITIES";

--Statement: Release/Block Purchase Requisition and Change Purchase Order

--In the P2P process the indicators of Purchase Requisitions and Purchase Orders have to be looked up and adjusted by executing the following SQL query on the source database. 
--Then you have to set the parameters with the actual query results. 

--Release Indicator Purchase Requistions
SELECT * FROM T161U;


SELECT VALUE_NEW, COUNT(1)
FROM "CDPOS"
WHERE FNAME='FRGKZ'
GROUP BY VALUE_NEW
ORDER BY COUNT(1) DESC;


--Release Purchase Orders
SELECT * FROM T16FE;
 
 
SELECT VALUE_NEW, COUNT(1)
FROM "CDPOS"
WHERE FNAME='FRGKE'
GROUP BY VALUE_NEW
ORDER BY COUNT(1) DESC;
