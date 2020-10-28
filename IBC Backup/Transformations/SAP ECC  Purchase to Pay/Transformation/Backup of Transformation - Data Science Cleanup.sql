DELETE FROM
    _CEL_P2P_ACTIVITIES
WHERE
    "EVENTTIME" IS NULL;

DELETE FROM
    _CEL_P2P_ACTIVITIES
WHERE
    "ACTIVITY_EN" IS NULL AND
    "ACTIVITY_DE" IS NULL;

DELETE FROM
    _CEL_P2P_ACTIVITIES
WHERE
    YEAR(EVENTTIME) > 5000 -- ########## temporary fix ###########
;

--DROP TABLE IF EXISTS TMP_P2P_BKPF_BSEG;

--DROP TABLE IF EXISTS TMP_P2P_EKKO_EKPO;

UPDATE _CEL_P2P_ACTIVITIES SET _CELONIS_CHANGE_DATE = NOW();
