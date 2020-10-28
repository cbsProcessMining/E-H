DROP VIEW IF EXISTS O2C_TO;
CREATE VIEW O2C_TO AS 
    SELECT DISTINCT
        LTAK."SCHEMA" -- global job
        , MAP.PRETTY_NAME -- global job
        , MAP."SC/PC" -- global job
    	, MAP."PRETTY_NAME" || "V_ORDERS"."MANDT" || "V_ORDERS"."VBELN" || "V_ORDERS"."POSNR" AS "_CASE_KEY" -- global job
    	, LTAK.MANDT
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
FROM VBAP AS V_ORDERS 
    JOIN "SCHEMA_xlsx_MD" as "MAP" on 
    V_ORDERS."SCHEMA" = "MAP"."SCHEMA" -- global job
    JOIN LIPS AS LIPS ON
        "LIPS"."SCHEMA" = "V_ORDERS"."SCHEMA" AND -- global job 
        LIPS.MANDT = V_ORDERS.MANDT AND
        LIPS.VGBEL = V_ORDERS.VBELN AND
        LIPS.VGPOS = V_ORDERS.POSNR
    JOIN LIKP AS LIKP ON
        "LIPS"."SCHEMA" = "LIKP"."SCHEMA" AND -- global job 
        LIPS.MANDT = LIKP.MANDT AND
        LIPS.VBELN = LIKP.VBELN
    JOIN VBFA AS VBFA ON
        "LIPS"."SCHEMA" = "VBFA"."SCHEMA" AND -- global job
        LIPS.MANDT = VBFA.MANDT AND
        LIPS.VBELN = VBFA.VBELV AND
        LIPS.POSNR = VBFA.POSNV
    LEFT JOIN LTAK AS LTAK ON
        VBFA."SCHEMA" = LTAK."SCHEMA" AND
        VBFA.MANDT = LTAK.MANDT AND
        VBFA.LGNUM = LTAK.LGNUM AND
        VBFA.VBELN = LTAK.TANUM
    Left JOIN LTAP as LTAP ON
        LTAP."SCHEMA" = LTAK."SCHEMA"
        AND LTAP.MANDT = LTAK.MANDT
        AND LTAP.LGNUM = LTAK.LGNUM
        AND LTAP.TANUM = LTAK.TANUM
union
SELECT DISTINCT
        LTAK."SCHEMA" -- global job
        , MAP.PRETTY_NAME -- global job
        , MAP."SC/PC" -- global job
    	, MAP."PRETTY_NAME" || "V_ORDERS"."MANDT" || "V_ORDERS"."VBELN" || "V_ORDERS"."POSNR" AS "_CASE_KEY" -- global job
    	, LTAK.MANDT
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
	O2C_VBAP AS "V_ORDERS"
        join "SCHEMA_xlsx_MD" as "MAP"
    using("SCHEMA")
    join "Cases" 
    using(_CASE_KEY)
	JOIN "VBFA" AS "VBFA" ON 1=1
        AND "V_ORDERS"."SCHEMA" = "VBFA"."SCHEMA" -- global job
		AND "V_ORDERS"."MANDT" = "VBFA"."MANDT"
		AND "V_ORDERS"."VBELN" = "VBFA"."VBELV"
		AND "V_ORDERS"."POSNR" = "VBFA"."POSNV"
	JOIN "LIPS" AS "LIPS" ON 1=1
        AND "VBFA"."SCHEMA" = "LIPS"."SCHEMA" -- global job
		AND "VBFA"."MANDT" = "LIPS"."MANDT"
		AND "VBFA"."VBELN" = "LIPS"."VBELN"
		AND "VBFA"."POSNN" = "LIPS"."POSNR" 
	JOIN "LIKP" AS "LIKP" ON 1=1
        AND "LIPS"."SCHEMA" = "LIKP"."SCHEMA" -- global job
		AND "LIPS"."MANDT" = "LIKP"."MANDT"
		AND "LIPS"."VBELN" = "LIKP"."VBELN"
    JOIN LIKP as LIKP_1 ON  -- self join to achieve the PS1090 logic, that the Delivery Number is the same
        LIKP.VBELN = LIKP_1.VBELN AND
        LIKP_1."SCHEMA" = '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10'        
	JOIN "LTAP" AS LTAP ON 1 = 1
        AND "LTAP"."SCHEMA" = '60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' -- global job 
        AND LTAP.VBELN = "LIPS"."VBELN"
        AND LTAP.POSNR = "LIPS"."POSNR"
    JOIN LTAK as LTAK On 1 = 1 
        AND LTAP."SCHEMA" = LTAK."SCHEMA"
        AND LTAP.MANDT = LTAK.MANDT
        AND LTAP.LGNUM = LTAK.LGNUM
        AND LTAP.TANUM = LTAK.TANUM
WHERE 
 MAP."SC/PC" = 'SC' and MAP.PRETTY_NAME <> 'PSG048';

   