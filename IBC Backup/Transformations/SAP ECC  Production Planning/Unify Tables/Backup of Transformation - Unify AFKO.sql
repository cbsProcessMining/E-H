DROP VIEW IF EXISTS "AFKO";

Create VIEW "AFKO" AS(
SELECT 
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_fff504b3-61e6-431a-9589-a0c8a1ccd3c6' AS "SCHEMA"
,"MANDT"
,"AUFNR"
,"GLTRP"
,"GSTRP"
,"FTRMS"
,"GLTRS"
,"GSTRS"
,"GSTRI"
,"GETRI"
,"GLTRI"
,"FTRMI"
,"FTRMP"
,"RSNUM"
,"GASMG"
,"GAMNG"
,"GMEIN"
,"PLNBEZ"
,"PLNTY"
,"PLNNR"
,"PLNAW"
,"PLNAL"
,"PVERW"
,"PLAUF"
,"PLSVB"
,"PLNME"
,"PLSVN"
,"PDATV"
,"PAENR"
,"PLGRP"
,"LODIV"
,"STLTY"
,"STLBEZ"
,"STLST"
,"STLNR"
,"SDATV"
,"SBMNG"
,"SBMEH"
,"SAENR"
,"STLAL"
,"STLAN"
,"SLSVN"
,"SLSBS"
,"AUFLD"
,"DISPO"
,"AUFPL"
,"FEVOR"
,"FHORI"
,"TERKZ"
,"REDKZ"
,"APRIO"
,"NTZUE"
,"VORUE"
,"PROFID"
,"VORGZ"
,"SICHZ"
,"FREIZ"
,"UPTER"
,"BEDID"
,"PRONR"
,"ZAEHL"
,"MZAEHL"
,"ZKRIZ"
,"PRUEFLOS"
,"KLVARP"
,"KLVARI"
,"RGEKZ"
,"PLART"
,"FLG_AOB"
,"FLG_ARBEI"
,"GLTPP"
,"GSTPP"
,"GLTPS"
,"GSTPS"
,"FTRPS"
,"RDKZP"
,"TRKZP"
,"RUECK"
,"RMZHL"
,"IGMNG"
,"RATID"
,"GROID"
,"CUOBJ"
,"GLUZS"
,"GSUZS"
,"REVLV"
,"RSHTY"
,"RSHID"
,"RSNTY"
,"RSNID"
,"NAUTERM"
,"NAUCOST"
,"STUFE"
,"WEGXX"
,"VWEGX"
,"ARSNR"
,"ARSPS"
,"MAUFNR"
,"LKNOT"
,"RKNOT"
,"PRODNET"
,"IASMG"
,"ABARB"
,"AUFNT"
,"AUFPT"
,"APLZT"
,"NO_DISP"
,"CSPLIT"
,"AENNR"
,"CY_SEQNR"
,"BREAKS"
,"VORGZ_TRM"
,"SICHZ_TRM"
,"TRMDT"
,"GLUZP"
,"GSUZP"
,"GSUZI"
,"GEUZI"
,"GLUPP"
,"GSUPP"
,"GLUPS"
,"GSUPS"
,"CHSCH"
,"KAPT_VORGZ"
,"KAPT_SICHZ"
,"LEAD_AUFNR"
,"PNETSTARTD"
,"PNETSTARTT"
,"PNETENDD"
,"PNETENDT"
,"KBED"
,"KKALKR"
,"SFCPF"
,"RMNGA"
,"GSBTR"
,"VFMNG"
,"NOPCOST"
,"NETZKONT"
,"ATRKZ"
,"OBJTYPE"
,"CH_PROC"
,"KAPVERSA"
,"COLORDPROC"
,"KZERB"
,"CONF_KEY"
,"ST_ARBID"
,"VSNMR_V"
,"TERHW"
,"SPLSTAT"
,"COSTUPD"
,"MAX_GAMNG"
,"MES_ROUTINGID"
,"ADPSP"
,"RMANR"
,"POSNR_RMA"
,"POSNV_RMA"
,"CFB_MAXLZ"
,"CFB_LZEIH"
,"CFB_ADTDAYS"
,"CFB_DATOFM"
,"CFB_BBDPI"
,"OIHANTYP"
,"FSH_MPROD_ORD"
,"FLG_BUNDLE"
,"MILL_RATIO"
,"BMEINS"
,"BMENGE"
,"MILL_OC_ZUSKZ"
,"_CELONIS_CHANGE_DATE"
FROM "590652c7-87a4-46e6-a9e9-60c90cb7c4e3_fff504b3-61e6-431a-9589-a0c8a1ccd3c6"."AFKO"
UNION ALL
SELECT 
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_f9111368-fa6e-436c-b891-ad340f7d20d8' AS "SCHEMA"
,"MANDT"
,"AUFNR"
,"GLTRP"
,"GSTRP"
,"FTRMS"
,"GLTRS"
,"GSTRS"
,"GSTRI"
,"GETRI"
,"GLTRI"
,"FTRMI"
,"FTRMP"
,"RSNUM"
,"GASMG"
,"GAMNG"
,"GMEIN"
,"PLNBEZ"
,"PLNTY"
,"PLNNR"
,"PLNAW"
,"PLNAL"
,"PVERW"
,"PLAUF"
,"PLSVB"
,"PLNME"
,"PLSVN"
,"PDATV"
,"PAENR"
,"PLGRP"
,"LODIV"
,"STLTY"
,"STLBEZ"
,"STLST"
,"STLNR"
,"SDATV"
,"SBMNG"
,"SBMEH"
,"SAENR"
,"STLAL"
,"STLAN"
,"SLSVN"
,"SLSBS"
,"AUFLD"
,"DISPO"
,"AUFPL"
,"FEVOR"
,"FHORI"
,"TERKZ"
,"REDKZ"
,"APRIO"
,"NTZUE"
,"VORUE"
,"PROFID"
,"VORGZ"
,"SICHZ"
,"FREIZ"
,"UPTER"
,"BEDID"
,"PRONR"
,"ZAEHL"
,"MZAEHL"
,"ZKRIZ"
,"PRUEFLOS"
,"KLVARP"
,"KLVARI"
,"RGEKZ"
,"PLART"
,"FLG_AOB"
,"FLG_ARBEI"
,"GLTPP"
,"GSTPP"
,"GLTPS"
,"GSTPS"
,"FTRPS"
,"RDKZP"
,"TRKZP"
,"RUECK"
,"RMZHL"
,"IGMNG"
,"RATID"
,"GROID"
,"CUOBJ"
,"GLUZS"
,"GSUZS"
,"REVLV"
,"RSHTY"
,"RSHID"
,"RSNTY"
,"RSNID"
,"NAUTERM"
,"NAUCOST"
,"STUFE"
,"WEGXX"
,"VWEGX"
,"ARSNR"
,"ARSPS"
,"MAUFNR"
,"LKNOT"
,"RKNOT"
,"PRODNET"
,"IASMG"
,"ABARB"
,"AUFNT"
,"AUFPT"
,"APLZT"
,"NO_DISP"
,"CSPLIT"
,"AENNR"
,"CY_SEQNR"
,"BREAKS"
,"VORGZ_TRM"
,"SICHZ_TRM"
,"TRMDT"
,"GLUZP"
,"GSUZP"
,"GSUZI"
,"GEUZI"
,"GLUPP"
,"GSUPP"
,"GLUPS"
,"GSUPS"
,"CHSCH"
,"KAPT_VORGZ"
,"KAPT_SICHZ"
,"LEAD_AUFNR"
,"PNETSTARTD"
,"PNETSTARTT"
,"PNETENDD"
,"PNETENDT"
,"KBED"
,"KKALKR"
,"SFCPF"
,"RMNGA"
,"GSBTR"
,"VFMNG"
,"NOPCOST"
,"NETZKONT"
,"ATRKZ"
,"OBJTYPE"
,"CH_PROC"
,"KAPVERSA"
,"COLORDPROC"
,"KZERB"
,"CONF_KEY"
,"ST_ARBID"
,"VSNMR_V"
,"TERHW"
,"SPLSTAT"
,"COSTUPD"
,"MAX_GAMNG"
,"MES_ROUTINGID"
,"ADPSP"
,"RMANR"
,"POSNR_RMA"
,"POSNV_RMA"
,"CFB_MAXLZ"
,"CFB_LZEIH"
,"CFB_ADTDAYS"
,"CFB_DATOFM"
,"CFB_BBDPI"
,"OIHANTYP"
,"FSH_MPROD_ORD"
,"FLG_BUNDLE"
,"MILL_RATIO"
,"BMEINS"
,"BMENGE"
,"MILL_OC_ZUSKZ"
,"_CELONIS_CHANGE_DATE"
FROM "590652c7-87a4-46e6-a9e9-60c90cb7c4e3_f9111368-fa6e-436c-b891-ad340f7d20d8"."AFKO"
UNION ALL
SELECT 
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_bd6565ee-257a-4349-b3a2-ad0dfa097db7' AS "SCHEMA"
,"MANDT"
,"AUFNR"
,"GLTRP"
,"GSTRP"
,"FTRMS"
,"GLTRS"
,"GSTRS"
,"GSTRI"
,"GETRI"
,"GLTRI"
,"FTRMI"
,"FTRMP"
,"RSNUM"
,"GASMG"
,"GAMNG"
,"GMEIN"
,"PLNBEZ"
,"PLNTY"
,"PLNNR"
,"PLNAW"
,"PLNAL"
,"PVERW"
,"PLAUF"
,"PLSVB"
,"PLNME"
,"PLSVN"
,"PDATV"
,"PAENR"
,"PLGRP"
,"LODIV"
,"STLTY"
,"STLBEZ"
,"STLST"
,"STLNR"
,"SDATV"
,"SBMNG"
,"SBMEH"
,"SAENR"
,"STLAL"
,"STLAN"
,"SLSVN"
,"SLSBS"
,"AUFLD"
,"DISPO"
,"AUFPL"
,"FEVOR"
,"FHORI"
,"TERKZ"
,"REDKZ"
,"APRIO"
,"NTZUE"
,"VORUE"
,"PROFID"
,"VORGZ"
,"SICHZ"
,"FREIZ"
,"UPTER"
,"BEDID"
,"PRONR"
,"ZAEHL"
,"MZAEHL"
,"ZKRIZ"
,"PRUEFLOS"
,"KLVARP"
,"KLVARI"
,"RGEKZ"
,"PLART"
,"FLG_AOB"
,"FLG_ARBEI"
,"GLTPP"
,"GSTPP"
,"GLTPS"
,"GSTPS"
,"FTRPS"
,"RDKZP"
,"TRKZP"
,"RUECK"
,"RMZHL"
,"IGMNG"
,"RATID"
,"GROID"
,"CUOBJ"
,"GLUZS"
,"GSUZS"
,"REVLV"
,"RSHTY"
,"RSHID"
,"RSNTY"
,"RSNID"
,"NAUTERM"
,"NAUCOST"
,"STUFE"
,"WEGXX"
,"VWEGX"
,"ARSNR"
,"ARSPS"
,"MAUFNR"
,"LKNOT"
,"RKNOT"
,"PRODNET"
,"IASMG"
,"ABARB"
,"AUFNT"
,"AUFPT"
,"APLZT"
,"NO_DISP"
,"CSPLIT"
,"AENNR"
,"CY_SEQNR"
,"BREAKS"
,"VORGZ_TRM"
,"SICHZ_TRM"
,"TRMDT"
,"GLUZP"
,"GSUZP"
,"GSUZI"
,"GEUZI"
,"GLUPP"
,"GSUPP"
,"GLUPS"
,"GSUPS"
,"CHSCH"
,"KAPT_VORGZ"
,"KAPT_SICHZ"
,"LEAD_AUFNR"
,"PNETSTARTD"
,"PNETSTARTT"
,"PNETENDD"
,"PNETENDT"
,"KBED"
,"KKALKR"
,"SFCPF"
,"RMNGA"
,"GSBTR"
,"VFMNG"
,"NOPCOST"
,"NETZKONT"
,"ATRKZ"
,"OBJTYPE"
,"CH_PROC"
,"KAPVERSA"
,"COLORDPROC"
,"KZERB"
,"CONF_KEY"
,"ST_ARBID"
,"VSNMR_V"
,"TERHW"
,"SPLSTAT"
,"COSTUPD"
,"MAX_GAMNG"
,"MES_ROUTINGID"
,"ADPSP"
,"RMANR"
,"POSNR_RMA"
,"POSNV_RMA"
,"CFB_MAXLZ"
,"CFB_LZEIH"
,"CFB_ADTDAYS"
,"CFB_DATOFM"
,"CFB_BBDPI"
,"OIHANTYP"
,"FSH_MPROD_ORD"
,"FLG_BUNDLE"
,"MILL_RATIO"
,"BMEINS"
,"BMENGE"
,"MILL_OC_ZUSKZ"
,"_CELONIS_CHANGE_DATE"
FROM "590652c7-87a4-46e6-a9e9-60c90cb7c4e3_bd6565ee-257a-4349-b3a2-ad0dfa097db7"."AFKO"
UNION ALL
SELECT 
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_897d99cb-b81d-4da1-b3da-d6c986f854bf' AS "SCHEMA"
,"MANDT"
,"AUFNR"
,"GLTRP"
,"GSTRP"
,"FTRMS"
,"GLTRS"
,"GSTRS"
,"GSTRI"
,"GETRI"
,"GLTRI"
,"FTRMI"
,"FTRMP"
,"RSNUM"
,"GASMG"
,"GAMNG"
,"GMEIN"
,"PLNBEZ"
,"PLNTY"
,"PLNNR"
,"PLNAW"
,"PLNAL"
,"PVERW"
,"PLAUF"
,"PLSVB"
,"PLNME"
,"PLSVN"
,"PDATV"
,"PAENR"
,"PLGRP"
,"LODIV"
,"STLTY"
,"STLBEZ"
,"STLST"
,"STLNR"
,"SDATV"
,"SBMNG"
,"SBMEH"
,"SAENR"
,"STLAL"
,"STLAN"
,"SLSVN"
,"SLSBS"
,"AUFLD"
,"DISPO"
,"AUFPL"
,"FEVOR"
,"FHORI"
,"TERKZ"
,"REDKZ"
,"APRIO"
,"NTZUE"
,"VORUE"
,"PROFID"
,"VORGZ"
,"SICHZ"
,"FREIZ"
,"UPTER"
,"BEDID"
,"PRONR"
,"ZAEHL"
,"MZAEHL"
,"ZKRIZ"
,"PRUEFLOS"
,"KLVARP"
,"KLVARI"
,"RGEKZ"
,"PLART"
,"FLG_AOB"
,"FLG_ARBEI"
,"GLTPP"
,"GSTPP"
,"GLTPS"
,"GSTPS"
,"FTRPS"
,"RDKZP"
,"TRKZP"
,"RUECK"
,"RMZHL"
,"IGMNG"
,"RATID"
,"GROID"
,"CUOBJ"
,"GLUZS"
,"GSUZS"
,"REVLV"
,"RSHTY"
,"RSHID"
,"RSNTY"
,"RSNID"
,"NAUTERM"
,"NAUCOST"
,"STUFE"
,"WEGXX"
,"VWEGX"
,"ARSNR"
,"ARSPS"
,"MAUFNR"
,"LKNOT"
,"RKNOT"
,"PRODNET"
,"IASMG"
,"ABARB"
,"AUFNT"
,"AUFPT"
,"APLZT"
,"NO_DISP"
,"CSPLIT"
,"AENNR"
,"CY_SEQNR"
,"BREAKS"
,"VORGZ_TRM"
,"SICHZ_TRM"
,"TRMDT"
,"GLUZP"
,"GSUZP"
,"GSUZI"
,"GEUZI"
,"GLUPP"
,"GSUPP"
,"GLUPS"
,"GSUPS"
,"CHSCH"
,"KAPT_VORGZ"
,"KAPT_SICHZ"
,"LEAD_AUFNR"
,"PNETSTARTD"
,"PNETSTARTT"
,"PNETENDD"
,"PNETENDT"
,"KBED"
,"KKALKR"
,"SFCPF"
,"RMNGA"
,"GSBTR"
,"VFMNG"
,"NOPCOST"
,"NETZKONT"
,"ATRKZ"
,"OBJTYPE"
,"CH_PROC"
,"KAPVERSA"
,"COLORDPROC"
,"KZERB"
,"CONF_KEY"
,"ST_ARBID"
,"VSNMR_V"
,"TERHW"
,"SPLSTAT"
,"COSTUPD"
,"MAX_GAMNG"
,"MES_ROUTINGID"
,"ADPSP"
,"RMANR"
,"POSNR_RMA"
,"POSNV_RMA"
,"CFB_MAXLZ"
,"CFB_LZEIH"
,"CFB_ADTDAYS"
,"CFB_DATOFM"
,"CFB_BBDPI"
,"OIHANTYP"
,"FSH_MPROD_ORD"
,"FLG_BUNDLE"
,"MILL_RATIO"
,"BMEINS"
,"BMENGE"
,"MILL_OC_ZUSKZ"
,"_CELONIS_CHANGE_DATE"
FROM "590652c7-87a4-46e6-a9e9-60c90cb7c4e3_897d99cb-b81d-4da1-b3da-d6c986f854bf"."AFKO"
UNION ALL
SELECT 
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_9ea3d196-29ab-45e3-b825-4f6b80c543d2' AS "SCHEMA"
,"MANDT"
,"AUFNR"
,"GLTRP"
,"GSTRP"
,"FTRMS"
,"GLTRS"
,"GSTRS"
,"GSTRI"
,"GETRI"
,"GLTRI"
,"FTRMI"
,"FTRMP"
,"RSNUM"
,"GASMG"
,"GAMNG"
,"GMEIN"
,"PLNBEZ"
,"PLNTY"
,"PLNNR"
,"PLNAW"
,"PLNAL"
,"PVERW"
,"PLAUF"
,"PLSVB"
,"PLNME"
,"PLSVN"
,"PDATV"
,"PAENR"
,"PLGRP"
,"LODIV"
,"STLTY"
,"STLBEZ"
,"STLST"
,"STLNR"
,"SDATV"
,"SBMNG"
,"SBMEH"
,"SAENR"
,"STLAL"
,"STLAN"
,"SLSVN"
,"SLSBS"
,"AUFLD"
,"DISPO"
,"AUFPL"
,"FEVOR"
,"FHORI"
,"TERKZ"
,"REDKZ"
,"APRIO"
,"NTZUE"
,"VORUE"
,"PROFID"
,"VORGZ"
,"SICHZ"
,"FREIZ"
,"UPTER"
,"BEDID"
,"PRONR"
,"ZAEHL"
,"MZAEHL"
,"ZKRIZ"
,"PRUEFLOS"
,"KLVARP"
,"KLVARI"
,"RGEKZ"
,"PLART"
,"FLG_AOB"
,"FLG_ARBEI"
,"GLTPP"
,"GSTPP"
,"GLTPS"
,"GSTPS"
,"FTRPS"
,"RDKZP"
,"TRKZP"
,"RUECK"
,"RMZHL"
,"IGMNG"
,"RATID"
,"GROID"
,"CUOBJ"
,"GLUZS"
,"GSUZS"
,"REVLV"
,"RSHTY"
,"RSHID"
,"RSNTY"
,"RSNID"
,"NAUTERM"
,"NAUCOST"
,"STUFE"
,"WEGXX"
,"VWEGX"
,"ARSNR"
,"ARSPS"
,"MAUFNR"
,"LKNOT"
,"RKNOT"
,"PRODNET"
,"IASMG"
,"ABARB"
,"AUFNT"
,"AUFPT"
,"APLZT"
,"NO_DISP"
,"CSPLIT"
,"AENNR"
,"CY_SEQNR"
,"BREAKS"
,"VORGZ_TRM"
,"SICHZ_TRM"
,"TRMDT"
,"GLUZP"
,"GSUZP"
,"GSUZI"
,"GEUZI"
,"GLUPP"
,"GSUPP"
,"GLUPS"
,"GSUPS"
,"CHSCH"
,"KAPT_VORGZ"
,"KAPT_SICHZ"
,"LEAD_AUFNR"
,"PNETSTARTD"
,"PNETSTARTT"
,"PNETENDD"
,"PNETENDT"
,"KBED"
,"KKALKR"
,"SFCPF"
,"RMNGA"
,"GSBTR"
,"VFMNG"
,"NOPCOST"
,"NETZKONT"
,"ATRKZ"
,"OBJTYPE"
,"CH_PROC"
,"KAPVERSA"
,"COLORDPROC"
,"KZERB"
,"CONF_KEY"
,"ST_ARBID"
,"VSNMR_V"
,"TERHW"
,"SPLSTAT"
,"COSTUPD"
,"MAX_GAMNG"
,"MES_ROUTINGID"
,"ADPSP"
,"RMANR"
,"POSNR_RMA"
,"POSNV_RMA"
,"CFB_MAXLZ"
,"CFB_LZEIH"
,"CFB_ADTDAYS"
,"CFB_DATOFM"
,"CFB_BBDPI"
,"OIHANTYP"
,"FSH_MPROD_ORD"
,"FLG_BUNDLE"
,"MILL_RATIO"
,"BMEINS"
,"BMENGE"
,"MILL_OC_ZUSKZ"
,"_CELONIS_CHANGE_DATE"
FROM "590652c7-87a4-46e6-a9e9-60c90cb7c4e3_9ea3d196-29ab-45e3-b825-4f6b80c543d2"."AFKO"
);