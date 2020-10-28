DROP TABLE IF EXISTS TMP_PP_AUFK_AFKO_AFPO;

CREATE TABLE TMP_PP_AUFK_AFKO_AFPO AS (
    SELECT DISTINCT
        MAP."SCHEMA" -- global job
        ,MAP."PRETTY_NAME" -- global job
        ,MAP."PRETTY_NAME" || AFPO.MANDT || AFPO.AUFNR || AFPO.POSNR AS "_CASE_KEY" -- global job
    	,AUFK.MANDT
        ,AUFK.AUFNR
    	,AFPO.POSNR
    	,AUFK.AUTYP
    	,AUFK.BUKRS
    	,AUFK.WERKS
    	,AUFK.GSBER
    	,AUFK.PRCTR
    	,AUFK.KOKRS
    	,AUFK.ERDAT
    	,AUFK.ERNAM
        ,AUFK.ERFZEIT
        ,AFKO.GSTRS
        ,AFKO.GSUZS
        ,AFKO.GSTRI
        ,AFKO.GSUZI
        ,AFKO.GLTRS
        ,AFKO.GLUZS
        ,AFKO.GLTRI
        ,AFKO.GEUZI
        ,AFPO.LTRMI
        ,AFPO.MATNR   	
        ,AFPO.KDAUF
        ,AFPO.KDPOS
    FROM AUFK AS AUFK
    	JOIN AFKO AS AFKO ON 1=1
    		AND AUFK.MANDT = AFKO.MANDT
    		AND AUFK.AUFNR = AFKO.AUFNR
    	JOIN AFPO AS AFPO ON 1=1
    		AND AUFK.MANDT = AFPO.MANDT
    		AND AUFK.AUFNR = AFPO.AUFNR
    JOIN "SCHEMA_xlsx_MD" as "MAP" on 
        AUFK."SCHEMA" = "MAP"."SCHEMA" -- global job
    WHERE 1=1
        AND AUFK.AUTYP IN <%=orderCategories%>
);