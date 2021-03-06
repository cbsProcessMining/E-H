DROP VIEW IF EXISTS "LTAP";

Create VIEW "LTAP" AS(
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_80493315-33aa-43ce-a702-f970bab30f6f' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_80493315-33aa-43ce-a702-f970bab30f6f"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_6caea70a-87a4-41cc-bd4c-61c4829a6860' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_6caea70a-87a4-41cc-bd4c-61c4829a6860"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_d897dfda-15fb-4fa9-968f-90db8694e7cd' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_d897dfda-15fb-4fa9-968f-90db8694e7cd"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_926ef30e-b9b4-4931-887b-a42794341bbf' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_926ef30e-b9b4-4931-887b-a42794341bbf"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_6567a63c-c54f-4edf-a594-a6100441211e' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_6567a63c-c54f-4edf-a594-a6100441211e"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_d0b7b155-1fe2-4d29-89f2-5cfe11acdd05' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_d0b7b155-1fe2-4d29-89f2-5cfe11acdd05"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_62c67a31-0987-4424-b967-64680da71015' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_62c67a31-0987-4424-b967-64680da71015"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_acc25658-cfd5-4696-b4af-aa112af23fba' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_acc25658-cfd5-4696-b4af-aa112af23fba"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_9d804771-eac4-4fde-b23e-39710d5a8b58' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_9d804771-eac4-4fde-b23e-39710d5a8b58"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_1cadd211-41b9-4632-a006-ffe0b103f034' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_1cadd211-41b9-4632-a006-ffe0b103f034"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_9b65d55f-cd2e-4aa7-89ad-af9fac513a95' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_9b65d55f-cd2e-4aa7-89ad-af9fac513a95"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_3bbd20b8-81ce-4068-bc77-212ddfb300c5' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_3bbd20b8-81ce-4068-bc77-212ddfb300c5"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_4d74b0c1-007e-4650-a312-46237a1d746c' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_4d74b0c1-007e-4650-a312-46237a1d746c"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_575c3915-e50d-48c0-a472-da19db3eee29' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_575c3915-e50d-48c0-a472-da19db3eee29"."LTAP"
UNION ALL
SELECT 
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_ff5eeb0b-b3ab-401f-8dc0-e701c4fdbd2a' AS "SCHEMA"
,"MANDT"
,"LGNUM"
,"TANUM"
,"TAPOS"
,"TBPOS"
,"POSNR"
,"MATNR"
,"WERKS"
,"CHARG"
,"BESTQ"
,"SOBKZ"
,"SONUM"
,"STOFF"
,"MEINS"
,"ALTME"
,"UMREZ"
,"UMREN"
,"LETYP"
,"KZFEH"
,"LANUM"
,"KZQUI"
,"KZNKO"
,"NULKO"
,"KZINV"
,"IVNUM"
,"PQUIT"
,"QDATU"
,"QZEIT"
,"QNAME"
,"BRGEW"
,"GEWEI"
,"MBPOS"
,"WEMPF"
,"ABLAD"
,"WDATU"
,"WENUM"
,"WEPOS"
,"ZEUGN"
,"LDEST"
,"VORGA"
,"VLTYP"
,"VLBER"
,"VLPLA"
,"VKDYN"
,"VPPOS"
,"VANZL"
,"VANBR"
,"VSOLM"
,"VISTM"
,"VDIFM"
,"VSOLA"
,"VISTA"
,"VDIFA"
,"VLQNR"
,"VAPPC"
,"NLTYP"
,"NLBER"
,"NLPLA"
,"NKDYN"
,"NPPOS"
,"NANZL"
,"NANBR"
,"NSOLM"
,"NISTM"
,"NDIFM"
,"NSOLA"
,"NISTA"
,"NDIFA"
,"NLQNR"
,"NAPPC"
,"RLTYP"
,"RLBER"
,"RLPLA"
,"RPPOS"
,"RSOLM"
,"RISTM"
,"RDIFM"
,"RSOLA"
,"RISTA"
,"RDIFA"
,"RLQNR"
,"RAPPC"
,"DLTYP"
,"DLPLA"
,"DLQNR"
,"DMENG"
,"DMENA"
,"KZDIF"
,"MAKTX"
,"DRUCK"
,"VLENR"
,"NLENR"
,"DLENR"
,"VLEST"
,"NLEST"
,"LELAS"
,"HOMVE"
,"POSTY"
,"ORPOS"
,"VSUMM"
,"VBLCH"
,"NSUMM"
,"NBLCH"
,"RSPOS"
,"VFDAT"
,"VKAPV"
,"VKAPA"
,"NKAPA"
,"RKAPA"
,"KZSUB"
,"QPLOS"
,"QPLOA"
,"KZSTI"
,"RSART"
,"KZECH"
,"KOBER"
,"LGORT"
,"SOLPO"
,"ZEIEI"
,"L2SKR"
,"VOLUM"
,"VOLEH"
,"KZBEF"
,"IMREL"
,"NWIRM"
,"WIRME"
,"NPLEI"
,"KBNKZ"
,"STOAN"
,"KGVNQ"
,"PVQUI"
,"EDATU"
,"EZEIT"
,"ENAME"
,"KZFME"
,"QUSUB"
,"FHUTA"
,"VNEST"
,"VHILM"
,"VDUMM"
,"NDUMM"
,"VSERI"
,"HUPIK"
,"NXIDV"
,"NOLIS"
,"NPIPO"
,"PIPAR"
,"PCKPF"
,"KZTRM"
,"PASSD"
,"VBELN"
,"KZXDK"
,"KZVAS"
,"FROM_INSP_GUID"
,"TO_INSP_GUID"
,"DIFF_INSP_GUID"
,"RETURN_INSP_GUID"
,"DCNUM"
,"ZRSTG"
,"TOVAS"
,"SGT_SCAT"
,"_CELONIS_CHANGE_DATE"
FROM "60442433-3dbb-4ce6-8ed3-e9bb7238c614_ff5eeb0b-b3ab-401f-8dc0-e701c4fdbd2a"."LTAP"
);