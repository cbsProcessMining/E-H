DROP VIEW IF EXISTS P2P_TO;

CREATE VIEW P2P_TO AS (
    SELECT DISTINCT
        LTAK."SCHEMA" -- global job
        , E."SC/PC" -- global job
    	, E."_CASE_KEY" AS _CASE_KEY -- global job
        , E.PRETTY_NAME -- global job
        , LTAK.MANDT
        ,E.EBELN
        ,E.EBELP
    	, LTAK.LGNUM
        , LTAK.TANUM
        , LTAK.BWART
        , LTAK.BWLVS
        , LTAK.TBPRI
        , LTAK.TRART
        , LTAK.BDATU
        , LTAK.BZEIT
        , LTAK.BNAME
        , LTAK.REFNR
        , LTAK.TBNUM
        , LTAK.UBNUM
        -- , LTAK.VBELN
        , LTAK.KQUIT
        , LTAK.QDATU AS QDATEHEAD
        , LTAK.MBLNR
        , LTAK.MJAHR
        , LTAK.BETYP
        , LTAK.BENUM
        , LTAK.DRUKZ
        , LTAK.DRUCK
        , LTAK.TEILK
        , LTAK.KR2SO
        , LTAK.KR2KU
        , LTAK.KDISO
        , LTAK.KZPLA
        , LTAK.PLDAT
        , LTAK.RSNUM
        , LTAK.LZNUM
        , LTAK.BDART
        , LTAK.PKNUM
        , LTAK.PKPOS
        , LTAK.KZLEI
        , LTAK.KISTZ
        , LTAK.KISTP
        , LTAK.PERNR
        , LTAK.SOLWM
        , LTAK.SOLEX
        , LTAK.ISTWM
        -- , LTAK.ZEIEI
        , LTAK.HRSTS
        , LTAK.STDAT
        , LTAK.ENDAT
        , LTAK.STUZT
        , LTAK.ENUZT
        , LTAK.L2SKA
        , LTAK.MINWM
        , LTAK.LGTOR
        , LTAK.LGBZO
        , LTAK.KZVEP
        , LTAK.SWABW
        , LTAK.AUSFB
        , LTAK.SPEZI
        , LTAK.VBTYP
        , LTAK.QUEUE
        -- , LTAK.KGVNQ
        , LTAK.TAPRI
        , LTAK.KVQUI
        , LTAK.HUCON
        , LTAK.NOITM
        , LTAK.KZTRM
        , LTAK.LATER
        , LTAK.PASSD
        , LTAK.MULTL
        -- , LTAP.LGNUM
        -- , LTAP.TANUM
        , LTAP.TAPOS
        , LTAP.TBPOS
        , LTAP.POSNR
        , LTAP.MATNR
        , LTAP.WERKS
        , LTAP.CHARG
        , LTAP.BESTQ
        , LTAP.SOBKZ
        , LTAP.SONUM
        , LTAP.STOFF
        , LTAP.MEINS
        , LTAP.ALTME
        , LTAP.UMREZ
        , LTAP.UMREN
        , LTAP.LETYP
        ,IFNULL(T307T."LETYT", '') as "LETYP_TEXT"
        , LTAP.KZFEH
        , LTAP.LANUM
        , LTAP.KZQUI
        , LTAP.KZNKO
        , LTAP.NULKO
        , LTAP.KZINV
        , LTAP.IVNUM
        , LTAP.PQUIT
        , LTAP.QDATU
        , LTAP.QZEIT
        , LTAP.QNAME
        , LTAP.BRGEW
        , LTAP.GEWEI
        , LTAP.MBPOS
        , LTAP.WEMPF
        , LTAP.ABLAD
        , LTAP.WDATU
        , LTAP.WENUM
        , LTAP.WEPOS
        , LTAP.ZEUGN
        , LTAP.LDEST
        , LTAP.VORGA
        , LTAP.VLTYP
        , LTAP.VLBER
        , LTAP.VLPLA
        , LTAP.VKDYN
        , LTAP.VPPOS
        , LTAP.VANZL
        , LTAP.VANBR
        , LTAP.VSOLM
        , LTAP.VISTM
        , LTAP.VDIFM
        , LTAP.VSOLA
        , LTAP.VISTA
        , LTAP.VDIFA
        , LTAP.VLQNR
        , LTAP.VAPPC
        , LTAP.NLTYP
        , LTAP.NLBER
        , LTAP.NLPLA
        , LTAP.NKDYN
        , LTAP.NPPOS
        , LTAP.NANZL
        , LTAP.NANBR
        , LTAP.NSOLM
        , LTAP.NISTM
        , LTAP.NDIFM
        , LTAP.NSOLA
        , LTAP.NISTA
        , LTAP.NDIFA
        , LTAP.NLQNR
        , LTAP.NAPPC
        , LTAP.RLTYP
        , LTAP.RLBER
        , LTAP.RLPLA
        , LTAP.RPPOS
        , LTAP.RSOLM
        , LTAP.RISTM
        , LTAP.RDIFM
        , LTAP.RSOLA
        , LTAP.RISTA
        , LTAP.RDIFA
        , LTAP.RLQNR
        , LTAP.RAPPC
        , LTAP.DLTYP
        , LTAP.DLPLA
        , LTAP.DLQNR
        , LTAP.DMENG
        , LTAP.DMENA
        , LTAP.KZDIF
        , LTAP.MAKTX
        -- , LTAP.DRUCK
        , LTAP.VLENR
        , LTAP.NLENR
        , LTAP.DLENR
        , LTAP.VLEST
        , LTAP.NLEST
        , LTAP.LELAS
        , LTAP.HOMVE
        , LTAP.POSTY
        , LTAP.ORPOS
        , LTAP.VSUMM
        , LTAP.VBLCH
        , LTAP.NSUMM
        , LTAP.NBLCH
        , LTAP.RSPOS
        , LTAP.VFDAT
        , LTAP.VKAPV
        , LTAP.VKAPA
        , LTAP.NKAPA
        , LTAP.RKAPA
        , LTAP.KZSUB
        , LTAP.QPLOS
        , LTAP.QPLOA
        , LTAP.KZSTI
        , LTAP.RSART
        , LTAP.KZECH
        , LTAP.KOBER
        , LTAP.LGORT
        , LTAP.SOLPO
        , LTAP.ZEIEI
        , LTAP.L2SKR
        , LTAP.VOLUM
        , LTAP.VOLEH
        , LTAP.KZBEF
        , LTAP.IMREL
        , LTAP.NWIRM
        , LTAP.WIRME
        , LTAP.NPLEI
        , LTAP.KBNKZ
        , LTAP.STOAN
        , LTAP.KGVNQ
        , LTAP.PVQUI
        , LTAP.EDATU
        , LTAP.EZEIT
        , LTAP.ENAME
        , LTAP.KZFME
        , LTAP.QUSUB
        , LTAP.FHUTA
        , LTAP.VNEST
        , LTAP.VHILM
        , LTAP.VDUMM
        , LTAP.NDUMM
        , LTAP.VSERI
        , LTAP.HUPIK
        , LTAP.NXIDV
        , LTAP.NOLIS
        , LTAP.NPIPO
        , LTAP.PIPAR
        , LTAP.PCKPF
        -- , LTAP.KZTRM
        -- , LTAP.PASSD
        , LTAP.VBELN
        , LTAP.KZXDK
        , LTAP.KZVAS
        , LTAP.DCNUM
        , LTAP.ZRSTG
        , LTAP.TOVAS
FROM 
   TMP_P2P_EKKO_EKPO AS E
	INNER JOIN EKES AS EKES ON
        EKES."SCHEMA" = E."SCHEMA" -- global job
		AND EKES.MANDT = E.MANDT
        AND EKES.EBELN = E.EBELN
        AND EKES.EBELP = E.EBELP
    INNER JOIN LTAP AS LTAP ON
        EKES."SCHEMA" = LTAP."SCHEMA"
        AND EKES.MANDT = LTAP.MANDT
        AND EKES.VBELN = LTAP.VBELN
        AND EKES.VBELP = LTAP.POSNR
    INNER JOIN LTAK AS LTAK ON
        LTAP."SCHEMA" = LTAK."SCHEMA"
        AND LTAP.MANDT = LTAK.MANDT
        AND LTAP.LGNUM = LTAK.LGNUM
        AND LTAP.TANUM = LTAK.TANUM
    INNER JOIN USR02 AS USR02 ON
        LTAK."SCHEMA" = "USR02"."SCHEMA"
        AND LTAK.MANDT = "USR02"."MANDT"
        AND LTAK.BNAME = "USR02"."BNAME"
    LEFT JOIN T307T as T307T on 
        LTAP."SCHEMA" = T307T."SCHEMA"
        AND LTAP."MANDT" = T307T."MANDT"
        AND LTAP.LGNUM = T307T.LGNUM
        AND LTAP.LETYP = T307T.LETYP
        AND T307T.SPRAS =  '<%=primaryLanguageKey%>'
WHERE EKES.EBTYP LIKE 'L%'

UNION

SELECT DISTINCT
        LTAK.SCHEMA -- global job
         , E."SC/PC" -- global job
    	, E."_CASE_KEY" AS _CASE_KEY  -- global job
        , E.PRETTY_NAME
        , LTAK.MANDT
        ,E.EBELN
        ,E.EBELP
    	, LTAK.LGNUM
        , LTAK.TANUM
        , LTAK.BWART
        , LTAK.BWLVS
        , LTAK.TBPRI
        , LTAK.TRART
        , LTAK.BDATU
        , LTAK.BZEIT
        , LTAK.BNAME
        , LTAK.REFNR
        , LTAK.TBNUM
        , LTAK.UBNUM
        -- , LTAK.VBELN
        , LTAK.KQUIT
        , LTAK.QDATU AS QDATEHEAD
        , LTAK.MBLNR
        , LTAK.MJAHR
        , LTAK.BETYP
        , LTAK.BENUM
        , LTAK.DRUKZ
        , LTAK.DRUCK
        , LTAK.TEILK
        , LTAK.KR2SO
        , LTAK.KR2KU
        , LTAK.KDISO
        , LTAK.KZPLA
        , LTAK.PLDAT
        , LTAK.RSNUM
        , LTAK.LZNUM
        , LTAK.BDART
        , LTAK.PKNUM
        , LTAK.PKPOS
        , LTAK.KZLEI
        , LTAK.KISTZ
        , LTAK.KISTP
        , LTAK.PERNR
        , LTAK.SOLWM
        , LTAK.SOLEX
        , LTAK.ISTWM
        -- , LTAK.ZEIEI
        , LTAK.HRSTS
        , LTAK.STDAT
        , LTAK.ENDAT
        , LTAK.STUZT
        , LTAK.ENUZT
        , LTAK.L2SKA
        , LTAK.MINWM
        , LTAK.LGTOR
        , LTAK.LGBZO
        , LTAK.KZVEP
        , LTAK.SWABW
        , LTAK.AUSFB
        , LTAK.SPEZI
        , LTAK.VBTYP
        , LTAK.QUEUE
        -- , LTAK.KGVNQ
        , LTAK.TAPRI
        , LTAK.KVQUI
        , LTAK.HUCON
        , LTAK.NOITM
        , LTAK.KZTRM
        , LTAK.LATER
        , LTAK.PASSD
        , LTAK.MULTL
        -- , LTAP.LGNUM
        -- , LTAP.TANUM
        , LTAP.TAPOS
        , LTAP.TBPOS
        , LTAP.POSNR
        , LTAP.MATNR
        , LTAP.WERKS
        , LTAP.CHARG
        , LTAP.BESTQ
        , LTAP.SOBKZ
        , LTAP.SONUM
        , LTAP.STOFF
        , LTAP.MEINS
        , LTAP.ALTME
        , LTAP.UMREZ
        , LTAP.UMREN
        , LTAP.LETYP
        ,IFNULL(T307T."LETYT", '') as "LETYP_TEXT"
        , LTAP.KZFEH
        , LTAP.LANUM
        , LTAP.KZQUI
        , LTAP.KZNKO
        , LTAP.NULKO
        , LTAP.KZINV
        , LTAP.IVNUM
        , LTAP.PQUIT
        , LTAP.QDATU
        , LTAP.QZEIT
        , LTAP.QNAME
        , LTAP.BRGEW
        , LTAP.GEWEI
        , LTAP.MBPOS
        , LTAP.WEMPF
        , LTAP.ABLAD
        , LTAP.WDATU
        , LTAP.WENUM
        , LTAP.WEPOS
        , LTAP.ZEUGN
        , LTAP.LDEST
        , LTAP.VORGA
        , LTAP.VLTYP
        , LTAP.VLBER
        , LTAP.VLPLA
        , LTAP.VKDYN
        , LTAP.VPPOS
        , LTAP.VANZL
        , LTAP.VANBR
        , LTAP.VSOLM
        , LTAP.VISTM
        , LTAP.VDIFM
        , LTAP.VSOLA
        , LTAP.VISTA
        , LTAP.VDIFA
        , LTAP.VLQNR
        , LTAP.VAPPC
        , LTAP.NLTYP
        , LTAP.NLBER
        , LTAP.NLPLA
        , LTAP.NKDYN
        , LTAP.NPPOS
        , LTAP.NANZL
        , LTAP.NANBR
        , LTAP.NSOLM
        , LTAP.NISTM
        , LTAP.NDIFM
        , LTAP.NSOLA
        , LTAP.NISTA
        , LTAP.NDIFA
        , LTAP.NLQNR
        , LTAP.NAPPC
        , LTAP.RLTYP
        , LTAP.RLBER
        , LTAP.RLPLA
        , LTAP.RPPOS
        , LTAP.RSOLM
        , LTAP.RISTM
        , LTAP.RDIFM
        , LTAP.RSOLA
        , LTAP.RISTA
        , LTAP.RDIFA
        , LTAP.RLQNR
        , LTAP.RAPPC
        , LTAP.DLTYP
        , LTAP.DLPLA
        , LTAP.DLQNR
        , LTAP.DMENG
        , LTAP.DMENA
        , LTAP.KZDIF
        , LTAP.MAKTX
        -- , LTAP.DRUCK
        , LTAP.VLENR
        , LTAP.NLENR
        , LTAP.DLENR
        , LTAP.VLEST
        , LTAP.NLEST
        , LTAP.LELAS
        , LTAP.HOMVE
        , LTAP.POSTY
        , LTAP.ORPOS
        , LTAP.VSUMM
        , LTAP.VBLCH
        , LTAP.NSUMM
        , LTAP.NBLCH
        , LTAP.RSPOS
        , LTAP.VFDAT
        , LTAP.VKAPV
        , LTAP.VKAPA
        , LTAP.NKAPA
        , LTAP.RKAPA
        , LTAP.KZSUB
        , LTAP.QPLOS
        , LTAP.QPLOA
        , LTAP.KZSTI
        , LTAP.RSART
        , LTAP.KZECH
        , LTAP.KOBER
        , LTAP.LGORT
        , LTAP.SOLPO
        , LTAP.ZEIEI
        , LTAP.L2SKR
        , LTAP.VOLUM
        , LTAP.VOLEH
        , LTAP.KZBEF
        , LTAP.IMREL
        , LTAP.NWIRM
        , LTAP.WIRME
        , LTAP.NPLEI
        , LTAP.KBNKZ
        , LTAP.STOAN
        , LTAP.KGVNQ
        , LTAP.PVQUI
        , LTAP.EDATU
        , LTAP.EZEIT
        , LTAP.ENAME
        , LTAP.KZFME
        , LTAP.QUSUB
        , LTAP.FHUTA
        , LTAP.VNEST
        , LTAP.VHILM
        , LTAP.VDUMM
        , LTAP.NDUMM
        , LTAP.VSERI
        , LTAP.HUPIK
        , LTAP.NXIDV
        , LTAP.NOLIS
        , LTAP.NPIPO
        , LTAP.PIPAR
        , LTAP.PCKPF
        -- , LTAP.KZTRM
        -- , LTAP.PASSD
        , LTAP.VBELN
        , LTAP.KZXDK
        , LTAP.KZVAS
        , LTAP.DCNUM
        , LTAP.ZRSTG
        , LTAP.TOVAS
FROM 
    TMP_P2P_EKKO_EKPO AS E
	INNER JOIN MSEG AS MSEG ON 
        E."SCHEMA" = MSEG."SCHEMA"
        AND E.MANDT = MSEG.MANDT
        AND E.EBELN = MSEG.EBELN
        AND E.EBELP = MSEG.EBELP
    INNER JOIN TMP_TO AS "TO" ON
        MSEG."SCHEMA" = "TO"."SCHEMA"
        AND MSEG.MANDT = "TO".MANDT
        AND MSEG.MJAHR = "TO".MJAHR
        AND MSEG.MBLNR = "TO".MBLNR
        AND MSEG.ZEILE = "TO".MBPOS
    INNER JOIN LTAP AS LTAP ON
        "TO"."SCHEMA" = LTAP."SCHEMA"
        AND "TO".MANDT = LTAP.MANDT
        AND "TO".LGNUM = LTAP.LGNUM
        AND "TO".TANUM = LTAP.TANUM
        AND "TO".TAPOS = LTAP.TAPOS
    INNER JOIN LTAK AS LTAK ON
        LTAP."SCHEMA" = LTAK."SCHEMA"
        AND LTAP.MANDT = LTAK.MANDT
        AND LTAP.LGNUM = LTAK.LGNUM
        AND LTAP.TANUM = LTAK.TANUM
    INNER JOIN USR02 AS USR02 ON
        LTAK."SCHEMA" = "USR02"."SCHEMA"
        AND LTAK.MANDT = "USR02"."MANDT"
        AND LTAK.BNAME = "USR02"."BNAME"
    LEFT JOIN T307T as T307T on 
        LTAP."SCHEMA" = T307T."SCHEMA"
        AND LTAP."MANDT" = T307T."MANDT"
        AND LTAP.LGNUM = T307T.LGNUM
        AND LTAP.LETYP = T307T.LETYP
        AND T307T.SPRAS =  '<%=primaryLanguageKey%>'
    WHERE LTAP.VBELN IS NULL
)
;


