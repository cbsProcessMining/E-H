/*Parts of the transformation script are disabled by default due to performance reasons and need to be enabled, if required for the following use cases:
1) On Time Delivery: The transformation "Create View: _CEL_O2C_DELIVERY_DATES" contains a certain logic to derive the first and last requested 
   and confirmed delivery date on delivery item level. Please open the transformation for more detailed documentation.
2) Automation: The transformation "Update: Mass Transactions" contains a heuristic to identify automated mass transactions.
3) Segregation of Duties (SOD): The analysis for SOD requires the sum of delivery quantity and the sum of the billed quantity which are calculated in the
   transformation "Create Temp Table: LIPS VBRP" and added to table "VBAP" in the transformation "Create Table: O2C_VBAP".
*/
Drop Table if exists BKPF;
Drop Table if exists BSAD;
Drop Table if exists CDHDR;
Drop Table if exists CDPOS;
Drop Table if exists DD02T;
Drop Table if exists DD03M;
Drop Table if exists DD07T;
Drop Table if exists JCDS;
Drop Table if exists KNA1;
Drop Table if exists KNB1;
Drop Table if exists KNKK;
Drop Table if exists LIKP;
Drop Table if exists LIPS;
Drop Table if exists MAKT;
Drop Table if exists MARC;
Drop Table if exists MKPF;
Drop Table if exists NAST;
Drop Table if exists T001;
Drop Table if exists T001L;
Drop Table if exists T001W;
Drop Table if exists T014T;
Drop Table if exists T023T;
Drop Table if exists T179T;
Drop Table if exists T685T;
Drop Table if exists TCURF;
Drop Table if exists TCURR;
Drop Table if exists TCURX;
Drop Table if exists TJ02T;
Drop Table if exists TVAGT;
Drop Table if exists TVAK;
Drop Table if exists TVAPT;
Drop Table if exists TVKBT;
Drop Table if exists TVKMT;
Drop Table if exists TVKOT;
Drop Table if exists TVLST;
Drop Table if exists TVRO;
Drop Table if exists TVSTT;
Drop Table if exists TVTWT;
Drop Table if exists USR02;
Drop Table if exists VBAK;
Drop Table if exists VBAP;
Drop Table if exists VBEP;
Drop Table if exists VBKD;
Drop Table if exists VBRP;
Drop Table if exists VBUK;
Drop Table if exists VBUP;
Drop Table if exists VTTK;
Drop Table if exists VTTP;
Drop Table if exists BSAD_C;
Drop Table if exists CDPOS_FIRST_CONF_GIDATE;
Drop Table if exists CDPOS_LAST_CONF_GIDATE;
Drop Table if exists CEL_O2C_ACTIVITY_MASTER_DATA;
Drop Table if exists MARD;
Drop Table if exists MSEG;
Drop Table if exists O2C_NAME_MAPPING_COLUMNS;
Drop Table if exists O2C_NAME_MAPPING_TABLES;
Drop Table if exists T024B;
Drop Table if exists T459A;
Drop Table if exists T459K;
Drop Table if exists TBSLT;
Drop Table if exists TCURF_CC;
Drop Table if exists TCURR_CC;
Drop Table if exists TJ02;
Drop Table if exists TMP_O2C_VBAK_VBAP;
Drop Table if exists TVAKT;
Drop Table if exists TVAUT;
Drop Table if exists TVFST;
Drop Table if exists TVGRT;
Drop Table if exists VBFA;
Drop Table if exists VBRK;
Drop Table if exists _CEL_O2C_ACTIVITIES;
Drop Table if exists O2C_LIPS;
Drop Table if exists O2C_VBAK;
Drop Table if exists O2C_VBAP;
Drop Table if exists O2C_VBFA_N;
Drop Table if exists O2C_VBFA_V;
Drop Table if exists TMP_LIPS;
Drop Table if exists TMP_O2C_CDHDR_CDPOS;
Drop Table if exists TMP_O2C_VBAK_VBAP_QUOTES;
Drop Table if exists TMP_VBRP;
Drop Table if exists VBAP_CURR_TMP;
Drop Table if exists VTTS;
Drop Table if exists LTAP;
Drop Table if exists LTAK;
Drop VIEW if exists BKPF;
Drop VIEW if exists BSAD;
Drop VIEW if exists CDHDR;
Drop VIEW if exists CDPOS;
Drop VIEW if exists DD02T;
Drop VIEW if exists DD03M;
Drop VIEW if exists DD07T;
Drop VIEW if exists JCDS;
Drop VIEW if exists KNA1;
Drop VIEW if exists KNB1;
Drop VIEW if exists KNKK;
Drop VIEW if exists LIKP;
Drop VIEW if exists LIPS;
Drop VIEW if exists MAKT;
Drop VIEW if exists MARC;
Drop VIEW if exists MKPF;
Drop VIEW if exists NAST;
Drop VIEW if exists T001;
Drop VIEW if exists T001L;
Drop VIEW if exists T001W;
Drop VIEW if exists T014T;
Drop VIEW if exists T023T;
Drop VIEW if exists T179T;
Drop VIEW if exists T685T;
Drop VIEW if exists TCURF;
Drop VIEW if exists TCURR;
Drop VIEW if exists TCURX;
Drop VIEW if exists TJ02T;
Drop VIEW if exists TVAGT;
Drop VIEW if exists TVAK;
Drop VIEW if exists TVAPT;
Drop VIEW if exists TVKBT;
Drop VIEW if exists TVKMT;
Drop VIEW if exists TVKOT;
Drop VIEW if exists TVLST;
Drop VIEW if exists TVRO;
Drop VIEW if exists TVSTT;
Drop VIEW if exists TVTWT;
Drop VIEW if exists USR02;
Drop VIEW if exists VBAK;
Drop VIEW if exists VBAP;
Drop VIEW if exists VBEP;
Drop VIEW if exists VBKD;
Drop VIEW if exists VBRP;
Drop VIEW if exists VBUK;
Drop VIEW if exists VBUP;
Drop VIEW if exists VTTK;
Drop VIEW if exists VTTP;
Drop VIEW if exists BSAD_C;
Drop VIEW if exists CDPOS_FIRST_CONF_GIDATE;
Drop VIEW if exists CDPOS_LAST_CONF_GIDATE;
Drop VIEW if exists CEL_O2C_ACTIVITY_MASTER_DATA;
Drop VIEW if exists MARD;
Drop VIEW if exists MSEG;
Drop VIEW if exists O2C_NAME_MAPPING_COLUMNS;
Drop VIEW if exists O2C_NAME_MAPPING_TABLES;
Drop VIEW if exists T024B;
Drop VIEW if exists T459A;
Drop VIEW if exists T459K;
Drop VIEW if exists TBSLT;
Drop VIEW if exists TCURF_CC;
Drop VIEW if exists TCURR_CC;
Drop VIEW if exists TJ02;
Drop VIEW if exists TMP_O2C_VBAK_VBAP;
Drop VIEW if exists TVAKT;
Drop VIEW if exists TVAUT;
Drop VIEW if exists TVFST;
Drop VIEW if exists TVGRT;
Drop VIEW if exists VBFA;
Drop VIEW if exists VBRK;
Drop VIEW if exists _CEL_O2C_ACTIVITIES;
Drop VIEW if exists O2C_LIPS;
Drop VIEW if exists O2C_VBAK;
Drop VIEW if exists O2C_VBAP;
Drop VIEW if exists O2C_VBFA_N;
Drop VIEW if exists O2C_VBFA_V;
Drop VIEW if exists TMP_LIPS;
Drop VIEW if exists TMP_O2C_CDHDR_CDPOS;
Drop VIEW if exists TMP_O2C_VBAK_VBAP_QUOTES;
Drop VIEW if exists TMP_VBRP;
Drop VIEW if exists VBAP_CURR_TMP;
Drop VIEW if exists VTTS;
Drop VIEW if exists LTAP;
Drop VIEW if exists LTAK;
Drop VIEW if exists O2C_VBFA;
Drop view if exists O2c_VBUP;


