DROP VIEW IF EXISTS O2C_VBFA_DELIVERY;
CREATE VIEW "O2C_VBFA_DELIVERY" AS (
            SELECT * 
            FROM "VBFA"
            WHERE
                VBTYP_V IN <%=VBTYP_ORDER%>
                AND VBTYP_N = 'J'
        );

DROP VIEW IF EXISTS O2C_VBFA_INVOICE;
CREATE VIEW "O2C_VBFA_INVOICE" AS (
            SELECT * 
            FROM "VBFA"
            WHERE
                VBTYP_V IN <%=VBTYP_ORDER%>
                AND VBTYP_N IN <%=VBTYP_INVOICES%>
        );


-- DROP VIEW IF EXISTS O2C_VBFA;
-- CREATE VIEW "O2C_VBFA" AS (
--             SELECT * 
--             FROM "O2C_VBFA_V"
--         );
