DELETE FROM
    _CEL_PP_ACTIVITIES
WHERE
    "EVENTTIME" IS NULL
;

DELETE FROM
    _CEL_PP_ACTIVITIES
WHERE
    "ACTIVITY_EN" IS NULL OR
    "ACTIVITY_DE" IS NULL
;

--DROP TABLE IF EXISTS TMP_PP_AUFK_AFKO_AFPO;
